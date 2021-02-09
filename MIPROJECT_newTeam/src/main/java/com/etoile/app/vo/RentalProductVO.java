package com.etoile.app.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class RentalProductVO {
	private String ProductId;
	private String productName;
	private String productImage;
	private String productStatus;
	private String ppl;
	private String name;
	private String rentalId;
	private Date rentalEnd;
}
