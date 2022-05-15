package com.etu1021.globalwarming.backoffice.controller;

import javax.servlet.http.HttpServletRequest;

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

import com.etu1021.globalwarming.articles.Article;
import com.etu1021.globalwarming.articles.ArticleService;
import com.etu1021.globalwarming.databases.Connection;
import com.etu1021.globalwarming.utils.Envs;
import com.etu1021.globalwarming.utils.FileUpload;
import com.fasterxml.jackson.databind.JsonNode;

@Controller
public class ArticleCRUD {

	@Autowired
	public Envs envs;
	
	private ArticleService service;
	private final Connection connection;
	
	@Autowired
	public ArticleCRUD(ArticleService service, Connection connection) {
		super();
		this.service = service;
		this.connection = connection;
	}
	
	@GetMapping(path = "/bo/article")
	public String form(@PathVariable(required = false) String id, HttpServletRequest request) throws Exception {
		try {
			String url = envs.getBaseUrl() + "/api/categorie";
			RestTemplate restTemplate = new RestTemplate();
			JsonNode data = restTemplate.getForObject(url, JsonNode.class);
			for (int row = 0; row < data.size(); row++) {
				request.setAttribute("categorie", data);
			}
			
		} catch (Exception e) {
			throw e;
		}
		return "article_CRUD";
	}
	
	@PostMapping(path = "/bo/create_article")
	public String createArticle(Article formData, @RequestParam("images_thmb") MultipartFile multipartFile) throws Exception {

		java.sql.Connection con = null;
		
		try {
			
			con = connection.connect();
			con.setAutoCommit(false);
			
			String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());

			String uploadDir = "src\\main\\resources\\static\\assets\\images\\gw";
			FileUpload.saveFile(uploadDir, fileName, multipartFile);
//			
//			Article newArticle = new Article();
//			newArticle.setTitre(formData.getFirst("Titre"));
//			newArticle.setDescription(formData.getFirst("Description"));
//			newArticle.setContenus(formData.getFirst("Contenus"));
//			newArticle.setUrl(toSlug(formData.getFirst("Titre")));
//			newArticle.setIdcategorie(Integer.parseInt(formData.getFirst("Categorie")));
			formData.setThumbnail("assets/images/gw/"+fileName);
			service.save(con, formData);
			
			
			con.commit();
		} catch (Exception e) {
			throw e;
		} finally {
			if(con!=null) con.close();
		}
		return "redirect:/bo/article/";
	}

	private String toSlug(String first) {
		// TODO Auto-generated method stub
		return null;
	}
}
