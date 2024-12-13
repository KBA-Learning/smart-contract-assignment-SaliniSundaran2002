// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract SMS {
    enum department {CS,EC,ME}
    struct StudentData {
        uint256 id;
        string name;
        string sem;
        department dept;
        uint256 CGPA;
        uint256 rollNo;
        address studentAddress;
    }

    address public staffAdvisor;
        string name;

    modifier onlyStaffAdvisor {
        require(msg.sender == staffAdvisor, "Unauthorized access");
        _;
    }

    StudentData[] public students;

    constructor() {
        staffAdvisor = msg.sender;
    }

    function setStudentDetails(
        uint256 _id,
        string memory _name,
        string memory _sem,
        department _dept,
        uint256 _CGPA,
        uint256 _rollNo,
        address _studentAddress
    ) public onlyStaffAdvisor {
        for (uint256 i = 0; i < students.length; i++) {
            require(students[i].id != _id, "Student ID already exists");
        }
        students.push(StudentData(_id, _name, _sem, _dept, _CGPA, _rollNo, _studentAddress));
    }

    function editStudentName(uint256 _id, string memory _name) public {
        for (uint256 i = 0; i < students.length; i++) {
            if (students[i].id == _id) {
                require(msg.sender == students[i].studentAddress, "Unauthorized student");
                students[i].name = _name;
                return;
            }
        }
        // revert("Student not found");
    }

    function getStudentData() public view returns (StudentData[] memory){
        return students;
    }
}
