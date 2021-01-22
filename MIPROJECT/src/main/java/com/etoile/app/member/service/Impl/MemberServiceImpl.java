package com.etoile.app.member.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoile.app.member.mapper.MemberMapper;
import com.etoile.app.member.service.MemberService;
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
	public MemberVO memberSelect(MemberVO vo) {
		return dao.memberSelect(vo);
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

}
