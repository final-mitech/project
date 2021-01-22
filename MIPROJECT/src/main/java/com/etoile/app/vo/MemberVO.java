package com.etoile.app.vo;

import lombok.Data;

@Data
public class MemberVO {
	private String memberId;
	private String password;
	private String name;
	private String phone;
	private String email;
	private String address;
	private String grade;
}
