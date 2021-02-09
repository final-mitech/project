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
	
	public int conditionUpdate(FundingVO vo); //펀딩 상태 수정
	
	public List<FundingVO> myFundingList(FundingVO vo); //마이 페이지 - 마이 펀딩 목록 조회
	public List<FundingVO> joinFundingList(FundingVO vo); //마이 페이지 - 조인 펀딩 목록 조회
	
	
	public int getFundingCnt(FundingVO vo); // 총 데이터 count
	
	
	public int fundingStartUpdate(FundingVO vo); //스케쥴러 (펀딩오픈예정 -> 펀딩중)
	public int fundingEndUpdate(FundingVO vo); //스케쥴러 (펀딩중 -> 펀딩마감)
	public int fundingOpenUpdate(FundingVO vo);
	
	
	public List<FundingVO> fundingComingSoonList(FundingVO vo); //(관리자) 등록페이지
	public List<FundingVO> fundingOpenList(FundingVO vo); //(관리자) 등록페이지
	public List<FundingVO> fundingCloseList(FundingVO vo); //(관리자) 등록페이지
}
