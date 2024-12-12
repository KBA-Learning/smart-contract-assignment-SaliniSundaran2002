// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

contract LargestNumber{
    uint16 firstNo;
    uint16 secondNo;
    uint16 thirdNo;
    uint16 digit;
    int16 value;
    
    function inputNumbers(uint16 _firstNo, uint16 _secondNo, uint16 _thirdNo) public {
        firstNo = _firstNo;
        secondNo = _secondNo;
        thirdNo = _thirdNo;
    } 

    function findLargest() public view returns (uint16){
        if(firstNo>secondNo && firstNo>thirdNo){
            return firstNo;
        } else  if (secondNo>firstNo && secondNo > thirdNo) {
            return secondNo;
        } else {
            return thirdNo;
        }
    }

    function getDigit(uint16 _digit) public  pure returns (string memory){
        if (_digit == 0) return "Zero";
        if (_digit == 1) return "One";
        if (_digit == 2) return "Two";
        if (_digit == 3) return "Three";
        if (_digit == 4) return "Four";
        if (_digit == 5) return "Five";
        if (_digit == 6) return "Six";
        if (_digit == 7) return "Seven";
        if (_digit == 8) return "Eight";
        if (_digit == 9) return "Nine";
        return "Invalid";     
    }

    function  checkSign(int16 _value)public  pure returns(string memory){
        if(_value >0){
            return "Positive";
        } else if(_value <0){
            return "Negative";
        } else {
            return "Zero";
        }
    } 
}
