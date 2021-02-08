package com.etoile.app.style.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.etoile.app.comments.service.CommentsService;
import com.etoile.app.history.common.Paging;
import com.etoile.app.style.service.StyleService;
import com.etoile.app.vo.CommentsVO;
import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.RecommendVO;
import com.etoile.app.vo.StylingVO;

@Controller
public class StyleController {

	@Autowired
	private StyleService styleService; 	//styleServiceImpl 객체 자동 주입
	@Autowired
	private CommentsService commentsService;

	// 전체 조회
	@RequestMapping("/site/reviewList")
	public String stylingList(StylingVO vo, Paging paging, Model model) {
		// 페이징 처리
		if (paging == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(3); // 3개
		paging.setTotalRecord(styleService.stylingCount(vo));
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		model.addAttribute("paging", paging);

		// 조회
		List<StylingVO> stylingList = styleService.stylingList(vo);
		model.addAttribute("list", stylingList);
		return "site/review/reviewList";
	}

	// 리뷰리스트 검색 & 페이징
	@RequestMapping("/site/reviewSearch")
	public String stylingSearch(StylingVO vo, Paging paging, Model model) {
		if (paging == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(3);
		paging.setTotalRecord(styleService.stylingCount(vo));
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		model.addAttribute("paging", paging);
		List<StylingVO> stylingSearch = styleService.stylingSearch(vo);
		model.addAttribute("list", stylingSearch);
		return "site/review/reviewList";
	}

	// 단건 조회 (상세 페이지로 이동) & 댓글 전체조회
	@RequestMapping("/site/reviewDetail")
	public String stylingSelect(StylingVO vo, Model model, HttpServletRequest request) {
		// 단건 조회 (스타일)
		//String memberId = (String) request.getSession().getAttribute("id");
		//vo.setMemberId(memberId);
		vo = styleService.stylingSelect(vo);
		// 댓글 조회
		CommentsVO co = new CommentsVO();
		co.setStyleId(vo.getStyleId());
		List<CommentsVO> commentsList = commentsService.commentsList(co);
		
		// 좋아요 여부 조회
		String memberId = (String) request.getSession().getAttribute("id");
		if (memberId != null) {
			vo.setMemberId(memberId);
			int n = styleService.selectRecommend(vo);
			model.addAttribute("like", n);
		}
		
		model.addAttribute("list", vo);
		model.addAttribute("comments", commentsList);
		return "site/review/reviewDetail";
	}

	// 리뷰 등록폼 제품 리스트
	@RequestMapping("/site/productReviewList.do")
	public String productReviewList(ProductVO vo, Model model) {
		List<ProductVO> productReviewList = styleService.productReviewList(vo);
		model.addAttribute("p", productReviewList);
		return "site/review/reviewRegister";
	}

	// 리뷰 등록
	@RequestMapping("/site/reviewRegister.do")
	public String stylingInsert(HttpServletRequest request, StylingVO vo, Model model,
			@RequestParam(required = false) MultipartFile uploadFile) throws IllegalStateException, IOException {
		// url 통해 실제 경로 가져오기
		String path = request.getSession().getServletContext().getRealPath("/images");
		// 첨부파일 처리
		if (uploadFile != null && uploadFile.getSize() > 0) {
			File file = new File(path, uploadFile.getOriginalFilename());
			uploadFile.transferTo(file);
			// 파일명을 vo에 담고
			vo.setStyleImage(uploadFile.getOriginalFilename());
		}
		// DB에 저장
		String memberId = (String) request.getSession().getAttribute("id");
		vo.setMemberId(memberId);
		styleService.stylingInsert(vo);
		return "redirect:/site/MypageRental.do";
	}

	// 리뷰 좋아요 등록 & 취소(삭제)
	@RequestMapping("/site/reviewRecommend.do")
	@ResponseBody
	public HashMap<String, Object> stylingRecommend(RecommendVO vo, StylingVO Vo, HttpServletRequest httpServletRequest, Model model) {
		int Recommend;
		String memberId = (String) httpServletRequest.getSession().getAttribute("id");
		vo.setMemberId(memberId);
		return styleService.stylingRecommend(vo);
	}


	// 마이페이지 - 리뷰리스트
	@RequestMapping("/site/myPageStyling.do")
	public String myPageStyling(StylingVO vo, HttpServletRequest httpServletRequest, Model model) {
			String memberId = (String) httpServletRequest.getSession().getAttribute("id");
			vo.setMemberId(memberId);
		List<StylingVO> stylingList = styleService.myPageStyling(vo);
		model.addAttribute("list", stylingList);
		return "site/my/myStylingList";
	}

	// 마이페이지 - 리뷰 한건 조회
	@RequestMapping("/site/myPageStylingDetail.do")
	public String myPageStylingDetail(StylingVO vo, HttpServletRequest httpServletRequest, Model model) {
		String memberId = (String) httpServletRequest.getSession().getAttribute("id");
		vo.setMemberId(memberId);
		vo = styleService.myPageStylingDetail(vo);
		model.addAttribute("list", vo);
		return "site/my/myStylingDetail";
	}

	// 마이페이지 - 좋아요 리스트
	@RequestMapping("/site/myPageRecommend.do")
	public String myPageStylingRecommend(StylingVO vo, HttpServletRequest httpServletRequest, Model model) {
		String memberId = (String) httpServletRequest.getSession().getAttribute("id");
		vo.setMemberId(memberId);
		List<StylingVO> recommendList = styleService.myPageStylingRecommend(vo);
		model.addAttribute("list", recommendList);
		return "site/my/myStylingRecommend";
	}

}
