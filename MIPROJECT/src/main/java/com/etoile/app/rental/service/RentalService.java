package com.etoile.app.rental.service;

import java.util.List;

import com.etoile.app.vo.ProductVO;

public interface RentalService {
	
	List<ProductVO> productList(ProductVO vo);
	ProductVO productSelect(ProductVO vo);
}
