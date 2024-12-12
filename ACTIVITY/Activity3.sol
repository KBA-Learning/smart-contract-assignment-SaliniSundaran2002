//SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract Employee {
struct emp{    
    string  name;
    string  departmentment;
    string  designationation;
    uint16  salary;
    address payable paymentAddress;

    }
    emp public employee;
    // function getEmployee()public view returns(string memory,string memory,string memory ,uint16,address payable ) {
    //     return (employee.name,employee.departmentment,employee.designationation,employee.salary, employee.paymentAddress);
    // }
    function setEmployee(string memory _name,string memory _department,string memory _designation,uint16 _salary,address payable _paymentAddress) public {
        employee.name=_name;
        employee.departmentment=_department;
        employee.designationation=_designation;
        employee.salary=_salary;
        employee.paymentAddress=_paymentAddress;
    }
     function ethTowei(uint eval) public pure returns(uint){
        return(eval*1000000000000000000);
     }

       
           function payemp() public payable {
            uint sal =ethTowei(employee.salary);
                        require(msg.value == sal, "Insufficient payment amount");
                        require(employee.paymentAddress != address(0), "Employee wallet not set");
                        employee.paymentAddress.transfer(sal);
            }
       
}