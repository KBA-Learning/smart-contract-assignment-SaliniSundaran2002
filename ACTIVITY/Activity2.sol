// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract LeapYear{
    uint16 year;

    function inputYear(uint16 _year) public {
        year = _year;
    }

    function findLeapyear() public  view returns (string memory){
        if(year>999 && year<10000){ 
            if(year % 4 == 0){
                return "Leap year";
            } else {
                return "Not Leap year"; 
            }
        } else {
            return "Invalid Year";
        }
    }

}