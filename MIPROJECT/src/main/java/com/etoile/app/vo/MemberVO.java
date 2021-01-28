package com.etoile.app.vo;

import lombok.Data;

@Data
public class MemberVO {
	//회원 정보
	private String memberId;
	private String password;
	private String name;
	private String phone;
	private String email;
	private String address;
	private String grade;
	
	//페이징처리
	private int start;
	private int end;
}
