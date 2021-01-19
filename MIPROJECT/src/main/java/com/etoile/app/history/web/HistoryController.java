package com.etoile.app.history.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etoile.app.history.service.HistoryService;
import com.etoile.app.vo.ProductVO;

@Controller
public class HistoryController {
	@Autowired
	private HistoryService historyService;
	
	@RequestMapping("/admin/historyList.do")
	public String historyList(ProductVO vo, Model model) {
		List<ProductVO> productList = historyService.prodcutList(vo);
		model.addAttribute("list", productList);
		return "admin/product_history/historyList";
	}
}
