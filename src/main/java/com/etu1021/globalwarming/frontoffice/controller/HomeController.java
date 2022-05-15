package com.etu1021.globalwarming.frontoffice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import com.etu1021.globalwarming.utils.Envs;
import com.fasterxml.jackson.databind.JsonNode;


@Controller
public class HomeController {

	@Autowired
	public Envs envs;
	
	@GetMapping(path = {"/home"})
	public String home(HttpServletRequest request) {
		String url = envs.getBaseUrl() + "/api/articles_preview";
		RestTemplate restTemplate = new RestTemplate();
		request.setAttribute("articles", restTemplate.getForObject(url, JsonNode.class));
		return "index";
	}
}
