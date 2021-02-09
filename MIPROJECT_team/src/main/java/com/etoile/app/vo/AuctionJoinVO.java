package com.etoile.app.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AuctionJoinVO {
	private String auctionJoinId;
	private String memberId;     
	private String auctionId;     
	private String auctionAddress;          
	private String auctionPay;            
	private int auctionPrice;                
	private Date auctionDate;                    
	private int auctionCancel;      
	private int auctionDelivery;
}
