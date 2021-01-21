package com.etoile.app.history.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoile.app.history.mapper.HistoryMapper;
import com.etoile.app.history.service.HistoryService;
import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.RentalVO;

@Service("historyService")
public class HistoryServiceImpl implements HistoryService {

	@Autowired
	private HistoryMapper dao;
	
	@Override
	public List<ProductVO> prodcutList(ProductVO vo) {
		return dao.prodcutList(vo);
	}

	@Override
	public ProductVO productSelect(ProductVO vo) {
		return dao.productSelect(vo);
	}

	@Override
	public List<RentalVO> rentalList(ProductVO vo) {
		return dao.rentalList(vo);
	}

	@Override
	public int productInsert(ProductVO vo) {
		return dao.productInsert(vo);
	}

	@Override
	public int productUpdate(ProductVO vo) {
		return dao.productUpdate(vo);
	}

	@Override
	public int rentalInsert(RentalVO vo) {
		return dao.rentalInsert(vo);
	}

	@Override
	public int productDelete(ProductVO vo) {
		return dao.productDelete(vo);
	}

	@Override
	public int productCount(ProductVO vo) {
		return dao.productCount(vo);
	}

}
