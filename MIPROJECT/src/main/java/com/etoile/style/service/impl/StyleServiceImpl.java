package com.etoile.style.service.impl;

import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoile.app.style.mapper.StyleMapper;
import com.etoile.app.vo.StylingVO;
import com.etoile.style.service.StyleService;

//@Service("styleService")	//무엇?
public class StyleServiceImpl implements StyleService {

//	@Autowired
	private StyleMapper dao;
	
	@Override
	public List<StylingVO> stylingList(StylingVO vo) throws SQLException {
		
		return dao.stylingList(vo);
	}

	@Override
	public StylingVO stylingSelect(StylingVO vo) throws SQLException {

		return dao.stylingSelect(vo);
	}

	@Override
	public int stylingInsert(StylingVO vo) throws SQLException {

		return dao.stylingInsert(vo);
	}

	@Override
	public int stylingDelete(StylingVO vo) throws SQLException {

		return dao.stylingDelete(vo);
	}

	@Override
	public int stylingUpdate(StylingVO vo) throws SQLException {

		return dao.stylingUpdate(vo);
	}
}
