package com.etoile.app.style.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoile.app.style.mapper.StyleMapper;
import com.etoile.app.style.service.StyleService;
import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.RecommendVO;
import com.etoile.app.vo.StylingVO;

@Service("styleService")
public class StyleServiceImpl implements StyleService {

	@Autowired
	private StyleMapper dao;

	@Override
	public List<StylingVO> stylingList(StylingVO vo) {
		return dao.stylingList(vo);
	}

	@Override
	public StylingVO stylingSelect(StylingVO vo) {
		return dao.stylingSelect(vo);
	}

	@Override
	public int stylingInsert(StylingVO vo) {
		return dao.stylingInsert(vo);
	}

	@Override
	public List<ProductVO> productReviewList(ProductVO vo) {
		return dao.productReviewList(vo);
	}
	
	@Override
	public int stylingCount(StylingVO vo) {
		return dao.stylingCount(vo); 
	}

	@Override
	public List<StylingVO> stylingSearch(StylingVO vo) {
		return dao.stylingSearch(vo);
	}

	@Override
	public HashMap<String, Object> stylingRecommend(RecommendVO vo) {
		StylingVO stylingVO = new StylingVO();
		stylingVO.setStyleId(vo.getStyleId());
		stylingVO.setMemberId(vo.getMemberId());
	
		// 좋아요 등록 / 삭제
		int n = dao.selectRecommend(stylingVO);
		if (n !=1) {
			dao.stylingRecommend(vo);
			dao.likeCheck(stylingVO);
		} else {
			dao.stylingRecommendDelete(vo);
			dao.likeCheckCancel(stylingVO);
		}	
		HashMap<String, Object> map = new HashMap<>();
		map.put("totalCount",dao.selectTotalRecommend(stylingVO) );
		map.put("count", dao.selectRecommend(stylingVO));
		return map;
	}

	@Override
	public int stylingRecommendDelete(RecommendVO vo) {
		return dao.stylingRecommendDelete(vo);
	}

	@Override
	public List<StylingVO> myPageStyling(StylingVO vo) {
		return dao.myPageStyling(vo);
	}

	@Override
	public StylingVO myPageStylingDetail(StylingVO vo) {
		return dao.myPageStylingDetail(vo);
	}

	@Override
	public List<StylingVO> myPageStylingRecommend(StylingVO vo) {
		return dao.myPageStylingRecommend(vo);
	}

	@Override
	public int likeCheck(StylingVO vo) {
		return dao.likeCheck(vo);
	}

	@Override
	public int likeCheckCancel(StylingVO vo) {
		return dao.likeCheckCancel(vo);
	}

	@Override
	public int selectRecommend(StylingVO vo) {
		return dao.selectRecommend(vo);
	}

	@Override
	public int selectTotalRecommend(StylingVO vo) {
		return dao.selectTotalRecommend(vo);
	}

	@Override
	public ProductVO stylingSearchProduct(ProductVO vo) {
		return dao.stylingSearchProduct(vo);
	}

}
