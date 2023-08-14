// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;


    struct student {
        string name;
        uint grade;
        bool pass;
    }
    students[] public stu;  //当变量前加了一个public函数修饰符，等于自动帮他创建了一个get函数


    function set(string calldata _name, uint _grade, bool _pass) public {
        //第一种往数组里传元素的方法
        stu.push(students(_name, _grade, _pass));

        //第二种，通过关键字传参数
        stu.push(students({grade:_grade, name:_name, pass:_pass}));

        //第三种
        students memory Mystu;
        Mystu.name = _name;
        Mystu.grade = _grade;
        Mystu.pass = _pass;
        stu.push(Mystu);
    }


    //function get(uint _index) public view returns(string memory, uint, bool) {
        //return(stu[_index].name, stu[_index].grade, stu[_index].pass)
    //}

    function setName(uint _index, string _name) public {
        Student storage newstudent = stu[_index];
        newstudent.name = _name;
    }
}