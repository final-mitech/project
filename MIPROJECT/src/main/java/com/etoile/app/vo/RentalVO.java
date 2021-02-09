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
	private String date;
	private String cnt;
	private String productRental;
	private String rentalOrder;
	
	//페이징관련 처리를 위한 필드
	private int start;
	private int end;
}
