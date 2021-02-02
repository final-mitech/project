package com.etoile.app.comments.mapper;

import java.util.List;
import com.etoile.app.vo.CommentsVO;

public interface CommentsMapper {
	// 댓글 전체 목록 조회
	public List<CommentsVO> commentsList(CommentsVO vo); 	
	// 댓글 등록
	public int commentsInsert(CommentsVO vo);			
	// 댓글 삭제
	public int commentsDelete(CommentsVO vo);			
	// 댓글 수정
	public int commentsUpdate(CommentsVO vo);			
}
