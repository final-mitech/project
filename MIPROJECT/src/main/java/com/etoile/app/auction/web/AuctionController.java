package com.etoile.app.auction.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etoile.app.history.common.Paging;
import com.etoile.app.auction.service.AuctionService;
import com.etoile.app.vo.AuctionJoinVO;
import com.etoile.app.vo.AuctionVO;

@Controller
public class AuctionController {

	@Autowired
	private AuctionService auctionService; // AuctionServiceImpl 객체를 자동주입

	// AuctionMapper auctionMapper;

	// 메인페이지 호출 (경매상태별이 디폴트)
	@RequestMapping("/site/auctionMain")
	public String getAuction(AuctionVO vo, Model model, Paging paging) {
		// 페이징처리
		// 한 페이지 출력건수
		paging.setPageUnit(8);
		// 전체 건수
		int totalCount = auctionService.getAuctionCount(vo);
		paging.setTotalRecord(totalCount); // 임의로 지정
		// 총 페이지 번호
		paging.setPageSize(5);
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		// 시작/마지막 레코드 번호
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		model.addAttribute("paging", paging);

		// 데이터조회
		List<AuctionVO> list = new ArrayList<AuctionVO>();
		list = auctionService.getAuction(vo);
		model.addAttribute("list", list);

		return "site/auction/auctionMain";
	}

	// 상세페이지 호출
	@RequestMapping("/site/auctionOne")
	public String getAuctionOne(AuctionVO vo, AuctionJoinVO jo, Model model, String id) {
		vo.setAuctionId(id);
		model.addAttribute("vo", auctionService.getAuctionOne(vo));

		jo.setAuctionId(id);
		List<AuctionJoinVO> list = new ArrayList<AuctionJoinVO>();
		list = auctionService.getJoinRecent(jo);
		model.addAttribute("list", list);

		model.addAttribute("to", auctionService.getJoinTop(jo));

		return "site/auction/auctionOne";
	}

	// 검색페이지 호출
	@RequestMapping("/site/auctionSearch")
	public String getSearch(AuctionVO vo, Model model, String word, Paging paging) {

		vo.setAuctionName(word);

		// 페이징처리
		// 한 페이지 출력건수
		paging.setPageUnit(8);
		// 전체 건수
		int totalCount = auctionService.getAuctionCount(vo);
		paging.setTotalRecord(totalCount); // 임의로 지정
		// 총 페이지 번호
		paging.setPageSize(5);
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		// 시작/마지막 레코드 번호
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		model.addAttribute("paging", paging);

		// 데이터조회
		List<AuctionVO> list = new ArrayList<AuctionVO>();
		list = auctionService.getSearch(vo);
		model.addAttribute("list", list);

		return "site/auction/auctionMain";
	}

	// 인기순 정렬 호출
	@RequestMapping("/site/auctionHottest")
	public String getHottest(AuctionVO vo, Model model, Paging paging) {

		// 페이징처리
		// 한 페이지 출력건수
		paging.setPageUnit(8);
		// 전체 건수
		int totalCount = auctionService.getAuctionCount(vo);
		paging.setTotalRecord(totalCount); // 임의로 지정
		// 총 페이지 번호
		paging.setPageSize(5);
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		// 시작/마지막 레코드 번호
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		model.addAttribute("paging", paging);

		// 데이터조회
		List<AuctionVO> list = new ArrayList<AuctionVO>();
		list = auctionService.getHottest(vo);
		model.addAttribute("list", list);

		return "site/auction/auctionMain";
	}

	// 최신순페이지 호출
	@RequestMapping("/site/auctionRecent")
	public String getRecent(AuctionVO vo, Model model, Paging paging) {
		// 페이징처리
		// 한 페이지 출력건수
		paging.setPageUnit(8);
		// 전체 건수
		int totalCount = auctionService.getAuctionCount(vo);
		paging.setTotalRecord(totalCount); // 임의로 지정
		// 총 페이지 번호
		paging.setPageSize(5);
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		// 시작/마지막 레코드 번호
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		model.addAttribute("paging", paging);

		// 데이터조회
		List<AuctionVO> list = new ArrayList<AuctionVO>();
		list = auctionService.getRecent(vo);
		model.addAttribute("list", list);

		return "site/auction/auctionMain";
	}

	// 등록페이지 호출
	@RequestMapping("/site/auctionJoinForm.do")
	public String main() {
		return "site/auction/auctionJoin";
	}

	// 등록
	@RequestMapping(value = "/site/auctionJoin.do", method = RequestMethod.POST)
	@ResponseBody
	public String insertAuction(AuctionVO vo) {
		System.out.println(vo.toString());
		int result = auctionService.insertAuction(vo);
		String str = Integer.toString(result);
		System.out.println(str);
		return str;
	}

	// 경매 참여 등록
	@RequestMapping(value = "/site/auctionBidJoin.do", method = RequestMethod.POST)
	@ResponseBody
	public String insertAuctionJoin(AuctionVO bo, AuctionJoinVO vo) {
		// 경매 최고가 등록
		auctionService.updateAuctionBp(bo);

		// 경매 참여 DB 등록
		int result = auctionService.insertAuctionJoin(vo);
		String str = Integer.toString(result);
		System.out.println(str);

		// 경매 참여 수 등록
		auctionService.updateAuctionCount(bo);
		return str;
	}

