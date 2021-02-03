package com.etoile.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etoile.app.auction.service.AuctionService;
import com.etoile.app.funding.FundingVO;
import com.etoile.app.funding.service.FundingService;
import com.etoile.app.member.common.RecordVO;
import com.etoile.app.member.service.MemberService;
import com.etoile.app.rental.service.RentalService;
import com.etoile.app.style.service.StyleService;
import com.etoile.app.vo.AuctionVO;
import com.etoile.app.vo.ProductVO;
import com.etoile.app.vo.StylingVO;

@Controller
public class HomeController {

	@Autowired
	private RentalService rentalService;
	@Autowired
	private StyleService styleService;
	@Autowired
	private FundingService fundingService;
	@Autowired
	private AuctionService auctionService;
	
	// 고객 사이트로 연결
	@RequestMapping("/")
	public String home(Model model) {
		// 대여 요청 리스트	
		ProductVO productVO = new ProductVO();
		productVO.setStart(1);
		productVO.setEnd(4);
		List<ProductVO> rentalList = rentalService.rentalProductList(productVO);
		model.addAttribute("rentalList", rentalList);
		
		// 마이 스타일링 리스트
		StylingVO stylingVO = new StylingVO();
		stylingVO.setStart(1);
		stylingVO.setEnd(4);
		List<StylingVO> stylingList = styleService.stylingList(stylingVO);
		model.addAttribute("stylingList", stylingList); 

		
		// 펀딩 리스트
		FundingVO fundingVO = new FundingVO();
		fundingVO.setPage("registerPage");
		List<FundingVO> fundingList = fundingService.fundingList(fundingVO);
		model.addAttribute("fundingList", fundingList);
		
		// 경매 리스트
		AuctionVO auctionVO = new AuctionVO();
		auctionVO.setStart(1);
		auctionVO.setEnd(4);
		List<AuctionVO> auctionList = auctionService.getAuction(auctionVO);
		model.addAttribute("auctionList", auctionList);
		return "site/main/main";
	}

	// 관리자 사이트로 연결
	@RequestMapping("/admin")
	public String admin() {
		return "admin/main/loginForm";
	}
}
