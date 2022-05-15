package com.etu1021.globalwarming;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@SpringBootApplication
@Controller
public class GlobalWarmingApplication {

	public static void main(String[] args) {
		SpringApplication.run(GlobalWarmingApplication.class, args);
	}
	
	@GetMapping(path = "/")
	public String get() {
		return "redirect:/home";
	}

}
