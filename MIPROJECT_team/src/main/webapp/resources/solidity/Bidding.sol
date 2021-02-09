pragma solidity ^0.6.10;

contract SimpleAuction {
    address payable public  creator;  //경매 진행자
    uint public numBidders;  //입찰자 수
    bool public auctionEnded; //경매진행 여부
    address public highestBidder;  //최고 입찰자
    uint public highestBid;  //최고 입찰금액
    
    //입찰자 구조체
    struct Bidder{
        address payable addr;
        uint bid;
    }
    
    //입찰자 관리를 위한 매핑
    mapping (uint => Bidder) public bidList;
    
    constructor() public {
        creator = msg.sender;
    }
    
    
    //입찰자 정보 리스트
    function bidding(string memory _title, string memory _name) public payable {
            Bidder storage bidder = bidList[numBidders++];
    		bidder.addr = msg.sender;
    		bidder.bid = msg.value;
    		}
    		

    //돈 돌려주기
    function checkSelfReached() public payable{
        uint i =0;
   		//입찰자들 매핑한거 돌리기
        for(i =0; i < numBidders; i++){
            if(bidList[i].addr == msg.sender){
            	if(bidList[i].bid != highestBid){
               	 	if(!msg.sender.send(bidList[i].bid)){
                    	revert();  //throw
                	}               	
                	delete bidList[i];  
                	return;             	
                }	
            }
            
        }
        
    }
} 