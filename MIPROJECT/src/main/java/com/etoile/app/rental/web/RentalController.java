package com.etoile.app.rental.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etoile.app.history.common.Paging;
import com.etoile.app.rental.service.RentalService;
import com.etoile.app.vo.ProductVO;

@Controller
public class RentalController {
	@Autowired
	private RentalService rentalService;
	
	@RequestMapping("/site/productList.do")
	public String productList(ProductVO vo, Paging paging, Model model) {
		if(paging == null) {
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
	
	@RequestMapping("/site/productDetail.do")
	public String productDetail(ProductVO vo, Model model) {
		ProductVO product = new ProductVO();
		product = rentalService.rentalProductSelect(vo);
		model.addAttribute("product", product);
		return "site/rentals/productDetail";
	}
	
	@RequestMapping("/site/payPage.do")
	public String payPage(ProductVO pvo, Model model,HttpServletRequest httpServletRequest) {
		String endRental = httpServletRequest.getParameter("endRental");
		String startRental = httpServletRequest.getParameter("startRental");
		ProductVO product = new ProductVO();
		product = rentalService.rentalProductSelect(pvo);
		model.addAttribute("product", product);
		model.addAttribute("endRental", endRental);
		model.addAttribute("startRental", startRental);
		return "site/rentals/payPage";
	}
	
	@RequestMapping("/site/productSearch.do")
	public String searchList(ProductVO vo, Paging paging, Model model) {
		if(paging == null) {
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
