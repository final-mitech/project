package com.etoile.app.rental.mapper;

import java.util.List;

import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.RentalVO;

public interface RentalMapper {
	
	List<ProductVO> productList(ProductVO vo);
	ProductVO productSelect(ProductVO vo);
	int RentalInsert(RentalVO vo);
}
