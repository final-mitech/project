package com.etoile.app.funding;

import java.sql.Date;

import lombok.Data;

@Data
public class FundingVO {
	private String fundingId;
	private String fundingTitle;
	private String fundingName;
	private String fundingSerial;
	private String fundingBrand;
	private String fundingCategory;
	private String fundingContent;
	private String fundingImage;
	private Date fundingStart;
	private Date fundingEnd;
	private int fundingGoal;
	private int fundingTotalprice;
	private String fundingCondition;
	private String fundingGift;
	
	private String fundingDday;
	
	private String page;
	
	//마이페이지 조인펀딩리스트
	private String fundingJoinId;
	private String memberId; //세션
	private int fundingPrice;
	
	//페이징
	private int start;
	private int end;
	private int count;
	
	//정렬
	private String sort;

}
