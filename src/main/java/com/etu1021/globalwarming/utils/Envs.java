package com.etu1021.globalwarming.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Envs {

	@Value("${spring.datasource.url}")
    private String url;
	@Value("${spring.datasource.username}")
    private String username;
	@Value("${spring.datasource.password}")
    private String password;
	@Value("${base-url}")
	private String baseUrl;
	
	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getUrl() {
		return this.url;
	}
	
	public String getBaseUrl() {
		return this.baseUrl;
	}
}