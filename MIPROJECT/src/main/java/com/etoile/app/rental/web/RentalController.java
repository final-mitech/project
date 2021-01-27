package com.etoile.app.rental.web;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etoile.app.history.common.Paging;
import com.etoile.app.rental.service.RentalService;
import com.etoile.app.vo.PickVO;
import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.RentalVO;

@Controller
public class RentalController {
	@Autowired
	private RentalService rentalService;

	// rental메인 물품리스트 페이지
	@RequestMapping("/site/productList.do")
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

	// payPage 에서 결제완료시 데이터 rental 테이블에 입력후 MyPageRental.do 실행
	@RequestMapping("/site/RentalInsert.do")
	public String RentalInsert(RentalVO vo, Model model, HttpServletRequest httpServletRequest) {
		String viewPath = null;
		int n = rentalService.RentalInsert(vo);
		String rentalEnd = httpServletRequest.getParameter("rentalEnd");
		String rentalStart = httpServletRequest.getParameter("rentalStart");
		String address = httpServletRequest.getParameter("address");
		String detailAddress = httpServletRequest.getParameter("detailAddress");
		String rental_address = address + detailAddress;
		if (n != 0) {
			model.addAttribute("rentalEnd", rentalEnd);
			model.addAttribute("rentalStart", rentalStart);
			model.addAttribute("address", address);
			model.addAttribute("rental_address", rental_address);
			viewPath = "redirect:rentalList.do";
		}
		return viewPath;
	}

	
	 @RequestMapping("/site/productPickInsert.do")
	 @ResponseBody
	 public Object productPickInsert(PickVO vo, Model model, HttpServletRequest httpServletRequest) {
		int Pick;
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
	public String MypageRental(RentalVO vo, Model model) {
		List<RentalVO> rentalList = rentalService.rentalList(vo);
		model.addAttribute("list",rentalList);
		return "site/my/MypageRental";
	}
	
	//마이페이지-pick (마이페이지에서 pick버튼 클릭)
	@RequestMapping("/site/pickList.do")
	public String pickList(PickVO vo, Model model) {
		List<PickVO> pickList = rentalService.pickList(vo);
		model.addAttribute("list", pickList);
		return "site/my/mypagePick";
	}
	
	//pick테이블에서 조회
	@RequestMapping("/site/selectPick.do")
	@ResponseBody
	public int selectPick(PickVO vo) {
		int pickList = rentalService.selectPick(vo);
		return pickList;
	}

	// rental 물품리스트에서 하나 선택시 이동되는 물품상세페이지
	@RequestMapping("/site/productDetail.do")
	public String productDetail(ProductVO vo, PickVO vo2, Model model) {
		ProductVO product = new ProductVO();
		product = rentalService.rentalProductSelect(vo);
		model.addAttribute("product", product);
		return "site/rentals/productDetail";
	}

	// 물품상세페이지에서 선택한 날짜값을 가지고 이동하는 결제페이지
	@RequestMapping("/site/payPage.do")
	public String payPage(ProductVO pvo, Model model, HttpServletRequest httpServletRequest) {
		String rentalEnd = httpServletRequest.getParameter("rentalEnd");
		String rentalStart = httpServletRequest.getParameter("rentalStart");
		String totalPay = httpServletRequest.getParameter("totalPay");
		String rentalAddress = httpServletRequest.getParameter("rentalAddress");
		System.out.println(totalPay);
		ProductVO product = new ProductVO();
		product = rentalService.rentalProductSelect(pvo);
		model.addAttribute("product", product);
		model.addAttribute("rentalEnd", rentalEnd);
		model.addAttribute("rentalStart", rentalStart);
		model.addAttribute("rentalAddress", rentalAddress);
		model.addAttribute("totalPay", totalPay);
		return "site/rentals/payPage";
	}

	// rental 물품리스트 검색&페이징기능
	@RequestMapping("/site/productSearch.do")
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

}
