package com.etoile.app.history.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etoile.app.history.common.Paging;
import com.etoile.app.history.service.HistoryService;
import com.etoile.app.vo.ProductVO;

@Controller
public class HistoryController {
	@Autowired
	private HistoryService historyService;

	// 보유물품이력 메인페이지
	@RequestMapping("/admin/historyList")
	public String historyList(ProductVO vo, Paging paging, Model model) {
		//보유물품 표기
		vo.setPpl("own");
		
		// 페이징 처리
		if (paging == null) {
			paging.setPage(1);
		}
		paging.setTotalRecord(historyService.productCount(vo));
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		model.addAttribute("paging", paging);

		// 정렬기준 조회
		String status = "all";
		if (vo != null) {
			status = vo.getProductStatus();
		}
		model.addAttribute("sort", status);

		// 데이터 조회
		List<ProductVO> productList = historyService.prodcutList(vo);
		model.addAttribute("list", productList);

		return "admin/product_history/historyList";
	}

	// 협찬물품이력 메인페이지
	@RequestMapping("/admin/pplList")
	public String pplList(ProductVO vo, Paging paging, Model model) {
		//협찬물품 표기
		vo.setPpl("ppl");
		
		// 페이징 처리
		if (paging == null) {
			paging.setPage(1);
		}
		paging.setTotalRecord(historyService.productCount(vo));
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		model.addAttribute("paging", paging);

		// 정렬기준 조회
		String status = "all";
		if (vo != null) {
			status = vo.getProductStatus();
		}
		model.addAttribute("sort", status);

		// 데이터 조회
		List<ProductVO> productList = historyService.prodcutList(vo);
		model.addAttribute("list", productList);

		return "admin/product_history/pplList";
	}

	// 보유물품 및 협찬물품 상태 업데이트
	@RequestMapping("admin/historyUpdate")
	@ResponseBody
	public int historyUpdate(ProductVO vo) {
		int n = historyService.productUpdate(vo);
		return n;
	}

	// 보유물품 및 협찬물품 이력 상세페이지
	@RequestMapping("/admin/productSelect")
	public String productSelect(ProductVO vo, Model model) {
		// 데이터 조회
		vo = historyService.productSelect(vo);
		model.addAttribute("product", vo);
		return "admin/product_history/productSelect";
	}
}
