package com.etoile.app.rental.web;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.etoile.app.history.common.Paging;
import com.etoile.app.member.common.AddressVO;
import com.etoile.app.member.service.MemberService;
import com.etoile.app.rental.service.RentalService;
import com.etoile.app.vo.CouponVO;
import com.etoile.app.vo.MemberVO;
import com.etoile.app.vo.PickVO;
import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.RentalProductVO;
import com.etoile.app.vo.RentalVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;

@Controller
public class RentalController {
	@Autowired
	private RentalService rentalService;
	@Autowired
	private MemberService memberService;

	// rental메인 물품리스트 페이지
	@RequestMapping("/site/productList")
	public String productList(ProductVO vo, Paging paging, Model model) {
		if (paging == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(8);
		paging.setTotalRecord(rentalService.productCnt(vo));
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		model.addAttribute("paging", paging);
		
		List<ProductVO> productList = rentalService.rentalProductList(vo);
		model.addAttribute("list", productList);
		return "site/rentals/rentalMain";
	}
	// rental메인 물품리스트 인기순(대여순) 페이지
		@RequestMapping("/site/productList2")
		public String productList2(ProductVO vo, Paging paging, Model model) {
			if (paging == null) {
				paging.setPage(1);
			}
			paging.setPageUnit(8);
			paging.setTotalRecord(rentalService.productCnt(vo));
			vo.setStart(paging.getFirst());
			vo.setEnd(paging.getLast());
			model.addAttribute("paging", paging);
			
			List<ProductVO> productList = rentalService.rentalProductList2(vo);
			model.addAttribute("list", productList);
			return "site/rentals/rentalMain";
		}
	

	// 물품상세페이지에서 선택한 날짜값을 가지고 이동하는 결제페이지
	@RequestMapping("/site/payPage.do")
	public String payPage(ProductVO pvo, MemberVO mvo, CouponVO cvo, Model model, HttpServletRequest httpServletRequest) {
		String rentalEnd = httpServletRequest.getParameter("rentalEnd");
		String rentalStart = httpServletRequest.getParameter("rentalStart");
		String totalPay = httpServletRequest.getParameter("totalPay");
		String rentalAddress = httpServletRequest.getParameter("rentalAddress");
		String id = (String) httpServletRequest.getSession().getAttribute("id");
		ProductVO product = rentalService.rentalProductSelect(pvo);
		cvo.setMemberId(id);
		List<CouponVO> coupon = memberService.couponList(cvo);
		MemberVO member = memberService.memberSelect(id);
		model.addAttribute("product", product);
		model.addAttribute("rentalEnd", rentalEnd);
		model.addAttribute("rentalStart", rentalStart);
		model.addAttribute("rentalAddress", rentalAddress);
		model.addAttribute("totalPay", totalPay);
		model.addAttribute("member", member);
		model.addAttribute("coupon", coupon);
		return "site/rentals/payPage";
	}

	// payPage 에서 결제완료시 데이터 rental 테이블에 입력후 MyPageRental.do 실행
	@RequestMapping("/site/RentalInsert.do")
	public String RentalInsert(RentalVO vo, AddressVO ad, CouponVO cvo, Model model, HttpServletRequest httpServletRequest) {
		String memberId = (String) httpServletRequest.getSession().getAttribute("id");
		String viewPath = null;
		String rentalAddress = ad.getAddress() + ", " +ad.getDetailAddress();
		String rentalPay = vo.getRentalPay().replace(",", "");
		vo.setMemberId(memberId);
		vo.setRentalPay(rentalPay);
		vo.setRentalAddress(rentalAddress);
		int n = rentalService.RentalInsert(vo);
		int m = rentalService.usedCoupon(cvo);
		String rentalEnd = httpServletRequest.getParameter("rentalEnd");
		String rentalStart = httpServletRequest.getParameter("rentalStart");
		
		if (n != 0) {
			model.addAttribute("rentalEnd", rentalEnd);
			model.addAttribute("rentalStart", rentalStart);
			viewPath = "redirect:rentalList.do";
		}
		return viewPath;
	}
	
	//pick테이블에 정보가 없을경우에 정보입력, 정보가 있을경우에 정보삭제
	 @RequestMapping("/site/productPickInsert.do")
	 @ResponseBody
	 public Object productPickInsert(PickVO vo, Model model, HttpServletRequest httpServletRequest) {
		int Pick;
		String memberId = (String) httpServletRequest.getSession().getAttribute("id");
		vo.setMemberId(memberId);
		int n = rentalService.selectPick(vo);
		if (n != 1) {
			Pick = rentalService.productPickInsert(vo);
		} else {
			Pick = rentalService.pickDelete(vo);
		}
		 return null;
	 }

	// 마이페이지-rental 메인 (결제완료시 자동이동)
	@RequestMapping("/site/rentalList.do")
	public String rentalList(RentalVO vo1, Model model, HttpServletRequest httpServletRequest) {
		String memberId = (String) httpServletRequest.getSession().getAttribute("id");
		vo1.setMemberId(memberId);
		String rentalEnd = httpServletRequest.getParameter("rentalEnd");
		String rentalStart = httpServletRequest.getParameter("rentalStart");
		String rentalPay = httpServletRequest.getParameter("totalPay");
		List<RentalVO> rentalList = rentalService.rentalList(vo1);
		model.addAttribute("list", rentalList);
		model.addAttribute("rentalEnd", rentalEnd);
		model.addAttribute("rentalStart", rentalStart);
		model.addAttribute("rentalPay", rentalPay);

		return "site/my/MypageRental";
	}
	
	//마이페이지-rental (마이페이지에서 rental버튼 클릭시)
	@RequestMapping("/site/MypageRental.do")
	public String MypageRental(RentalVO vo, Model model, HttpServletRequest httpServletRequest) {
		String memberId = (String) httpServletRequest.getSession().getAttribute("id");
		vo.setMemberId(memberId);
		List<RentalVO> rentalList = rentalService.rentalList(vo);
		model.addAttribute("list",rentalList);
		return "site/my/MypageRental";
	}
	
	//마이페이지-pick (마이페이지에서 pick버튼 클릭)
	@RequestMapping("/site/pickList.do")
	public String pickList(PickVO vo, Model model, HttpServletRequest httpServletRequest) {
		String memberId = (String) httpServletRequest.getSession().getAttribute("id");
		vo.setMemberId(memberId);
		List<PickVO> pickList = rentalService.pickList(vo);
		model.addAttribute("list", pickList);
		return "site/my/mypagePick";
	}
	
	//pick테이블에서 조회
	@RequestMapping("/site/selectPick.do")
	@ResponseBody
	public int selectPick(PickVO vo, HttpServletRequest httpServletRequest) {
		String memberId = (String) httpServletRequest.getSession().getAttribute("id");
		vo.setMemberId(memberId);
		int pickList = rentalService.selectPick(vo);
		return pickList;
	}

	// rental 물품리스트에서 하나 선택시 이동되는 물품상세페이지
	@RequestMapping("/site/productDetail")
	public String productDetail(ProductVO pvo, RentalVO rvo, Model model) {
		ProductVO product = new ProductVO();
		RentalVO rental = new RentalVO();
		product = rentalService.rentalProductSelect(pvo);
		rental = rentalService.rentalRentalSelect(rvo);
		model.addAttribute("product", product);
		model.addAttribute("rental",rental);
		return "site/rentals/productDetail";
	}

	// rental 물품리스트 검색&페이징기능
	@RequestMapping("/site/productSearch")
	public String searchList(ProductVO vo, Paging paging, Model model) {
		if (paging == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(8);
		paging.setTotalRecord(rentalService.productCnt(vo));
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		model.addAttribute("paging", paging);
		List<ProductVO> SearchList = rentalService.searchList(vo);
		model.addAttribute("list", SearchList);
		return "site/rentals/rentalMain";
	}
	
	// 관리자 사이트에서 rental 요청건 리스트출력
	@RequestMapping("/admin/rentalList.a")
	public String allRentalList (RentalVO vo, Model model) {
		List<RentalVO> allRentalList = rentalService.allRentalList(vo);
		model.addAttribute("list", allRentalList);
		return "admin/rental/rentalRequest";
	}
	
	//대여목록 엑셀다운로드
	@RequestMapping("/admin/rentalExcel.a")
	public ModelAndView rentalExcel (RentalVO vo, Model model) {
		vo.setRentalWaybill(null);
		List<Map<String, Object>> list = rentalService.rentalExcel(vo); 
		HashMap<String, Object> map = new HashMap<String, Object>();
		String[] headerList = {"RENTAL_ID", "PRODUCT_ID", "PRODUCT_NAME","MEMBER_ID", "NAME", "PHONE", "RENTAL_ADDRESS",
				"RENTAL_START", "RENTAL_END", "RENTAL_PAY","RENTAL_WAYBILL"};
		List<String> header = new ArrayList<>(Arrays.asList(headerList));

		map.put("headers", header);
		map.put("filename", "rentalList");
		map.put("datas", list);
		
	return new ModelAndView("commonExcelView", map);
	}
	
	// 관리자 사이트에서 배송정보가 입력된 rental건
	@RequestMapping("/admin/rentalReList.a")
	public String rentalReList (RentalVO vo, Model model) {
		List<RentalVO> rentalReList = rentalService.rentalReList(vo);
		model.addAttribute("list", rentalReList);
		return "admin/rental/rentalReList";
	}
	//대여회수목록 엑셀다운로드
		@RequestMapping("/admin/rentalReExcel.a")
		public ModelAndView rentalReExcel (RentalVO vo, Model model, HttpServletRequest httpServletRequest) {
			String rentalWaybill = httpServletRequest.getParameter("rentalWaybill");
			vo.setRentalWaybill(rentalWaybill);
			List<Map<String, Object>> list = rentalService.rentalReExcel(vo); 
			HashMap<String, Object> map = new HashMap<String, Object>();
			String[] headerList = {"RENTAL_ID", "PRODUCT_ID", "PRODUCT_NAME","MEMBER_ID", "NAME", "PHONE", "RENTAL_ADDRESS",
					"RENTAL_START", "RENTAL_END", "RENTAL_PAY","RENTAL_WAYBILL"};
			List<String> header = new ArrayList<>(Arrays.asList(headerList));

			map.put("headers", header);
			map.put("filename", "rentalList");
			map.put("datas", list);
			
		return new ModelAndView("commonExcelView", map);
		}
	
	
	// rental요청리스트에서 송장입력시 rental테이블에 번호등록
	@RequestMapping("/admin/updateWaybill.a")
	public String updateWaybill (RentalVO vo, ProductVO vo2,Model model,HttpServletRequest httpServletRequest) {
		int updateWaybill = rentalService.updateWaybill(vo);
		int updateStatus = rentalService.updateStatus(vo2);
		
		return "redirect:rentalList.a";
	}
	
	//대여된상품 회수완료변경
	@RequestMapping("/admin/rentalProductStatus.a")
	public String rentalProductStatus (RentalProductVO vo, Model model, HttpServletRequest httpServletRequest) {
		String rentalProductStatus = httpServletRequest.getParameter("ProductStatus");
		model.addAttribute(rentalProductStatus);
		int productStatus = rentalService.rentalProductStatus(vo);
		return "redirect:rentalReList.a";
	}
	
	//관리자 rental 통계차트
	@RequestMapping("/admin/rentalStatistics.a")
	public String rentalStatistics (RentalVO vo, Model model, HttpServletRequest httpServletRequest) throws JsonProcessingException {
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		String date = simpleDate.format(today);
		System.out.println(date);
		vo.setDate(date);
		List<RentalVO> rental = rentalService.selectMonthRental(vo);
		
		ObjectMapper map = new ObjectMapper();
		
		model.addAttribute("map", map.writeValueAsString(rental));
		model.addAttribute("rental", rental);
		
		return "admin/rental/rentalStatistics";
	}
	
	
	
}
