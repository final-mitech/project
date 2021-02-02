package com.etoile.app.auction.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.etoile.app.auction.service.AuctionService;
import com.etoile.app.vo.AuctionVO;

@Component
public class AuctionSchedule {

	@Autowired
	AuctionService auctionService;

	@Scheduled(cron = "0 10 9 * * *") // 0시 마다로 바꾸기
	public void auctionSchedule() {
	
		AuctionVO vo = new AuctionVO();
		
		// 오픈예정 -> 경매중
		auctionService.updateAuctionStart(vo);

		// 경매중 -> 경매마감
		auctionService.updateAuctionEnd(vo);
	}

}
