//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.12;
pragma experimental ABIEncoderV2;

contract Funding {
    //투자자 구조체
    struct Investor{
        address payable addr; //투자자의 어드레스
        uint amount;          //투자액
    }
    
    address payable public creator; // 컨트랙트 소유자   
   
   //Funding Info
   struct fundInfo{
        uint numInvestors;    // 투자자수
        uint deadline;         // 마감일(UnixTime)
        string status;         // 모금활동 스테이터스
        bool ended;            // 모금 종료여부
        uint goalAmount;       // 목표액
        uint totalAmount;      // 총 투자액
        mapping(uint=>Investor) investors; // 투자자 관리를 위한 매핑
   }
   mapping(string=>fundInfo) public fundingList;
   
   function setting(string memory _fundingId, uint _duration, uint _goalAmount) public{
        creator = msg.sender;
        
        fundInfo storage fund = fundingList[_fundingId];
        //마감일 설정
        fund.deadline = now + _duration; 
        fund.goalAmount = _goalAmount*1000000000000000000;
        fund.status = "Funding";
        fund.ended = false;
        fund.numInvestors = 0;
        fund.totalAmount = 0;
        
        fundingList[_fundingId] = fund;
        
    }
    function getFunding(string memory _fundingId) public view returns(string memory id, uint goal, uint total, uint num){
        fundInfo storage fund = fundingList[_fundingId];
        return (_fundingId, fund.goalAmount, fund.totalAmount, fund.numInvestors);
   }
   // 투자 시에 호출되는 함수 
   function fund(string memory _fundingId) public payable {
       fundInfo storage fund = fundingList[_fundingId];
      
       Investor storage inv = fund.investors[fund.numInvestors];
       inv.addr = msg.sender; //투자자 주소
       inv.amount = msg.value;  //투자액
       fund.investors[fund.numInvestors++] = inv;
       fund.totalAmount += inv.amount;
       fundingList[_fundingId] = fund;
   }
   
   // 모금 성공/실패 여부에 따라 송금
   function checkGoalReached(string memory _fundingId) public onlyOwner{ 
       fundInfo storage fund = fundingList[_fundingId];
       //모금이 끝났다면 처리 중단
       //require(!fund.ended);
       
       //마감이 지나지 않았다면 처리 중단
       //require(now >= fund.deadline);
       
       if(fund.totalAmount >= fund.goalAmount){//모금 성공인 경우
           fund.status = "Campaign Succeeded";
           fund.ended = true;
           //컨트랙트 소유자에게 컨트랙트에 있는 모든 이더를 송금
           if(!creator.send(address(this).balance)){
               revert(); //throw
           }
       }else{ //모금 실패인 경우
           uint i = 0;
           fund.status = "Campaign Failed";
           fund.ended = true;
           //각 투자자에게 투자금을 돌려줌
           while(i<= fund.numInvestors){
               if(!fund.investors[i].addr.send(fund.investors[i].amount)){
                   revert();
               }
               i++;
           }
       }
       
   }

   
   modifier onlyOwner() {
       require(msg.sender == creator);
       _;
   }

    // TODO Add functions

    function kill() public {
        if (msg.sender == creator) {
            selfdestruct(creator);
        }
    }
}