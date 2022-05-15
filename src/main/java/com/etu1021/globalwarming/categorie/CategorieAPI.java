package com.etu1021.globalwarming.categorie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class CategorieAPI {

	private final CategorieService service;
	
	@Autowired
	public CategorieAPI(CategorieService  service) {
		super();
		this.service = service;
	}
	
	@GetMapping(path = "/api/categorie", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Categorie>> categorie() throws Exception {
		List<Categorie> data = null;
		try {
			data = service.getArticlePreview();
		} catch (Exception e) {
			throw e;
		}
		return ResponseEntity.status(HttpStatus.ACCEPTED).header("Code", HttpStatus.ACCEPTED.toString())
				.header("Code", HttpStatus.ACCEPTED.toString()).body(data);
	}
}
