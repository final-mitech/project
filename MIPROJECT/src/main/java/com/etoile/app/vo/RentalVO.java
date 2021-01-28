package com.etoile.app.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class RentalVO {
	private String rentalId;
	private String memberId;
	private String productId;
	private Date rentalStart;
	private Date rentalEnd;
	private int rentalPrice;
	private String rentalAddress;
	private String rentalPay;
	private String productImage;
	private String productName;
	private String productStatus;
	private String ppl;
	private String name;
	private String rentalWaybill;
}
