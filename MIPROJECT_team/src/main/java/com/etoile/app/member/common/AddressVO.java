package com.etoile.app.member.common;

import lombok.Data;

@Data
public class AddressVO {
	//주소API로 받아오는 값을 받기위한 VO객체
	private String postcode;
	private String address;
	private String detailAddress;
}
