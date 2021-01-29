package com.etoile.app.rental.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoile.app.rental.mapper.RentalMapper;
import com.etoile.app.rental.service.RentalService;
import com.etoile.app.vo.CouponVO;
import com.etoile.app.vo.PickVO;
import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.RentalProductVO;
import com.etoile.app.vo.RentalVO;

@Service("rentalService")
public class RentalServiceImpl implements RentalService {
	
	@Autowired
	private RentalMapper dao;
	
	@Override
	public List<ProductVO> rentalProductList(ProductVO vo) {
		return dao.rentalProductList(vo);
	}
	@Override
	public ProductVO rentalProductSelect(ProductVO vo) {
		return dao.rentalProductSelect(vo);
	}
	
	@Override
	public int RentalInsert(RentalVO vo) {
		return dao.RentalInsert(vo);
	}
	@Override
	public List<ProductVO> searchList(ProductVO vo) {
		return dao.searchList(vo);
	}
	@Override
	public int productCnt(ProductVO vo) {
		return dao.productCnt(vo);
	}
	@Override
	public int productPickInsert(PickVO vo) {
		return dao.productPickInsert(vo);
	}
	@Override
	public List<RentalVO> rentalList(RentalVO vo) {
		return dao.rentalList(vo);
	}
	@Override
	public int selectPick(PickVO vo) {
		return dao.selectPick(vo);
	}
	@Override
	public int pickDelete(PickVO vo) {
		return dao.pickDelete(vo);
	}
	@Override
	public List<PickVO> pickList(PickVO vo) {
		return dao.pickList(vo);
	}
	@Override
	public List<RentalVO> allRentalList(RentalVO vo) {
		return dao.allRentalList(vo);
	}
	@Override
	public int updateWaybill(RentalVO vo) {
		return dao.updateWaybill(vo);
	}
	@Override
	public List<RentalVO> rentalReList(RentalVO vo) {
		return dao.rentalReList(vo);
	}
	@Override
	public int rentalProductStatus(RentalProductVO vo) {
		return dao.rentalProductStatus(vo);
	}
	@Override
	public int updateStatus(ProductVO vo) {
		return dao.updateStatus(vo);
	}
	@Override
	public int usedCoupon(CouponVO vo) {
		return dao.usedCoupon(vo);
	}
	
}
