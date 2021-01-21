package com.etoile.app.history.mapper;

import java.util.List;

import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.RentalVO;

public interface HistoryMapper {
	//상품들 일괄조회
	List<ProductVO> prodcutList(ProductVO vo);
	//상품 상세조회
	ProductVO productSelect(ProductVO vo);
	//상품에 대한 대여정보 조회
	List<RentalVO> rentalList(ProductVO vo);
	//상품정보 입력
	int productInsert(ProductVO vo);
	//상품 상태정보 수정
	int productUpdate(ProductVO vo);
	//상품에 대한 대여정보 입력
	int rentalInsert(RentalVO vo);
	//상품정보 삭제
	int productDelete(ProductVO vo);
	//총 상품량 조회
	int productCount(ProductVO vo);
}
