package com.etoile.style.service;

import java.sql.SQLException;
import java.util.List;
import com.etoile.app.vo.StylingVO;

public interface StyleService {
	List<StylingVO> stylingList(StylingVO vo) throws SQLException; 	//스타일링 목록 조회
	StylingVO stylingSelect(StylingVO vo) throws SQLException;
	int stylingInsert(StylingVO vo) throws SQLException;
	int stylingDelete(StylingVO vo) throws SQLException;
	int stylingUpdate(StylingVO vo) throws SQLException;
}
