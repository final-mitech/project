package com.etoile.app.comments.service;

import java.util.List;

import com.etoile.app.vo.CommentsVO;

public interface CommentsService {
	List<CommentsVO> commentsList(CommentsVO vo); 	// 댓글 목록 조회
	int commentsInsert(CommentsVO vo);			// 댓글 등록
	int commentsDelete(CommentsVO vo);			// 댓글 삭제
	int commentsUpdate(CommentsVO vo);			// 댓글 수정
}
