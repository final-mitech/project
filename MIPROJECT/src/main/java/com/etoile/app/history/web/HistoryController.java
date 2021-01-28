package com.etoile.app.history.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.etoile.app.history.common.Paging;
import com.etoile.app.history.service.HistoryService;
import com.etoile.app.vo.ProductVO;

@Controller
public class HistoryController {
	@Autowired
	private HistoryService historyService;

	// 보유물품이력 메인페이지
	@RequestMapping("/admin/historyList.a")
	public String historyList(ProductVO vo, Paging paging, Model model) {
		// 보유물품 표기
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
	@RequestMapping("/admin/pplList.a")
	public String pplList(ProductVO vo, Paging paging, Model model) {
		// 협찬물품 표기
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
	@RequestMapping("admin/historyUpdate.a")
	@ResponseBody
	public int historyUpdate(ProductVO vo) {
		int n = historyService.productUpdate(vo);
		return n;
	}

	// 보유물품 및 협찬물품 이력 상세페이지
	@RequestMapping("/admin/productSelect.a")
	public String productSelect(ProductVO vo, Model model) {
		// 데이터 조회
		vo = historyService.productSelect(vo);
		model.addAttribute("product", vo);
		return "admin/product_history/productSelect";
	}

	// 물품 등록페이지
	@RequestMapping("admin/productInsertForm.a")
	public String productInsertForm(ProductVO vo, Model model) {
		model.addAttribute("productVO", vo);
		return "admin/product_history/productForm";
	}

	// 물품 등록 처리
	@RequestMapping("admin/prodcutInsert.a")
	public String productInsert(HttpServletRequest request, ProductVO vo,
			@RequestParam(required = false) MultipartFile uploadImage) throws IllegalStateException, IOException {
		// url을 통해 실제경로를 가져온다.
		String path = request.getSession().getServletContext().getRealPath("/images");
		// 첨부파일 처리
		if (uploadImage != null && uploadImage.getSize() > 0) {
			File file = new File(path, uploadImage.getOriginalFilename());

			uploadImage.transferTo(file);
			// 파일명을 VO에 담고
			vo.setProductImage(uploadImage.getOriginalFilename());
		}

		// DB에 저장
		historyService.productInsert(vo);

		return "redirect:historyList.a";
	}

	// 물품수정페이지
	@RequestMapping("admin/productUpdateForm.a")
	public String productUpdateForm(ProductVO vo, Model model) {
		vo = historyService.productSelect(vo);
		model.addAttribute("productVO", vo);
		return "admin/product_history/productForm";
	}

	// 물품 수정 처리
	@RequestMapping("admin/productUpdate.a")
	public String productUpdate(HttpServletRequest request, ProductVO vo,
			@RequestParam(required = false) MultipartFile uploadImage) throws IllegalStateException, IOException {
		// url을 통해 실제경로를 가져온다.
		String path = request.getSession().getServletContext().getRealPath("/images");
		// 첨부파일 처리
		if (uploadImage != null && uploadImage.getSize() > 0) {
			File file = new File(path, uploadImage.getOriginalFilename());

			uploadImage.transferTo(file);
			// 파일명을 VO에 담고
			vo.setProductImage(uploadImage.getOriginalFilename());
		}

		// DB에 저장
		historyService.productInfoUpdate(vo);
		System.out.println(vo);
		return "redirect:historyList.a";
	}
	
	// 물품 삭제 처리
	@RequestMapping("admin/productDelete.a")
	public String productDelete(ProductVO vo) {
		historyService.productDelete(vo);
		
		return "redirect:historyList.a"; 
	}
}
