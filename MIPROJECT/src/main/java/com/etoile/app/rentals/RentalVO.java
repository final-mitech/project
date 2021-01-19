package com.etoile.app.rentals;

import java.sql.Date;


public class RentalVO {
	String rentalId;
	String memberId;
	String productId;
	Date rentalStart;
	Date RentalEnd;
	int rentalPay;
	
	
	public String getRentalId() {
		return rentalId;
	}
	public void setRentalId(String rentalId) {
		this.rentalId = rentalId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public Date getRentalStart() {
		return rentalStart;
	}
	public void setRentalStart(Date rentalStart) {
		this.rentalStart = rentalStart;
	}
	public Date getRentalEnd() {
		return RentalEnd;
	}
	public void setRentalEnd(Date rentalEnd) {
		RentalEnd = rentalEnd;
	}
	public int getRentalPay() {
		return rentalPay;
	}
	public void setRentalPay(int rentalPay) {
		this.rentalPay = rentalPay;
	}
	
}
