package com.etoile.app.admin.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etoile.app.admin.mapper.AdminInfoMapper;
import com.etoile.app.vo.AdminInfoVO;

@Controller
public class AdminInfoController {

	@Autowired
	AdminInfoMapper adminInfoService;
	
	//로그인 결과값 돌려주기
	@RequestMapping("admin/loginResult")
	@ResponseBody
	public int loginResult(AdminInfoVO vo) {
		int result = adminInfoService.adminLogin(vo);	
		return result;
	}
	
	//로그인 성공 시 처리
	@RequestMapping("admin/login")
	public String login(AdminInfoVO vo, HttpServletRequest request) {
		//세션에 값 담기
		request.getSession().setAttribute("admin", vo.getId());
		return "redirect:/admin";
	}
		
	//로그아웃
	@RequestMapping("admin/logout.a")
	public String logout(AdminInfoVO vo, HttpServletRequest request) {
		//세션에 담긴 값 삭제하기
		request.getSession().invalidate();
		return "redirect:/admin";
	}
}
