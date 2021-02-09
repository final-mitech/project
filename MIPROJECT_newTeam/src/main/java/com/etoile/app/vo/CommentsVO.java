package com.etoile.app.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CommentsVO {
	private String commentId;
	private String styleId;
	private String memberId;
	private String commentContent;
	private Date commentDate;
}
