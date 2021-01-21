package com.etoile.app.rental.service;

import java.util.List;

import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.RentalVO;

public interface RentalService {
	
	List<ProductVO> productList(ProductVO vo);
	ProductVO productSelect(ProductVO vo);
	int RentalInsert(RentalVO vo);
}
