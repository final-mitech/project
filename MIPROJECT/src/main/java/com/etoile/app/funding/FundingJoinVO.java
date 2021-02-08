package com.etoile.app.funding;

import lombok.Data;

@Data
public class FundingJoinVO {
	private String fundingJoinId;
	private String fundingId;
	private String memberId; //세션
	private int fundingPrice;
	private String fundingGift;
}
