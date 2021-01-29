package com.etoile.app.member.common;

import lombok.Data;

@Data
public class RecordVO {
	private String productName;
	private String productType;
	private String ppl;
	private String rentalId;
	private String memberId;
	private String rentalStart;
	private String rentalEnd;
	private int rentalPay;

}
