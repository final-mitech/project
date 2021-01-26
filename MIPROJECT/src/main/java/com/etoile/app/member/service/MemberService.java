package com.etoile.app.member.service;

import java.util.List;

import com.etoile.app.vo.MemberVO;

public interface MemberService {
	//회원 전체 조회
		public List<MemberVO> memberList(MemberVO vo);
		//회원 상세 조회
		public MemberVO memberSelect(MemberVO vo);
		//회원 등록
		public int memberInsert(MemberVO vo);
		//회원 정보 수정
		public int memberUpdate(MemberVO vo);
		//아이디 중복여부 체크
		public int idChecked(MemberVO vo);
		//로그인
		public int login(MemberVO vo);
		//페이징을 위한 멤버 카운트
		public int memberCount(MemberVO vo);
}
