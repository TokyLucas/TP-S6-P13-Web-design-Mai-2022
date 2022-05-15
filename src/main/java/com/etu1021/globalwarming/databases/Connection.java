package com.etu1021.globalwarming.databases;

import java.sql.DriverManager;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etu1021.globalwarming.utils.Envs;



@Service
public class Connection{

	private final Envs envs;
	
	@Autowired
	public Connection(Envs envs) {
		this.envs = envs;
	}
	
	public java.sql.Connection connect() throws Exception {
		String url =  envs.getUrl();
		String user = envs.getUsername();
		String password = envs.getPassword();

        java.sql.Connection conn = null;
        
        try {
            conn = DriverManager.getConnection(url, user, password);
            conn.setAutoCommit(false);
        } catch (SQLException e) {
            throw e;
        }
        return conn;
    }
}

