package com.etoile.app.style.mapper;

import java.util.List;

import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.RecommendVO;
import com.etoile.app.vo.StylingVO;

public interface StyleMapper {
	List<StylingVO> stylingList(StylingVO vo); 	// 리뷰 목록 조회
	StylingVO stylingSelect(StylingVO vo);		// 리뷰 한건 조회 (상세)
	
	List<StylingVO> stylingSearch(StylingVO vo); //리뷰 검색 리스트
	int stylingCount(StylingVO vo);				// 총 리뷰 수 카운트
	
	int stylingInsert(StylingVO vo);			// 리뷰 등록
	List<ProductVO> productReviewList(ProductVO vo);	// 리뷰 등록폼 제품 리스트
	
	int stylingRecommend(RecommendVO vo);			// 리뷰 추천 (좋아요) 
	int stylingRecommendDelete(RecommendVO vo);			// 리뷰 추천 취소 (좋아요취소)
	int selectRecommend(RecommendVO vo);
	
	List<StylingVO> myPageStyling(StylingVO vo);	//마이페이지 리뷰 목록 조회
	StylingVO myPageStylingDetail(StylingVO vo);	// 마이페이지 리뷰 한건 조회
	List<StylingVO> myPageStylingRecommend(StylingVO vo);	//마이페이지 좋아요 목록 조회
}
