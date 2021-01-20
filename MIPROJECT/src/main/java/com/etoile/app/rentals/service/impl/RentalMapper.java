package com.etoile.app.rentals.service.impl;

import java.util.List;

import com.etoile.app.vo.ProductVO;

public interface RentalMapper {
	
	List<ProductVO> productList(ProductVO vo);
	
}
