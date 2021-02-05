package com.etoile.app.rental.service;

import java.util.List;
import java.util.Map;

import com.etoile.app.vo.CouponVO;
import com.etoile.app.vo.PickVO;
import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.RentalProductVO;
import com.etoile.app.vo.RentalVO;

public interface RentalService {

	// 물품리스트(최신순)
	List<ProductVO> rentalProductList(ProductVO vo);
	
	//물품리스트(인기순)
	List<ProductVO> rentalProductList2(ProductVO vo);
	
	//물품상세
	ProductVO rentalProductSelect(ProductVO vo);
	
	//물품검색
	List<ProductVO> searchList(ProductVO vo);
	
	//대여리스트(고객)
	List<RentalVO> rentalList(RentalVO vo);
	
	//대여리스트 (관리자)
	List<RentalVO> allRentalList(RentalVO vo);
	
	//대여리스트(관리자) 엑셀다운
	List<Map<String, Object>> rentalExcel(RentalVO vo);
	//대여리스트(관리자) 엑셀다운
	List<Map<String, Object>> rentalReExcel(RentalVO vo);
	
	//찜 리스트(고객)
	List<PickVO> pickList(PickVO vo);
	
	//대여중인 상품중 배송정보가 입력된것
	List<RentalVO> rentalReList(RentalVO vo);
	
	//고객이 해당상품 찜했는지 확인
	int selectPick(PickVO vo);
	
	//대여결제완료 등록
	int RentalInsert(RentalVO vo);
	// 쿠폰사용시 사용상태변경
	int usedCoupon (CouponVO vo);
	
	//물품 갯수확인
	int productCnt(ProductVO vo);
	
	//찜하기
	int productPickInsert(PickVO vo);
	//찜취소
	int pickDelete (PickVO vo);
	
	//배송정보등록 - 송장번호
	int updateWaybill (RentalVO vo);
	//배송정보등록 - 물품상태변경
	int updateStatus (ProductVO vo);
	
	//회수완료로 물품상태변경
	int rentalProductStatus (RentalProductVO vo);
	
}
