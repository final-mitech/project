package com.etoile.app.member.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoile.app.member.common.RecordVO;
import com.etoile.app.member.mapper.MemberMapper;
import com.etoile.app.member.service.MemberService;
import com.etoile.app.vo.CouponVO;
import com.etoile.app.vo.GradeVO;
import com.etoile.app.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper dao;
	
	@Override
	public List<MemberVO> memberList(MemberVO vo) {
		return dao.memberList(vo);
	}
	@Override
	public List<Map<String, Object>> memberDownload(MemberVO vo) {
		return dao.memberDownload(vo);
	}
	@Override
	public MemberVO memberSelect(String id) {
		return dao.memberSelect(id);
	}

	@Override
	public int memberInsert(MemberVO vo) {
		return dao.memberInsert(vo);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		return dao.memberUpdate(vo);
	}

	@Override
	public int idChecked(MemberVO vo) {
		return dao.idChecked(vo);
	}

	@Override
	public int login(MemberVO vo) {
		return dao.login(vo);
	}

	@Override
	public int memberCount(MemberVO vo) {
		return dao.memberCount(vo);
	}

	@Override
	public GradeVO gradeCoupon(String grade) {
		return dao.gradeCoupon(grade);
	}
	
	@Override
	public List<CouponVO> couponList(CouponVO vo) {
		return dao.couponList(vo);
	}

	@Override
	public int couponInsert(CouponVO vo) {
		return dao.couponInsert(vo);
	}

	@Override
	public int couponUpdate(CouponVO vo) {
		return dao.couponUpdate(vo);
	}

	@Override
	public int couponDelete(CouponVO vo) {
		return dao.couponDelete(vo);
	}

	@Override
	public List<RecordVO> memberRentalList(String id) {
		return dao.memberRentalList(id);
	}







}
