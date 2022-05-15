package com.etu1021.globalwarming.articles;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.ArrayList;
import java.util.Locale;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etu1021.globalwarming.databases.Connection;

@Service
public class ArticleService {

	private final Connection connection;

	@Autowired
	public ArticleService(Connection connection) {
		this.connection = connection;
	}

	public ArrayList<Article> getArticlePreview() throws Exception {
		ArrayList<Article> data = new ArrayList<Article>();
		java.sql.Connection con = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			con = connection.connect();
			preparedStatement = con.prepareStatement("SELECT * FROM articles_preview");
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Article temp = new Article();
				temp.setIdarticle(resultSet.getInt(1));
				temp.setTitre(resultSet.getString(2));
				temp.setDescription(resultSet.getString(3));
				temp.setDate_de_publication(resultSet.getTimestamp(4));
				temp.setUrl(resultSet.getString(5));
				temp.setThumbnail(resultSet.getString(6));
				temp.setCategorie(resultSet.getString(7));
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

	public ArrayList<Article> getArticle(int id) throws Exception {
		ArrayList<Article> data = new ArrayList<Article>();
		java.sql.Connection con = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			con = connection.connect();
			preparedStatement = con.prepareStatement("SELECT * FROM articles_details WHERE idArticle = ?");
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Article temp = new Article();
				temp.setIdarticle(resultSet.getInt(1));
				temp.setTitre(resultSet.getString(2));
				temp.setDescription(resultSet.getString(3));
				temp.setContenus(resultSet.getString(4));
				temp.setDate_de_publication(resultSet.getTimestamp(5));
				temp.setUrl(resultSet.getString(6));
				temp.setIdcategorie(resultSet.getInt(7));
				temp.setThumbnail(resultSet.getString(8));
				temp.setCategorie(resultSet.getString(9));
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

	public int save(java.sql.Connection con, Article newArticle) throws Exception {
		int results = 0;
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedStatement_url = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = con.prepareStatement(
					"INSERT INTO Articles (titre, description, contenus, date_de_publication, idcategorie, thumbnail) VALUES (?,?,?,current_date,?,?)",
					PreparedStatement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, newArticle.getTitre());
			preparedStatement.setString(2, newArticle.getDescription());
			preparedStatement.setString(3, newArticle.getContenus());
			preparedStatement.setInt(4, newArticle.getIdcategorie());
			preparedStatement.setString(5, newArticle.getThumbnail());

			preparedStatement.executeUpdate();

			ResultSet set = preparedStatement.getGeneratedKeys();
			while (set.next())
				results = set.getInt(1);
			

			preparedStatement_url = con.prepareStatement("UPDATE Articles SET url = ? WHERE idarticle = ?",
					PreparedStatement.RETURN_GENERATED_KEYS);

			preparedStatement_url.setString(1, toSlug(newArticle.getTitre()+" "+results));
			preparedStatement_url.setInt(2, results);
			preparedStatement_url.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			if (resultSet != null)
				resultSet.close();
			if (preparedStatement != null)
				preparedStatement.close();
		}
		return results;
	}

	public int updateUrl(java.sql.Connection con, Article newArticle) throws Exception {
		int last_id = 0;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {

			preparedStatement = con.prepareStatement("UPDATE Articles SET url = ? WHERE idarticle = ?",
					PreparedStatement.RETURN_GENERATED_KEYS);

			ResultSet set = preparedStatement.getGeneratedKeys();
			while (set.next())
				last_id = set.getInt(1);

			preparedStatement.setString(1, toSlug(newArticle.getTitre()+" "+last_id));
			preparedStatement.setInt(2, last_id);

			preparedStatement.executeUpdate();

		} catch (Exception e) {
			throw e;
		} finally {
			if (resultSet != null)
				resultSet.close();
			if (preparedStatement != null)
				preparedStatement.close();
		}
		return last_id;
	}

	private static final Pattern NONLATIN = Pattern.compile("[^\\w-]");
	private static final Pattern WHITESPACE = Pattern.compile("[\\s]");

	public static String toSlug(String input) {
		String nowhitespace = WHITESPACE.matcher(input).replaceAll("-");
		String normalized = Normalizer.normalize(nowhitespace, Form.NFD);
		String slug = NONLATIN.matcher(normalized).replaceAll("");
		return slug.toLowerCase(Locale.ENGLISH);
	}
}
