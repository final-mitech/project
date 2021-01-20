package com.etoile.app.rental.mapper;

import java.util.List;

import com.etoile.app.vo.ProductVO;

public interface RentalMapper {
	
	List<ProductVO> productList(ProductVO vo);
	ProductVO productSelect(ProductVO vo);
}
