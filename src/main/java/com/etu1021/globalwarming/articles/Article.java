package com.etu1021.globalwarming.articles;

import java.sql.Timestamp;

public class Article {
	int idarticle ;           
	String titre  ;           
	String description;
	String contenus ;
	Timestamp date_de_publication ;
	String url;
	int idcategorie;
	String thumbnail;
	String categorie;
	
	public Article() {}
	
	public Article(int idarticle, String titre, String description, Timestamp date_de_publication,
			String url, String thumbnail, String categorie) {
		super();
		this.idarticle = idarticle;
		this.titre = titre;
		this.description = description;
		this.date_de_publication = date_de_publication;
		this.url = url;
		this.thumbnail = thumbnail;
	}
	
	public Article(int idarticle, String titre, String description, String contenus, Timestamp date_de_publication,
			String url, int idcategorie, String thumbnail) {
		super();
		this.idarticle = idarticle;
		this.titre = titre;
		this.description = description;
		this.contenus = contenus;
		this.date_de_publication = date_de_publication;
		this.url = url;
		this.idcategorie = idcategorie;
		this.thumbnail = thumbnail;
	}
	
	public Article(int idarticle, String titre, String description, String contenus, Timestamp date_de_publication,
			String url, int idcategorie, String thumbnail, String categorie) {
		super();
		this.idarticle = idarticle;
		this.titre = titre;
		this.description = description;
		this.contenus = contenus;
		this.date_de_publication = date_de_publication;
		this.url = url;
		this.idcategorie = idcategorie;
		this.thumbnail = thumbnail;
		this.categorie = categorie;
	}
	
	public int getIdarticle() {
		return idarticle;
	}
	public void setIdarticle(int idarticle) {
		this.idarticle = idarticle;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getContenus() {
		return contenus;
	}
	public void setContenus(String contenus) {
		this.contenus = contenus;
	}
	public Timestamp getDate_de_publication() {
		return date_de_publication;
	}
	public void setDate_de_publication(Timestamp date_de_publication) {
		this.date_de_publication = date_de_publication;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getIdcategorie() {
		return idcategorie;
	}
	public void setIdcategorie(int idcategorie) {
		this.idcategorie = idcategorie;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getCategorie() {
		return categorie;
	}

	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}
	
	
}