	// 마이페이지 경매 참여 내역
	// 메인페이지 호출 (경매상태별이 디폴트)
	@RequestMapping("/site/myAuctionJoin.do")
	public String getMyAuctionJoin(AuctionVO vo, Model model, Paging paging) {
		// 페이징처리
		// 한 페이지 출력건수
		paging.setPageUnit(3);
		// 전체 건수
		int totalCount = auctionService.getMyJoinCount(vo);
		paging.setTotalRecord(totalCount); // 임의로 지정
		// 총 페이지 번호
		paging.setPageSize(5);
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		// 시작/마지막 레코드 번호
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		model.addAttribute("paging", paging);

		// 데이터조회
		List<AuctionVO> list = new ArrayList<AuctionVO>();
		list = auctionService.getMyAuctionJoin(vo);
		model.addAttribute("list", list);

		return "site/my/myAuctionJoin";
	}

	// 마이페이지 경매 낙찰 내역
	// 메인페이지 호출 (배송상태별이 디폴트)
	@RequestMapping("/site/myAuctionBid.do")
	public String getMyAuctionBid(AuctionVO vo, Model model, Paging paging) {
		// 페이징처리
		// 한 페이지 출력건수
		paging.setPageUnit(3);
		// 전체 건수
		int totalCount = auctionService.getMyBidCount(vo);
		paging.setTotalRecord(totalCount); // 임의로 지정
		// 총 페이지 번호
		paging.setPageSize(5);
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		// 시작/마지막 레코드 번호
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		model.addAttribute("paging", paging);

		// 데이터조회
		List<AuctionVO> list = new ArrayList<AuctionVO>();
		list = auctionService.getMyAuctionBid(vo);
		model.addAttribute("list", list);

		return "site/my/myAuctionBid";
	}

	// 마이페이지 대리 경매 내역
	// 메인페이지 호출 (배송상태별이 디폴트)
	@RequestMapping("/site/myAuctionReq.do")
	public String getMyAuctionReq(AuctionVO vo, Model model, Paging paging) {
		// 페이징처리
		// 한 페이지 출력건수
		paging.setPageUnit(3);
		// 전체 건수
		int totalCount = auctionService.getMyReqCount(vo);
		paging.setTotalRecord(totalCount); // 임의로 지정
		// 총 페이지 번호
		paging.setPageSize(5);
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		// 시작/마지막 레코드 번호
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		model.addAttribute("paging", paging);

		// 데이터조회
		List<AuctionVO> list = new ArrayList<AuctionVO>();
		list = auctionService.getMyAuctionReq(vo);
		model.addAttribute("list", list);

		return "site/my/myAuctionReq";
	}

	// 마이 배송지 입력
	@RequestMapping(value = "/site/myAuctionAddr.do", method = RequestMethod.POST)
	@ResponseBody
	public String myAuctionAddr(AuctionJoinVO vo) {

		// 배송지 DB 등록
		int result = auctionService.myAuctionAddr(vo);
		String str = Integer.toString(result);
		System.out.println(str);

		return str;
	}

	// 마이 경매 회수요청
	@RequestMapping(value = "/site/myAuctionRecover.do", method = RequestMethod.POST)
	@ResponseBody
	public String myAuctionRecover(AuctionVO vo) {

		// 경매상태 DB 등록
		int result = auctionService.myAuctionRecover(vo);
		String str = Integer.toString(result);
		System.out.println(str);

		return str;
	}

	// 마이 경매 진행확정
	@RequestMapping(value = "/site/myAuctionConfirm.do", method = RequestMethod.POST)
	@ResponseBody
	public String myAuctionConfirm(AuctionVO vo) {

		// 경매상태 DB 등록
		int result = auctionService.myAuctionConfirm(vo);
		String str = Integer.toString(result);
		System.out.println(str);

		return str;
	}

	// 마이 경매 정산받기
	@RequestMapping(value = "/site/myAuctionSettle.do", method = RequestMethod.POST)
	@ResponseBody
	public String myAuctionSettle(AuctionVO vo) {

		// 경매상태 DB 등록
		int result = auctionService.myAuctionSettle(vo);
		String str = Integer.toString(result);
		System.out.println(str);

		return str;
	}

	// 관리자 경매 요청리스트 (경매상태 업데이트 날짜가 디폴트)
	@RequestMapping("/admin/auctionReqList.a")
	public String getAdminReq(AuctionVO vo, Model model, Paging paging) {
		// 페이징처리
		// 한 페이지 출력건수
		paging.setPageUnit(10);
		// 전체 건수
		int totalCount = auctionService.getAdminReqCount(vo);
		paging.setTotalRecord(totalCount); // 임의로 지정
		// 총 페이지 번호
		paging.setPageSize(10);
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		// 시작/마지막 레코드 번호
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		model.addAttribute("paging", paging);

		// 데이터조회
		List<AuctionVO> list = new ArrayList<AuctionVO>();
		list = auctionService.getAdminReq(vo);
		model.addAttribute("list", list);

		return "admin/auction/auctionReqList";
	}

	// 관리자 경매 현황리스트 (경매상태가 디폴트)
	@RequestMapping("/admin/getAdminList.a")
	public String getAdminList(AuctionVO vo, Model model, Paging paging) {
		// 페이징처리
		// 한 페이지 출력건수
		paging.setPageUnit(10);
		// 전체 건수
		int totalCount = auctionService.getAdminListCount(vo);
		paging.setTotalRecord(totalCount); // 임의로 지정
		// 총 페이지 번호
		paging.setPageSize(10);
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		// 시작/마지막 레코드 번호
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		model.addAttribute("paging", paging);

		// 데이터조회
		List<AuctionVO> list = new ArrayList<AuctionVO>();
		list = auctionService.getAdminList(vo);
		model.addAttribute("list", list);

		return "admin/auction/auctionAdminList";
	}

}
