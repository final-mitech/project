package com.etoile.app.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AuctionVO {
	private String auctionId;            
	private String memberId;                
	private String auctionTitle;                  
	private String auctionName;           
	private String auctionBrand;                    
	private String auctionCategory;              
	private String auctionImage;                   
	private String auctionContent;                
	private int auctionSuccessBid;                   
	private String auctionMemberId;              
	private int auctionBestPrice;                     
	private int auctionImmediateBid;                 
	private String auctionCondition;               
	private int auctionCalculate;                    
	private Date auctionStart;                            
	private Date auctionEnd;                              
	private String auctionSerial;   
	private int start;
	private int end;
	private int count;
	private String auctionPay;
	private String  auctionJoinId;
	private Date auctionDate;
	private int auctionJoinCount;
	private int auctionDelivery;
	private String auctionAddress;  
	private String auctionUpdateDate;
	private String selectWord;
}
