package com.etoile.app.auction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoile.app.auction.mapper.AuctionMapper;
import com.etoile.app.auction.service.AuctionService;
import com.etoile.app.vo.AuctionJoinVO;
import com.etoile.app.vo.AuctionVO;

@Service("auctionService")
public class AuctionServiceImpl implements AuctionService{
	
	@Autowired
	private AuctionMapper auctionMapper;
	

	@Override  //전체조회
	public List<AuctionVO> getAuction(AuctionVO vo) {
		
		return auctionMapper.getAuction(vo);
	}

	@Override  //한건조회
	public AuctionVO getAuctionOne(AuctionVO vo) {
		
		return auctionMapper.getAuctionOne(vo);
	}

	@Override //경매등록
	public int insertAuction(AuctionVO vo) {
		
		return auctionMapper.insertAuction(vo);
	}

	@Override //경매검색
	public List<AuctionVO> getSearch(AuctionVO vo) {
		
		return auctionMapper.getSearch(vo);
	}

	@Override //경매 최신순
	public List<AuctionVO> getRecent(AuctionVO vo) {
		
		return auctionMapper.getRecent(vo);
	}

	@Override  //경매 전체 건수
	public int getAuctionCount(AuctionVO vo) {
		
		return auctionMapper.getAuctionCount(vo);
	}

	@Override //경매 참여 등록
	public int insertAuctionJoin(AuctionJoinVO vo) {
		
		return auctionMapper.insertAuctionJoin(vo);
	}

	@Override //경매 최근참여자 3건
	public List<AuctionJoinVO> getJoinRecent(AuctionJoinVO jo) {
		
		return auctionMapper.getJoinRecent(jo);
	}

	@Override //최고가, 최고액 참여자
	public AuctionJoinVO getJoinTop(AuctionJoinVO jo) {
		
		return auctionMapper.getJoinTop(jo);
	}

	@Override //최고가 등록
	public int updateAuctionBp(AuctionVO vo) {
		
		return auctionMapper.updateAuctionBp(vo);
	}

	@Override  //경매 총 참여수 업데이트
	public int updateAuctionCount(AuctionVO vo) {
		
		return auctionMapper.updateAuctionCount(vo);
	}

	@Override  //인기순 정렬
	public List<AuctionVO> getHottest(AuctionVO vo) {
	
		return auctionMapper.getHottest(vo);
	}

	@Override  //마이 경매 총 count
	public int getMyJoinCount(AuctionVO vo) {
		
		return auctionMapper.getMyJoinCount(vo);
	}

	@Override  //마이 경매 참여내역
	public List<AuctionVO> getMyAuctionJoin(AuctionVO vo) {
		
		return auctionMapper.getMyAuctionJoin(vo);
	}
	

	@Override  //마이 경매 낙찰내역 
	public List<AuctionVO> getMyAuctionBid(AuctionVO vo) {
		
		return auctionMapper.getMyAuctionBid(vo);
	}

	@Override  //마이 경매 낙찰 총 count
	public int getMyBidCount(AuctionVO vo) {
		
		return auctionMapper.getMyBidCount(vo);
	}

	@Override  // 마이 총 대리 경매 count
	public int getMyReqCount(AuctionVO vo) {
		
		return auctionMapper.getMyReqCount(vo);
	}

	@Override  // 마이 대리 경매 내역
	public List<AuctionVO> getMyAuctionReq(AuctionVO vo) {
		
		return auctionMapper.getMyAuctionReq(vo);
	}

	@Override  //마이 경매 배송지 입력
	public int myAuctionAddr(AuctionJoinVO vo) {
	
		return auctionMapper.myAuctionAddr(vo);
	}

	@Override //마이 경매 회수요청
	public int myAuctionRecover(AuctionVO vo) {
		
		return auctionMapper.myAuctionRecover(vo);
	}

	@Override //마이 경매 진행확정
	public int myAuctionConfirm(AuctionVO vo) {
		
		return auctionMapper.myAuctionConfirm(vo);
	}

	@Override //마이 경매 정산받기
	public int myAuctionSettle(AuctionVO vo) {
		
		return auctionMapper.myAuctionSettle(vo);
	}

	@Override  //관리자 경매 요청리스트
	public List<AuctionVO> getAdminReq(AuctionVO vo) {
		
		return auctionMapper.getAdminReq(vo);
	}

	@Override  //관리자 경매 현황 리스트
	public List<AuctionVO> getAdminList(AuctionVO vo) {
		
		return auctionMapper.getAdminList(vo);
	}

	@Override // 관리자 요청 내역 count
	public int getAdminReqCount(AuctionVO vo) {
		
		return auctionMapper.getAdminReqCount(vo);
	}

	@Override // 관리자 경매 현황 count
	public int getAdminListCount(AuctionVO vo) {
		
		return auctionMapper.getAdminListCount(vo);
	}

	@Override //요청리스트 -> 관리자 컨펌
	public int auctionReqConfirm(AuctionVO vo) {
		
		return auctionMapper.auctionReqConfirm(vo);
	}

	@Override //관리자 경매상품 등록 
	public int auctionAdminPut(AuctionVO vo) {
		
		return auctionMapper.auctionAdminPut(vo);
	}

	@Override //경매 현황리스트 정렬 
	public List<AuctionVO> auctionAdminSelect(AuctionVO vo) {

		return auctionMapper.auctionAdminSelect(vo);
	}

	@Override // 현황리스트 정렬 count
	public int adminSelectCount(AuctionVO vo) {
		// TODO Auto-generated method stub
		return 	auctionMapper.adminSelectCount(vo);
	}

}
