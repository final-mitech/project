package com.etoile.app.rentals.web;

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
	
	@RequestMapping("/site/rentalList.do")
	public String rentalList(ProductVO vo, Model model) {
		List<ProductVO> productList = rentalService.productList(vo);
		model.addAttribute("list", productList);
		return "site/rentals/rentalMain";
	}
}
