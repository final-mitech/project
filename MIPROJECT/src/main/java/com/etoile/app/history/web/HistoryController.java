package com.etoile.app.history.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etoile.app.history.common.Paging;
import com.etoile.app.history.service.HistoryService;
import com.etoile.app.vo.ProductVO;

@Controller
public class HistoryController {
	@Autowired
	private HistoryService historyService;
	
	@RequestMapping("/admin/historyList.do")
	public String historyList(ProductVO vo, Paging paging, Model model) {
		//페이징 처리
		if(paging == null) {
			paging.setPage(1);
		}
		paging.setTotalRecord(historyService.productCount(vo));
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		model.addAttribute("paging", paging);
		
		//정렬기준 조회
		String status = "all";
		if(vo != null) {
			status = vo.getProductStatus();
		}
		model.addAttribute("sort", status);
		
		//데이터 조회
		List<ProductVO> productList = historyService.prodcutList(vo);
		model.addAttribute("list", productList);
		
		return "admin/product_history/historyList";
	}
}
