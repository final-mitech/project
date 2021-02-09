package com.etoile.app.funding.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.etoile.app.funding.FundingJoinVO;
import com.etoile.app.funding.FundingVO;
import com.etoile.app.funding.service.FundingService;
import com.etoile.app.member.service.MemberService;
import com.etoile.app.vo.CouponVO;

@Component
public class FundingScheduler {
	
	@Autowired
	FundingService fundingService;
	@Autowired
	MemberService memberService;
	
	@Scheduled(cron = "0 0 0 * * *")
//	@Scheduled(cron = "0 0 * * * *")
	public void fundingScheduleUpdate() {
		System.out.println("매일 오전 12시에 업뎃");
		/*System.out.println("매시간 0분에 호출");*/
		
		FundingVO vo = new FundingVO();
		
		//펀딩 오픈 예정 -> 펀딩 중
		fundingService.fundingStartUpdate(vo);
		
		//펀딩 중 -> 펀딩 마감 
		fundingService.fundingEndUpdate(vo);
		
		//성공한 펀딩내역 받아오기
		List<FundingVO> fundingList = memberService.sucessFunding();

		//성공한 펀딩에 참여한 내역 받아오기
		for(FundingVO fundingVO : fundingList) {
			List<FundingJoinVO> joinList = memberService.sucessFundingJoin(fundingVO.getFundingId());
			for(FundingJoinVO joinVO : joinList) {
				String[] tokenList = joinVO.getFundingGift().split("]");
				String product = tokenList[0];
				String[] tempList = tokenList[1].split("일권");
				int gift = Integer.parseInt(tempList[0]);
				
				//성공한 펀딩 내역, 쿠폰에 저장하기
				CouponVO coupon = new CouponVO();
				coupon.setMemberId(joinVO.getMemberId());
				coupon.setCouponSort(product);
				coupon.setGradeCoupon(gift);
				coupon.setCouponUsed(0);
				memberService.couponInsert(coupon);
			}
		}
		
		
	}
	
}
