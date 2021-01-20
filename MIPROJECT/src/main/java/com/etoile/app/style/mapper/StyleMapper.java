package com.etoile.app.style.mapper;

import java.util.List;

import com.etoile.app.vo.StylingVO;

public interface StyleMapper {

	List<StylingVO> stylingList(StylingVO vo); 	//스타일링 목록 조회
	StylingVO stylingSelect(StylingVO vo);
	int stylingInsert(StylingVO vo);
	int stylingDelete(StylingVO vo);
	int stylingUpdate(StylingVO vo);
}
