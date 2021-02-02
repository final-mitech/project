package com.etoile.app.auction.mapper;

import java.util.List;

import com.etoile.app.vo.AuctionJoinVO;
import com.etoile.app.vo.AuctionVO;

public interface AuctionMapper {
	// 경매 요청 등록
	public int insertAuction(AuctionVO vo);

	// 경매 전체조회
	public List<AuctionVO> getAuction(AuctionVO vo);

	// 경매 한건조회
	public AuctionVO getAuctionOne(AuctionVO vo);

	// 경매 검색조회
	public List<AuctionVO> getSearch(AuctionVO vo);

	// 경매 최신순조회
	public List<AuctionVO> getRecent(AuctionVO vo);

	// 경매 인기순조회
	public List<AuctionVO> getHottest(AuctionVO vo);

	// 경매 전체 count
	public int getAuctionCount(AuctionVO vo);

	// 경매 참여 등록
	public int insertAuctionJoin(AuctionJoinVO jo);

	// 경매 최근참여자 3건
	public List<AuctionJoinVO> getJoinRecent(AuctionJoinVO jo);

	// 최고가, 최고액 참여자
	public AuctionJoinVO getJoinTop(AuctionJoinVO jo);

	// 경매 최고가 등록
	public int updateAuctionBp(AuctionVO vo);

	// 경매 참여 수 등록
	public int updateAuctionCount(AuctionVO vo);

	// 마이 경매 총 count
	public int getMyJoinCount(AuctionVO vo);

	// 마이 경매 참여 내역
	public List<AuctionVO> getMyAuctionJoin(AuctionVO vo);

	// 마이 경매 낙찰 총 count
	public int getMyBidCount(AuctionVO vo);

	// 마이 경매 낙찰내역
	public List<AuctionVO> getMyAuctionBid(AuctionVO vo);

	// 마이 총 대리 경매 count
	public int getMyReqCount(AuctionVO vo);

	// 마이 대리 경매 내역
	public List<AuctionVO> getMyAuctionReq(AuctionVO vo);

	// 마이 경매 배송지 입력
	public int myAuctionAddr(AuctionJoinVO vo);

	// 마이 경매 회수요청
	public int myAuctionRecover(AuctionVO vo);

	// 마이 경매 진행확정
	public int myAuctionConfirm(AuctionVO vo);

	// 마이 경매 정산받기
	public int myAuctionSettle(AuctionVO vo);
	
	// 관리자 경매 요청 내역
	public List<AuctionVO> getAdminReq(AuctionVO vo);
	
	// 관리자 경매 요청 내역
	public List<AuctionVO> getAdminList(AuctionVO vo);
	
	// 관리자 요청 내역 count
	public int getAdminReqCount(AuctionVO vo);

	// 관리자 경매 현황 count
	public int getAdminListCount(AuctionVO vo);
	
	//요청리스트 -> 관리자 컨펌
	public int auctionReqConfirm(AuctionVO vo);
	
	//관리자 경매상품 등록 
	public int auctionAdminPut(AuctionVO vo);
	
	//경매 현황리스트 정렬 
	public List<AuctionVO> auctionAdminSelect(AuctionVO vo);
	
	// 현황리스트 정렬 count
	public int adminSelectCount(AuctionVO vo);
	
	//오픈예정 -> 경매중
	public int updateAuctionStart(AuctionVO vo);
	
	//경매중 -> 경매마감
	public int updateAuctionEnd(AuctionVO vo);

}
