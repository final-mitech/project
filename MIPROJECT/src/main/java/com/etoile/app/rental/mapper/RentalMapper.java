package com.etoile.app.rental.mapper;

import java.util.List;

import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.RentalVO;

public interface RentalMapper {
	
	List<ProductVO> rentalProductList(ProductVO vo);
	ProductVO rentalProductSelect(ProductVO vo);
	List<ProductVO> searchList(ProductVO vo);
	int RentalInsert(RentalVO vo);
	int productCnt(ProductVO vo);
}
