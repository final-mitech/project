package com.etoile.app.comments.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.etoile.app.comments.service.CommentsService;
import com.etoile.app.vo.CommentsVO;

@Controller
public class CommentsController {
	@Autowired
	private CommentsService commentsService;
	
//	// 댓글 전체 조회 (styleController에 이동)
//	@RequestMapping("/site/commentsList")
//	public String commentsList(CommentsVO vo, Model model) {
//		List<CommentsVO> commentsList = commentsService.commentsList(vo);
//		model.addAttribute("comments", commentsList);
//		return "site/review/reviewDetail";
//	}

	// 댓글 등록
	@RequestMapping("/site/commentsInsert.do")
	public String commentsInsert(CommentsVO vo, HttpServletRequest request, Model model) {
		//세션 값 가져오기
		String memberId = (String) request.getSession().getAttribute("id");	//로그인할 때(세션 생성) 준 값을 가져오는 것
		vo.setMemberId(memberId);	
		commentsService.commentsInsert(vo);
		return "redirect:reviewDetail?styleId="+vo.getStyleId();
	}
	
	// 댓글 삭제
	@RequestMapping("/site/commentsDelete.do")
	public String commentsDelete(CommentsVO vo, Model model) {
		commentsService.commentsDelete(vo);
		return "redirect:reviewDetail?styleId="+vo.getStyleId();
	}
	
}
