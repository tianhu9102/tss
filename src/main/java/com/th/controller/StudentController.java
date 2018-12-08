package com.th.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.th.bean.Student;
import com.th.dao.StudentDao;

@Controller
@RequestMapping(value = "/student")
public class StudentController
{
    @RequestMapping(value = "/indexs")
    public String dispIndex()
    {
        System.out.println("ddd ----  ");
        return "listStudents";
    }

    @RequestMapping(value = "/dispAlldata")
    @ResponseBody
    public List<Student> dispAlldatasets()
    {
        List<Student> lstStus = allStus();
        return lstStus;
    }

    @RequestMapping(value = "/queryByValue")
    @ResponseBody
    // 看成单值
    public List<Student> getStudentByValue(@RequestParam String keys)
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

    @RequestMapping(value = "/stueidt")
    public String editStu()
    {
        return "listStuedit";
    }

    @RequestMapping(value = "/stuadd")
    public String addStu()
    {
        return "listStuadd";
    }

    @RequestMapping(value = "/stu_add")
    @ResponseBody
    // 看成单值
    public Student addNewStu(@RequestParam(value = "name") String key1, @RequestParam(value = "age") String key2,
                    @RequestParam(value = "id") String key3)
    {
        Student stu1 = new Student();

        boolean addflagsuccess = true;
        List<Student> lstStu = allStus();
        for (Student item : lstStu)
        {
            if (item.getId().toString().equals(key3))
            {
                addflagsuccess = false;
                System.out.println("持久层无法添加新成员,已经存在 id=" + key3 + " 的成员");
            }
        }

        if (addflagsuccess == true)
        {
            stu1.setName(key1);
            stu1.setAge(Integer.valueOf(key2));
            stu1.setId(Integer.valueOf(key3));

            // 持久层
            StudentDao psp = new StudentDao();
            psp.addNewStu(stu1);
        }

        return stu1;
    }

    @RequestMapping(value = "/studelete")
    @ResponseBody
    // 看成单值
    public Map<String, String> deleteStu(@RequestParam(value = "id") String id)
    {
        Map<String, String> map = new HashMap<String, String>();

        // 持久层
        StudentDao psp = new StudentDao();
        boolean persistenceFlag = psp.deleteStudentById(Integer.valueOf(id));

        map.put("deletesuccess", String.valueOf(persistenceFlag));

        return map;
    }

    @RequestMapping(value = "/updataStudentById")
    @ResponseBody
    // 看成单值
    public Student updataStudentById(@RequestParam String name, @RequestParam String age, @RequestParam String id)
    {
        // 持久层
        StudentDao psp = new StudentDao();
        boolean persistenceFlag = psp.updataStudentById(Integer.valueOf(id), name, age);

        Student stu = new Student();
        if (persistenceFlag == true)
        {
            stu.setId(Integer.valueOf(id));
            stu.setName(name);
            stu.setAge(Integer.valueOf(age));
        }

        return stu;
    }

    // 获取所有数据，并按照id号升序排列
    public static List<Student> allStus()
    {
        StudentDao psp = new StudentDao();
        List<Student> lstStudents = psp.queryAllDatasets();

        Collections.sort(lstStudents, new Comparator<Student>()
        {
            public int compare(Student o1, Student o2)
            {
                int id1 = o1.getId();
                int id2 = o2.getId();
                if (id1 > id2)
                {
                    return 1;
                }
                else if (id1 == id2)
                {
                    return 0;
                }
                else
                {
                    return -1;
                }

            }

        });

        return lstStudents;
    }

}
