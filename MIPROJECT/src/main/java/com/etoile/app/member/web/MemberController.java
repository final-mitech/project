package com.etoile.app.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etoile.app.member.service.MemberService;
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
	public int memberInsert(MemberVO vo) {
		return memberService.memberInsert(vo);
	}
}
