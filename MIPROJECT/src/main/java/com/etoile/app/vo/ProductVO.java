package com.etoile.app.vo;

import lombok.Data;

@Data
public class ProductVO {
	private String productId;
	private String productName;
	private String productSerial;
	private String productBrand;
	private String productType;
	private int productPrice;
	private String productContent;
	private String productImage;
	private String productStatus;
	private String ppl;
	private int productRental;
}
