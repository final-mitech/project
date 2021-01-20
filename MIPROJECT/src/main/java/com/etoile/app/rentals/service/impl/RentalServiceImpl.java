package com.etoile.app.rentals.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoile.app.rental.service.RentalService;
import com.etoile.app.rentals.mapper.RentalMapper;
import com.etoile.app.vo.ProductVO;

@Service("memberService")
public class RentalServiceImpl implements RentalService {
	
	@Autowired
	private RentalMapper dao;
	
	@Override
	public List<ProductVO> productList(ProductVO vo) {
		return dao.productList(vo);
	}
}
