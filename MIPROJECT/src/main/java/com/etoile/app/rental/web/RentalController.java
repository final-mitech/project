package com.etoile.app.rental.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.etoile.app.rental.service.RentalService;
import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.RentalVO;

@Controller
public class RentalController {
	@Autowired
	private RentalService rentalService;
	
	@RequestMapping("/site/productList.do")
	public String productList(ProductVO vo, Model model) {
		List<ProductVO> productList = rentalService.productList(vo);
		model.addAttribute("list", productList);
		return "site/rentals/rentalMain";
	}
	
	@RequestMapping("/site/productDetail.do")
	public String productDetail(ProductVO vo, Model model) {
		ProductVO product = new ProductVO();
		product = rentalService.productSelect(vo);
		model.addAttribute("product", product);
		return "site/rentals/productDetail";
	}
	
	@RequestMapping("/site/payPage.do")
	public String payPage(ProductVO pvo, Model model,HttpServletRequest httpServletRequest) {
		String endRental = httpServletRequest.getParameter("endRental");
		String startRental = httpServletRequest.getParameter("startRental");
		ProductVO product = new ProductVO();
		product = rentalService.productSelect(pvo);
		model.addAttribute("product", product);
		model.addAttribute("endRental", endRental);
		model.addAttribute("startRental", startRental);
		return "site/rentals/payPage";
	}
	
}
