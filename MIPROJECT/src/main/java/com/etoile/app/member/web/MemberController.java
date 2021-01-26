package com.etoile.app.member.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etoile.app.member.common.AddressVO;
import com.etoile.app.member.service.MemberService;
import com.etoile.app.vo.CouponVO;
import com.etoile.app.vo.GradeVO;
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
		String address = "("+ addr.getPostcode() +") " + addr.getAddress() + ", " + addr.getDetailAddress();
		vo.setAddress(address);
		
		//각 등급별 쿠폰정보 조회 및 쿠폰테이블에 입력
		GradeVO grade = memberService.gradeCoupon(vo.getGrade());
		String[] benefit = grade.getGradeBenefit().split("%");
		for(String str : benefit) {
			CouponVO coupon = new CouponVO();
			coupon.setMemberId(vo.getMemberId());
			coupon.setCouponSort(vo.getGrade());
			coupon.setGradeCoupon(Integer.parseInt(str));
			coupon.setCouponUsed(0);
			memberService.couponInsert(coupon);
		}
		
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
		return "redirect:/";
	}
		
	//로그아웃
	@RequestMapping("site/logout")
	public String logout(MemberVO vo, HttpServletRequest request) {
		//세션에 담긴 값 삭제하기
		request.getSession().invalidate();
		return "redirect:/";
	}
	
	//고객 상세정보
	@RequestMapping("site/memberInfo")
	public String memberInfo(HttpServletRequest request, Model model) {
		String id = (String) request.getSession().getAttribute("id");
		MemberVO vo = memberService.memberSelect(id);
		model.addAttribute("info", vo);
		return "site/my/memberInfo";
		
	}
	
	//고객 쿠폰내역 조회
	@RequestMapping("site/couponInfo")
	public String couponInfo(HttpServletRequest request, Model model) {
		//고객 정보 조회
		String id = (String) request.getSession().getAttribute("id");
		MemberVO vo = memberService.memberSelect(id);
		model.addAttribute("info", vo);
		
		//고객 쿠폰내역 조회
		CouponVO coupon = new CouponVO();
		coupon.setMemberId(id);
		List<CouponVO> list = memberService.couponList(coupon);
		model.addAttribute("coupon", list);
		
		return "site/my/memberCoupon";
	}
}
