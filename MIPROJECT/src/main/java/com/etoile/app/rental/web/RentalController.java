package com.etoile.app.rental.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etoile.app.rental.service.RentalService;
import com.etoile.app.vo.ProductVO;

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
	public String payPage(ProductVO vo, Model model) {
		ProductVO product = new ProductVO();
		product = rentalService.productSelect(vo);
		model.addAttribute("product", product);
		
		return "site/rentals/payPage";
	}
	
}
