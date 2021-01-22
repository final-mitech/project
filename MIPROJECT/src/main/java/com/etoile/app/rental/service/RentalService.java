package com.etoile.app.rental.service;

import java.util.List;

import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.RentalVO;

public interface RentalService {
	
	List<ProductVO> rentalProductList(ProductVO vo);
	ProductVO rentalProductSelect(ProductVO vo);
	List<ProductVO> searchList(ProductVO vo);
	int RentalInsert(RentalVO vo);
	int productCnt(ProductVO vo);
}
