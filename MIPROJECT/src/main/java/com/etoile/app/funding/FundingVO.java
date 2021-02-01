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
	

}
