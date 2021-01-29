package com.etoile.app.rental.service;

import java.util.List;

import com.etoile.app.vo.CouponVO;
import com.etoile.app.vo.PickVO;
import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.RentalProductVO;
import com.etoile.app.vo.RentalVO;

public interface RentalService {
	
	List<ProductVO> rentalProductList(ProductVO vo);
	List<ProductVO> rentalProductList2(ProductVO vo);
	ProductVO rentalProductSelect(ProductVO vo);
	List<ProductVO> searchList(ProductVO vo);
	List<RentalVO> rentalList(RentalVO vo);
	List<RentalVO> allRentalList(RentalVO vo);
	List<PickVO> pickList(PickVO vo);
	List<RentalVO> rentalReList(RentalVO vo);
	int selectPick(PickVO vo);
	int RentalInsert(RentalVO vo);
	int productCnt(ProductVO vo);
	int productPickInsert(PickVO vo);
	int pickDelete (PickVO vo);
	int updateWaybill (RentalVO vo);
	int rentalProductStatus (RentalProductVO vo);
	int updateStatus (ProductVO vo);
	int usedCoupon (CouponVO vo);
}
