package com.etoile.app.funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoile.app.funding.FundingJoinVO;
import com.etoile.app.funding.FundingVO;
import com.etoile.app.funding.mapper.FundingMapper;
import com.etoile.app.funding.service.FundingService;

@Service("fundingService")
public class FundingServiceImpl implements FundingService {

	//@Setter(onMethod_ = @Autowired)
	@Autowired
	private FundingMapper dao;
	
	@Override
	public List<FundingVO> fundingList(FundingVO vo) {
		
		return dao.fundingList(vo);
	}

	@Override
	public int fundingInsert(FundingVO vo) {
		
		return dao.fundingInsert(vo);
	}

	@Override
	public int fundingUpdate(FundingVO vo) {
		
		return dao.fundingUpdate(vo);
	}

	@Override
	public int fundingDelete(FundingVO vo) {
		
		return dao.fundingDelete(vo);
	}

	@Override
	public FundingVO fundingSelect(FundingVO vo) {
		
		return dao.fundingSelect(vo);
	}

	@Override
	public List<FundingVO> fundingRegisterList(FundingVO vo) {
		
		return dao.fundingList(vo);
	}

	@Override
	public FundingVO fundingUpdateForm(FundingVO vo) {
		
		return dao.fundingSelect(vo);
	}

	@Override
	public List<FundingVO> fundingRequestList(FundingVO vo) {
		
		return dao.fundingList(vo);
	}

	@Override
	public FundingVO fundingRequestUpdateForm(FundingVO vo) {
		
		return dao.fundingSelect(vo);
	}

	@Override
	public int fundingRequestUpdate(FundingVO vo) {

		return dao.fundingUpdate(vo);
	}

	@Override
	public int fundingJoinInsert(FundingJoinVO vo) {
		
		return dao.fundingJoinInsert(vo);
	}

	@Override
	public int fundingJoinUpdate(FundingVO vo) {

		return dao.fundingJoinUpdate(vo);
	}

	@Override
	public int conditionUpdate(FundingVO vo) {
		
		return dao.conditionUpdate(vo);
	}

	@Override
	public List<FundingVO> myFundingList(FundingVO vo) {

		return dao.myFundingList(vo);
	}

	@Override
	public List<FundingVO> joinFundingList(FundingVO vo) {
		
		return dao.joinFundingList(vo);
	}

	@Override //펀딩 전체 건수
	public int getFundingCnt(FundingVO vo) {
		
		return dao.getFundingCnt(vo);	
	}

	@Override
	public int fundingStartUpdate(FundingVO vo) {

		return dao.fundingStartUpdate(vo);
	}

	@Override
	public int fundingEndUpdate(FundingVO vo) {
		
		return dao.fundingEndUpdate(vo);
	}

	@Override
	public List<FundingVO> fundingComingSoonList(FundingVO vo) {
		return dao.fundingList(vo);
	}

	@Override
	public List<FundingVO> fundingOpenList(FundingVO vo) {
		return dao.fundingList(vo);
	}

	@Override
	public List<FundingVO> fundingCloseList(FundingVO vo) {
		return dao.fundingList(vo);
	}

	@Override
	public int fundingOpenUpdate(FundingVO vo) {
		return dao.fundingOpenUpdate(vo);
	}

}
