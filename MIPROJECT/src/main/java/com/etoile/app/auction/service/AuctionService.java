package com.etoile.app.auction.service;

import java.util.List;

import com.etoile.app.vo.AuctionJoinVO;
import com.etoile.app.vo.AuctionVO;

public interface AuctionService {
	// 전체조회
	public List<AuctionVO> getAuction(AuctionVO vo);

	// 한건조회
	public AuctionVO getAuctionOne(AuctionVO vo);

	// 등록
	public int insertAuction(AuctionVO vo);

	// 검색
	public List<AuctionVO> getSearch(AuctionVO vo);

	// 최신순 정렬
	public List<AuctionVO> getRecent(AuctionVO vo);

	// 경매 인기순조회
	public List<AuctionVO> getHottest(AuctionVO vo);

	// 총 데이터 count
	public int getAuctionCount(AuctionVO vo);

	// 경매 참여 등록
	public int insertAuctionJoin(AuctionJoinVO vo);

	// 경매 최고가 등록
	public int updateAuctionBp(AuctionVO vo);

	// 경매 최근참여자 3건
	public List<AuctionJoinVO> getJoinRecent(AuctionJoinVO jo);

	// 경매 최고액, 최고참여자 조회
	public AuctionJoinVO getJoinTop(AuctionJoinVO jo);

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
}
