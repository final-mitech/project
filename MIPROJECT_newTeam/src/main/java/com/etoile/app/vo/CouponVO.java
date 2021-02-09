package com.etoile.app.vo;

import lombok.Data;

@Data
public class CouponVO {
	private String couponId;
	private String memberId;
	private String couponSort;
	private int gradeCoupon;
	private int fundingCoupon;
	private int couponUsed;
}
