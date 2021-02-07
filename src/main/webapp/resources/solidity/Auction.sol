pragma solidity ^0.6.10;

contract bidding {
    address payable public creator;  
    uint public Bidders;  //입찰자들 수
    
    //입찰자 구조체 
    struct Bidder{
        address payable addr;
    	uint bid;	    
    }   
    
    //입찰자 관리를 위한 매핑
    mapping (uint => Bidder) public bidList;  

    constructor() public{
        creator = msg.sender;
    }
    
    //입찰자 정보 리스트
    function bid1(string memory _title, string memory _name) public payable {

            Bidder storage bid = bidList[Bidders++];
    		bid.addr = msg.sender;
    		bid.bid = msg.value;
  
        emit recentVoter(_title, _name, msg.value);     
    }
   
   //최근입찰자
    event recentVoter(
        string rtitle,  //상품명
        string rName,  //최고입찰자 
        uint rAmount  //입찰가격

    );
 
	//돈 입금받기
    function checkSelfReached() public payable{
        uint i =0;
        for(i =0; i < Bidders; i++){
            if(bidList[i].addr == msg.sender){
                if(!msg.sender.send(bidList[i].bid)){
                    revert();  //throw
                }
                delete bidList[i];
                return;
            }
            
        }
        
    }
}