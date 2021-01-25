package com.etoile.app.member.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etoile.app.member.service.MemberService;
import com.etoile.app.vo.AddressVO;
import com.etoile.app.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//회원가입 페이지
	@RequestMapping("site/joinForm")
	public String joinForm() {
		return "site/member/joinForm";
	}
		
	//아이디 중복체크
	@RequestMapping("site/idChecked")
	@ResponseBody
	public int idChecked(MemberVO vo) {
		return memberService.idChecked(vo);	
	}
	
	//회원 등록
	@RequestMapping("site/memberInsert")
	public String memberInsert(MemberVO vo, AddressVO addr) {
		//주소 처리
		String address = "("+ addr.getPostcode() +") " + addr.getAddress() + " " + addr.getDetailAddress();
		vo.setAddress(address);

		memberService.memberInsert(vo);
		return "site/member/joinFormResult";
	}
	
	//로그인 페이지
	@RequestMapping("site/loginForm")
	public String loginForm() {
		return "site/member/loginForm";
	}
	
	//로그인 결과값 돌려주기
	@RequestMapping("site/loginResult")
	@ResponseBody
	public int loginResult(MemberVO vo) {
		int result = memberService.login(vo);	
		return result;
	}
	
	//로그인 성공 시 처리
	@RequestMapping("site/login")
	public String login(MemberVO vo, HttpServletRequest request) {
		//세션에 값 담기
		request.getSession().setAttribute("id", vo.getMemberId());
		return "";
	}
		
	//로그아웃
	@RequestMapping("site/logout")
	public String logout(MemberVO vo, HttpServletRequest request) {
		//세션에 담긴 값 삭제하기
		request.getSession().removeAttribute("id");
		return "";
	}
}
