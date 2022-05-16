package com.etu1021.globalwarming.admin;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etu1021.globalwarming.databases.Connection;

@Service
public class AdminService {
	private final Connection connection;

	@Autowired
	public AdminService(Connection connection) {
		this.connection = connection;
	}
	
	public ArrayList<Admin> auth(String email, String password) throws Exception {
		ArrayList<Admin> data = new ArrayList<Admin>();
		java.sql.Connection con = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Integer id = null;
		try {
			con = connection.connect();
			preparedStatement = con.prepareStatement(
					"SELECT * FROM Admin WHERE email = ? and mdp = (SELECT digest( ? , 'sha1')::varchar)");
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				data.add(new Admin(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
						resultSet.getString(4)));
			}
			id = data.get(0).getId();
			if (id == null) throw new Exception("Login incorrect");
		} catch (Exception e) {
			throw new Exception("Login incorrect");
		} finally {
			if (resultSet != null)
				resultSet.close();
			if (preparedStatement != null)
				preparedStatement.close();
			if (con != null)
				con.close();
		}
		return data;
	}
}
