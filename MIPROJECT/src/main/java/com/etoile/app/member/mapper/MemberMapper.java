package com.etoile.app.member.mapper;

import java.util.List;

import com.etoile.app.member.common.RecordVO;
import com.etoile.app.vo.CouponVO;
import com.etoile.app.vo.GradeVO;
import com.etoile.app.vo.MemberVO;


public interface MemberMapper {
	//회원 전체 조회
	public List<MemberVO> memberList(MemberVO vo);
	//회원 상세 조회
	public MemberVO memberSelect(String id);
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
	
	//등급별 조건 및 혜택 조회
	public GradeVO gradeCoupon(String grade);	
	//쿠폰 전체 조회
	public List<CouponVO> couponList(CouponVO vo);
	//쿠폰 등록
	public int couponInsert(CouponVO vo);
	//쿠폰 수정
	public int couponUpdate(CouponVO vo);
	//쿠폰 삭제
	public int couponDelete(CouponVO vo);
	
	//고객별 대여이력 조회
	public List<RecordVO> memberRentalList(String id);
}
