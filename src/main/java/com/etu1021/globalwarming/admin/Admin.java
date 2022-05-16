package com.etu1021.globalwarming.admin;

import java.util.regex.Pattern;

public class Admin {
	int id;
	String nom, email, mdp;

	public Admin() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) throws Exception {
		if (isValid(email)) 
			this.email = email;
		else
			throw new Exception("Email invalid");
	}

	public String getMdp() {
		return mdp;
	}

	public void setMdp(String mdp) throws Exception {
		if(mdp.length()>=8)
			this.mdp = mdp;
		else if(mdp.length() < 8)
			throw new Exception("Mot de passe doit etre au moins 8 character");
	}

	public Admin(int id, String nom, String email, String mdp) throws Exception {
		super();
		setId(id);
		setNom(nom);
		setEmail(email);
		setMdp(mdp);
	}
	
	public static boolean isValid(String email)
    {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+
                            "[a-zA-Z0-9_+&*-]+)*@" +
                            "(?:[a-zA-Z0-9-]+\\.)+[a-z" +
                            "A-Z]{2,7}$";
                              
        Pattern pat = Pattern.compile(emailRegex);
        if (email == null)
            return false;
        return pat.matcher(email).matches();
    }
}
