package com.etoile.app.rental.mapper;

import java.util.List;

import com.etoile.app.vo.PickVO;
import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.RentalVO;

public interface RentalMapper {
	
	List<ProductVO> rentalProductList(ProductVO vo);
	ProductVO rentalProductSelect(ProductVO vo);
	List<ProductVO> searchList(ProductVO vo);
	List<RentalVO> rentalList(RentalVO vo);
	int selectPick(PickVO vo);
	int RentalInsert(RentalVO vo);
	int productCnt(ProductVO vo);
	int productPickInsert(PickVO vo);
	int pickDelete (PickVO vo);
}
