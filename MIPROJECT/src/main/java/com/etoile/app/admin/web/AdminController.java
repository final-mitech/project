package com.etoile.app.admin.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.etoile.app.admin.mapper.AdminInfoMapper;
import com.etoile.app.auction.service.AuctionService;
import com.etoile.app.funding.FundingVO;
import com.etoile.app.funding.service.FundingService;
import com.etoile.app.history.common.Paging;
import com.etoile.app.member.common.RecordVO;
import com.etoile.app.member.service.MemberService;
import com.etoile.app.vo.AdminInfoVO;
import com.etoile.app.vo.AuctionVO;
import com.etoile.app.vo.MemberVO;

@Controller
public class AdminController {

	// 관리자 로그인 서비스
	@Autowired
	AdminInfoMapper adminInfoService;

	// 로그인 결과값 돌려주기
	@RequestMapping("admin/loginResult")
	@ResponseBody
	public int loginResult(AdminInfoVO vo) {
		int result = adminInfoService.adminLogin(vo);
		return result;
	}

	// 로그인 성공 시 처리
	@RequestMapping("admin/login")
	public String login(AdminInfoVO vo, HttpServletRequest request) {
		// 세션에 값 담기
		request.getSession().setAttribute("admin", vo.getId());
		return "redirect:/admin/main.a";
	}

	// 로그아웃
	@RequestMapping("admin/logout.a")
	public String logout(AdminInfoVO vo, HttpServletRequest request) {
		// 세션에 담긴 값 삭제하기
		request.getSession().invalidate();
		return "redirect:/admin";
	}

	// 고객관련 정보조회 서비스
	@Autowired
	private MemberService memberService;

	// 개인고객 리스트 조회하기
	@RequestMapping("admin/memberList.a")
	public String memberList(MemberVO vo, Paging paging, Model model) {
		// 구분조건 확인하기
		if (vo.getGrade() == null) {
			vo.setGrade("MEMBER");
		}

		// 페이징 처리
		if (paging == null) {
			paging.setPage(1);
		}
		paging.setTotalRecord(memberService.memberCount(vo));
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		model.addAttribute("paging", paging);

		// 정렬기준 조회
		String status = "all";
		if (vo != null) {
			status = vo.getGrade();
		}
		model.addAttribute("sort", status);

		// 데이터 조회
		List<MemberVO> memberlist = memberService.memberList(vo);
		model.addAttribute("list", memberlist);

		return "admin/member/memberList";
	}

	// 기업고객 리스트 조회하기
	@RequestMapping("admin/businessList.a")
	public String businessList(MemberVO vo, Paging paging, Model model) {
		// 구분조건 확인하기
		if (vo.getGrade() == null) {
			vo.setGrade("BUSINESS");
		}

		// 페이징 처리
		if (paging == null) {
			paging.setPage(1);
		}
		paging.setTotalRecord(memberService.memberCount(vo));
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		model.addAttribute("paging", paging);

		// 데이터 조회
		List<MemberVO> memberlist = memberService.memberList(vo);
		model.addAttribute("list", memberlist);

		return "admin/member/businessList";
	}

	// 고객 상세정보 및 대여이력 조회하기
	@RequestMapping("admin/memberSelect.a")
	public String memberSelect(MemberVO vo, Model model) {
		// 고객 상세정보 조회
		vo = memberService.memberSelect(vo.getMemberId());
		model.addAttribute("info", vo);

		// 고객 대여이력 조회
		List<RecordVO> rentalList = memberService.memberRentalList(vo.getMemberId());
		model.addAttribute("list", rentalList);

		return "admin/member/memberRental";
	}

	// 개인고객 정보 엑셀 다운로드
	@RequestMapping("admin/memberDownload.a")
	public ModelAndView memberDownload(MemberVO vo, HttpServletResponse response) throws IOException {
		vo.setGrade("MEMBER");
		List<Map<String, Object>> list = memberService.memberDownload(vo);
		List<String> header = new ArrayList<String>();
		Map<String, Object> temp = list.get(0);
		
		for (String key : temp.keySet()) {
			header.add(key);
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("headers", header);
		map.put("filename", "download");
		map.put("datas", list);
		return new ModelAndView("commonExcelView", map);
	}
	
	// 기업고객 정보 엑셀 다운로드
	@RequestMapping("admin/businessDownload.a")
	public ModelAndView businessDownload(MemberVO vo, HttpServletResponse response) throws IOException {
		vo.setGrade("BUSINESS");
		List<Map<String, Object>> list = memberService.memberDownload(vo);
		List<String> header = new ArrayList<String>();
		Map<String, Object> temp = list.get(0);
		
		for (String key : temp.keySet()) {
			header.add(key);
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("headers", header);
		map.put("filename", "download");
		map.put("datas", list);
		return new ModelAndView("commonExcelView", map);
	}

	@Autowired
	private FundingService fundingService;
	@Autowired
	private AuctionService auctionService;

	// 메인페이지
	@RequestMapping("admin/main.a")
	public String main(Model model) {
		// 펀딩 요청 리스트
		List<FundingVO> fundingList = fundingService.fundingList(null);
		model.addAttribute("fundingList", fundingList);

		// 경매 요청 리스트
		AuctionVO auctionVO = new AuctionVO();
		auctionVO.setStart(1);
		auctionVO.setEnd(5);
		List<AuctionVO> auctionList = auctionService.getAuction(auctionVO);
		model.addAttribute("auctionList", auctionList);

		// 대여 요청 리스트
		List<RecordVO> rentalList = memberService.memberRentalList(null);
		model.addAttribute("rentalList", rentalList);

		return "admin/main/main";
	}
}
