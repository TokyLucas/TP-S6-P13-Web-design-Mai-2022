package com.etu1021.globalwarming.backoffice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.etu1021.globalwarming.admin.Admin;
import com.etu1021.globalwarming.admin.AdminService;
import com.etu1021.globalwarming.articles.Article;
import com.etu1021.globalwarming.articles.ArticleService;
import com.etu1021.globalwarming.databases.Connection;
import com.etu1021.globalwarming.utils.Envs;
import com.etu1021.globalwarming.utils.FileUpload;
import com.fasterxml.jackson.databind.JsonNode;

@Controller
public class AdminController {

	@Autowired
	public Envs envs;
	
	private AdminService service;
	private final Connection connection;
	
	@Autowired
	public AdminController(AdminService service, Connection connection) {
		super();
		this.service = service;
		this.connection = connection;
	}
	
	@GetMapping(path = "/admin/login")
	public String form() throws Exception {
		return "login";
	}
	
	@PostMapping(path = "/admin/auth")
	public String auth(@RequestBody MultiValueMap<String, String> formData, HttpServletRequest request) throws Exception {
		Admin creds = null;
		try {
			HttpSession session = request.getSession();
			ArrayList<Admin> temp = service.auth(formData.getFirst("Email"), formData.getFirst("mdp"));
			if(temp != null) {
				if(temp.size() ==1 ) {
					creds = temp.get(0); 
					session.setAttribute("admin", creds);
				}
			}
		} catch (Exception e) {
			return "redirect:/admin/login";
		}
		return "redirect:/bo/article";
	}
	
	@GetMapping(path = "/admin/logout")
	public String logout(HttpServletRequest request) throws Exception {
		try {
			HttpSession session = request.getSession();
			session.removeAttribute("admin");
		} catch (Exception e) {
			return "redirect:/admin/login";
		}
		return "redirect:/admin/login";
	}
}
