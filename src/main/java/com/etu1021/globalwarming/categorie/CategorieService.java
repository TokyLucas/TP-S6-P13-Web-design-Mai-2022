package com.etu1021.globalwarming.categorie;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etu1021.globalwarming.databases.Connection;



@Service
public class CategorieService {
	
	private final Connection connection;

	@Autowired
	public CategorieService(Connection connection) {
		this.connection = connection;
	}
	
	public ArrayList<Categorie> getArticlePreview() throws Exception {
		ArrayList<Categorie> data = new ArrayList<Categorie>();
		java.sql.Connection con = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			con = connection.connect();
			preparedStatement = con.prepareStatement("SELECT * FROM Categorie");
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Categorie temp = new Categorie();
				temp.setId(resultSet.getInt(1));
				temp.setNom(resultSet.getString(2));
				data.add(temp);
			}
		} catch (Exception e) {
			throw e;
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
