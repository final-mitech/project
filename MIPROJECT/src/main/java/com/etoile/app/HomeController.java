package com.etoile.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	//고객 사이트로 연결
	@RequestMapping("/")
	public String home() {
		return "site/main/main";
	}
	
	//관리자 사이트로 연결
	@RequestMapping("/admin")
	public String admin() {
		return "admin/main/loginForm";
	}
}
