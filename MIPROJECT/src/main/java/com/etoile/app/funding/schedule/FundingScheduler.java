package com.etoile.app.funding.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.etoile.app.funding.FundingVO;
import com.etoile.app.funding.service.FundingService;

@Component
public class FundingScheduler {
	
	@Autowired
	FundingService fundingService;
	
	@Scheduled(cron = "0 0 0 * * *")
	//@Scheduled(cron = "0 0 * * * *")
	public void fundingScheduleUpdate() {
		System.out.println("매일 오전 12시에 업뎃");
		/* System.out.println("매시간 0분에 호출"); */
		
		FundingVO vo = new FundingVO();
		
		//펀딩 오픈 예정 -> 펀딩 중
		fundingService.fundingStartUpdate(vo);
		
		//펀딩 중 -> 펀딩 마감 
		fundingService.fundingEndUpdate(vo);
		
		
	}
	
}
