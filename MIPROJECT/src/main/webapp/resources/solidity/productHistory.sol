pragma solidity ^0.6.12;
pragma experimental ABIEncoderV2;

contract ProductHistory{
    
    struct ProductStatus{
        string status;
        string date;
    }
    
    ProductStatus[]  productHistory;
    mapping (string => ProductStatus[]) totalHistory;
    
    
    function setProductStatus(string memory _productId, string memory _status, string memory _date) public {
        productHistory = totalHistory[_productId];
        ProductStatus memory pStatus = ProductStatus({
            status : _status,
            date : _date
        });
        productHistory.push(pStatus);
        totalHistory[_productId] = productHistory;
    }
    
    function getProductStatus(string memory _productId) public view returns(ProductStatus[] memory pHistory){
        pHistory = totalHistory[_productId];
        return pHistory;
    }
    
    
}