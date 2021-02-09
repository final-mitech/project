pragma solidity ^0.6.10;

contract Auction{
    address payable public creator;
    uint public NumBidList;
    address public highestBidder;
    uint public highestBid;
    string public auctionId;
    
    struct BidList{
        string title;
        string id;
        address payable addr;
        uint bid;
    }
    
    mapping (uint => BidList) public bidList;

    function addAuction(string memory _auctionId, string memory _id) public payable{
        
        BidList storage bidder = bidList[NumBidList++];
        bidder.title = _auctionId;
        bidder.id = _id;
        bidder.addr = msg.sender;
        bidder.bid= msg.value;
        
        uint i = 0;
        for(i=0; i<NumBidList; i++){
            if(keccak256(bytes(bidList[i].title)) == keccak256(bytes(_auctionId))){
                if(bidList[i].bid < msg.value){
                  bidList[i].addr.transfer(bidList[i].bid);
                  delete bidList[i];
                  NumBidList--;
                }
            }
        }
        
        highestBid = msg.value;
        highestBidder = msg.sender;
    }
}