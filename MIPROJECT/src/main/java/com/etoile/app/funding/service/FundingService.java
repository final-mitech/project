package com.etoile.app.funding.service;

import java.util.List;

import com.etoile.app.funding.FundingJoinVO;
import com.etoile.app.funding.FundingVO;

public interface FundingService {
	public List<FundingVO> fundingList(FundingVO vo); //펀딩 목록 조회
	public int fundingInsert(FundingVO vo); //펀딩 등록
	public int fundingUpdate(FundingVO vo); //펀딩 수정
	public int fundingDelete(FundingVO vo); //펀딩 삭제
	public FundingVO fundingSelect(FundingVO vo); //펀딩 한건 조회 (상세보기)
	
	public List<FundingVO> fundingRegisterList(FundingVO vo); //(관리자) 등록된 펀딩 목록 조회
	public FundingVO fundingUpdateForm(FundingVO vo); //(관리자) 등록된 펀딩 수정 폼
	
	public List<FundingVO> fundingRequestList(FundingVO vo); //(관리자) 요청된 펀딩 목록 조회
	public FundingVO fundingRequestUpdateForm(FundingVO vo); //(관리자) 요청된 펀딩 수정 폼
	
	public int fundingRequestUpdate(FundingVO vo); //펀딩 수정2
	
	
	public int fundingJoinInsert(FundingJoinVO vo); //펀딩 참여 등록
	public int fundingJoinUpdate(FundingVO vo); //펀딩 참여 수정
	
}
