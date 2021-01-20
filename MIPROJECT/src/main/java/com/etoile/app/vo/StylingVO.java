package com.etoile.app.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class StylingVO {
	private  String styleId;
	private String memberId;
	private String styleTag;
	private Date styleDate;
	private int styleRecommend;
	private String styleContent;
	
	
}
