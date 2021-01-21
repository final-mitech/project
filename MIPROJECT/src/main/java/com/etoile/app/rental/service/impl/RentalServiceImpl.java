package com.etoile.app.rental.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoile.app.rental.mapper.RentalMapper;
import com.etoile.app.rental.service.RentalService;
import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.RentalVO;

@Service("rentalService")
public class RentalServiceImpl implements RentalService {
	
	@Autowired
	private RentalMapper dao;
	
	@Override
	public List<ProductVO> productList(ProductVO vo) {
		return dao.productList(vo);
	}
	@Override
	public ProductVO productSelect(ProductVO vo) {
		return dao.productSelect(vo);
	}
	
	@Override
	public int RentalInsert(RentalVO vo) {
		return dao.RentalInsert(vo);
	}
}
