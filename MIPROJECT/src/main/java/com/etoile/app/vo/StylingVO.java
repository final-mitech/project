package com.etoile.app.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class StylingVO {
	private String styleId;
	private String memberId;
	private String styleTag;
	private Date styleDate;
	private int styleRecommend;
	private String styleContent;
	private String styleImage;
	//페이징관련 처리를 위한 필드
	private int start;
	private int end;
}
