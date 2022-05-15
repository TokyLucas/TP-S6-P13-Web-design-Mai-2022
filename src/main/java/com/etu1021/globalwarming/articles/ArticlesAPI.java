package com.etu1021.globalwarming.articles;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class ArticlesAPI {

	private final ArticleService service;
	
	@Autowired
	public ArticlesAPI(ArticleService service) {
		super();
		this.service = service;
	}
	
	@GetMapping(path = "/api/articles_preview", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Article>> preview() throws Exception {
		List<Article> data = null;
		try {
			data = service.getArticlePreview();
		} catch (Exception e) {
			throw e;
		}
		return ResponseEntity.status(HttpStatus.ACCEPTED).header("Code", HttpStatus.ACCEPTED.toString())
				.header("Code", HttpStatus.ACCEPTED.toString()).body(data);
	}
	
	@GetMapping(path = "/api/article/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Article>> getAll(@PathVariable(required = false) String id) throws Exception {
		List<Article> data = null;
		try {
			data = service.getArticle(Integer.parseUnsignedInt(id));
		} catch (Exception e) {
			throw e;
		}
		return ResponseEntity.status(HttpStatus.ACCEPTED).header("Code", HttpStatus.ACCEPTED.toString())
				.header("Code", HttpStatus.ACCEPTED.toString()).body(data);
	}
}
