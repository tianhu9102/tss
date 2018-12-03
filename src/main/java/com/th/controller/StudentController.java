package com.th.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.th.bean.Student;

@Controller
@RequestMapping(value = "/euipment")
public class StudentController
{
    @RequestMapping(value = "/indexs")
    public String dispIndex()
    {
        return "listStudents";
    }

    @RequestMapping(value = "/status")
    @ResponseBody
    public List<Student> dispStatus()
    {
        List<Student> lstStus = allStus();
        return lstStus;
    }

    @RequestMapping(value = "/queryByValue")
    @ResponseBody
    // 看成单值
    public List<Student> getStuByValue(@RequestParam String keys)
    {
        // 数据库获取所有数据
        List<Student> lstStudents = allStus();
        // 获取符合要求的数据
        List<Student> patternData = new ArrayList<Student>();

        for (Student item : lstStudents)
        {
            if (item.getId().toString().contains(keys) || item.getName().contains(keys)
                            || item.getAge().toString().contains(keys))
            {
                patternData.add(item);
            }
        }
        return patternData;
    }

    @RequestMapping("/addstudent")
    public String addStu()
    {
        return "addstu";
    }

    @RequestMapping(value = "/addstu")
    @ResponseBody
    // 看成单值
    public Student addNewStu(@RequestParam String key1, @RequestParam String key2, @RequestParam String key3)
    {
        // List<Student> lstStudents = allStus();

        Student stu1 = new Student();
        stu1.setName(key1);
        stu1.setAge(Integer.valueOf(key2));
        stu1.setId(Integer.valueOf(key3));

        return stu1;
    }

    public static List<Student> allStus()
    {

        List<Student> lstStudents = new ArrayList<Student>();

        Student stu1 = new Student();
        stu1.setName("小明");
        stu1.setAge(19);
        stu1.setId(20170322);

        Student stu2 = new Student();
        stu2.setName("小军");
        stu2.setAge(16);
        stu2.setId(20170311);

        Student stu3 = new Student();
        stu3.setName("小红");
        stu3.setAge(19);
        stu3.setId(20170390);

        Student stu4 = new Student();
        stu4.setName("小代");
        stu4.setAge(16);
        stu4.setId(20170314);

        Student stu5 = new Student();
        stu5.setName("黄建明");
        stu5.setAge(17);
        stu5.setId(20170326);

        Student stu6 = new Student();
        stu6.setName("孙军");
        stu6.setAge(19);
        stu6.setId(20170222);

        Student stu7 = new Student();
        stu7.setName("刘文军");
        stu7.setAge(16);
        stu7.setId(20170211);

        Student stu8 = new Student();
        stu8.setName("韩红");
        stu8.setAge(19);
        stu8.setId(20170190);

        Student stu9 = new Student();
        stu9.setName("邱代");
        stu9.setAge(16);
        stu9.setId(20170314);

        Student stu10 = new Student();
        stu10.setName("代明");
        stu10.setAge(17);
        stu10.setId(20170126);

        lstStudents.add(stu1);
        lstStudents.add(stu2);
        lstStudents.add(stu3);
        lstStudents.add(stu4);
        lstStudents.add(stu5);
        lstStudents.add(stu6);
        lstStudents.add(stu7);
        lstStudents.add(stu8);
        lstStudents.add(stu9);

        lstStudents.add(stu1);
        lstStudents.add(stu2);
        lstStudents.add(stu3);
        lstStudents.add(stu4);
        lstStudents.add(stu5);
        lstStudents.add(stu6);
        lstStudents.add(stu7);
        lstStudents.add(stu8);
        lstStudents.add(stu9);

        lstStudents.add(stu1);
        lstStudents.add(stu2);
        lstStudents.add(stu3);
        lstStudents.add(stu4);
        lstStudents.add(stu5);
        lstStudents.add(stu6);
        lstStudents.add(stu7);
        lstStudents.add(stu8);
        lstStudents.add(stu9);

        lstStudents.add(stu1);
        lstStudents.add(stu2);
        lstStudents.add(stu3);
        lstStudents.add(stu4);
        lstStudents.add(stu5);
        lstStudents.add(stu6);
        lstStudents.add(stu7);
        lstStudents.add(stu8);
        lstStudents.add(stu9);

        lstStudents.add(stu1);
        lstStudents.add(stu2);
        lstStudents.add(stu3);
        lstStudents.add(stu4);
        lstStudents.add(stu5);
        lstStudents.add(stu6);
        lstStudents.add(stu7);
        lstStudents.add(stu8);
        lstStudents.add(stu9);

        return lstStudents;
    }

}
