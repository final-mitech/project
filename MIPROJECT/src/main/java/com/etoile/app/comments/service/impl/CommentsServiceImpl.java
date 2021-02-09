package com.etoile.app.comments.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoile.app.comments.mapper.CommentsMapper;
import com.etoile.app.comments.service.CommentsService;
import com.etoile.app.vo.CommentsVO;

@Service("commentsService")
public class CommentsServiceImpl implements CommentsService {

	@Autowired
	private CommentsMapper dao;

	@Override
	public List<CommentsVO> commentsList(CommentsVO vo) {
		return dao.commentsList(vo);
	}

	@Override
	public int commentsInsert(CommentsVO vo) {
		return dao.commentsInsert(vo);
	}

	@Override
	public int commentsDelete(CommentsVO vo) {
		return dao.commentsDelete(vo);
	}

	@Override
	public int commentsUpdate(CommentsVO vo) {
		return dao.commentsUpdate(vo);
	}
		
		
}
