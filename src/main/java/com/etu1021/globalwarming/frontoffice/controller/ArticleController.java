package com.etu1021.globalwarming.frontoffice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.client.RestTemplate;

import com.etu1021.globalwarming.utils.Envs;
import com.fasterxml.jackson.databind.JsonNode;



@Controller
public class ArticleController {
	
	@Autowired
	public Envs envs;
	
	@GetMapping(path = "/articles/*-{id}")
	public String list(@PathVariable(required = false) String id, HttpServletRequest request) throws Exception {
		try {
			String url = envs.getBaseUrl() + "/api/article/" + id;
			RestTemplate restTemplate = new RestTemplate();
			JsonNode data = restTemplate.getForObject(url, JsonNode.class);
			for (int row = 0; row < data.size(); row++) {
				request.setAttribute("titre", data.get(row).get("titre").asText());
				request.setAttribute("heading", data.get(row).get("titre").asText());
				request.setAttribute("article", data);
			}
			

			url = envs.getBaseUrl() + "/api/articles_preview";
			request.setAttribute("previews", restTemplate.getForObject(url, JsonNode.class));
		} catch (Exception e) {
			throw e;
		}
		return "article";
	}
}
