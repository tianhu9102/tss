package com.th.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.th.bean.Student;

@Controller
@RequestMapping(value = "/th")
public class DemoController
{
    // 用例1： SpringMVC - HelloWorld
    @RequestMapping(value = "/hello")
    public String index()
    {
        return "demoMVC";
    }

    @RequestMapping(value = "/student")
    public String FindStudent()
    {
        // return "stu";
        return "redirect:hello"; // 用例： 跳转
    }

    // 用例2: ModelAndView用例
    // 向前台传递数据
    @RequestMapping(value = "/student1")
    public ModelAndView FindStudentAttribute()
    {
        ModelAndView mav = new ModelAndView("stu1");
        // mav.setViewName("stu1"); // 或者在新建时修改

        // 对象一： 普通对象
        mav.addObject("time", new Date());

        // 对象二： List
        List<String> lstBook = new ArrayList<String>();
        lstBook.add("java");
        lstBook.add("php");
        lstBook.add("c++");

        mav.addObject("bookLst", lstBook);

        // 对象三： Map
        Map<String, String> map = new HashMap<String, String>();
        map.put("张文", "FuJian");
        map.put("黎明", "HeBei");
        map.put("齐韵", "TaiWan");

        mav.addObject("person", map);

        return mav;
    }

    // 用例3：从前台获取数据后，再传回前台 TODO
    // required = false 可以允许为空; required = true 不允许为空
    // 前台传入的数据，真正起解析意义的是value = "nameVal"，如不指定，默认为形参
    // http://localhost:8080/tss/th/student2?nameVal=fdas
    @RequestMapping(value = "/student2")
    public String parseParams(@RequestParam(value = "nameVal", required = true) String name)
    {
        System.out.println(name + "_32");

        return "stu2";
    }

    // 用例4：@PathVariable用法，地址模板
    // http://localhost:8080/tss/th/student3/28?nameVal=432&placeVal=Hebei
    @RequestMapping(value = "/student3/{age}")
    public String TestPathVariable(@RequestParam(value = "nameVal") String name,
                    @RequestParam(value = "placeVal", defaultValue = "China") String place,
                    @PathVariable(value = "age") String age)
    {
        System.out.println("name: " + name + "  ; age: " + age + "  ;  place:" + place);
        return "stu3";
    }

    // 示例5: ResponseBody使用方法
    @RequestMapping("/student4")
    public String testBody()
    {
        return "stu4";
    }

    // 示例5.1：ResponseBody返回类对象
    @RequestMapping(value = "/student5", method = { RequestMethod.POST }, produces = "application/json;charset=utf-8")
    @ResponseBody
    public Student jsonDataReq(@RequestBody Student[] stu)
    {
        Student st = new Student();

        for (Student item : stu)
        {
            st.setName(item.getName());
            st.setId(item.getId());
            st.setAge(item.getAge());

            String jsonObj = JSON.toJSONString(item);
            System.out.println(jsonObj);
        }
        // 将数据返回前端
        return st;
    }

    // 示例5.2：ResponseBody返回List列表
    // 包含中文参数传递
    @RequestMapping(value = "/student6", method = { RequestMethod.POST }, produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<Student> jsonDataReqList(@RequestBody Student[] stu)
    {
        List<Student> lst = new LinkedList<Student>();
        for (Student item : stu)
        {
            Student st = new Student();
            st.setName(item.getName() + "_A");
            st.setId(item.getId());
            st.setAge(item.getAge());

            String jsonObj = JSON.toJSONString(item);
            System.out.println(jsonObj);

            lst.add(st);
        }
        // 将数据返回前端
        return lst;
    }

    // 示例5.3： ResponseBody返回Map键值对
    @RequestMapping(value = "/student7", method = { RequestMethod.POST })
    @ResponseBody
    public Map<String, Student> jsonDataReqMap(@RequestBody Student[] stu)
    {
        Map<String, Student> map = new HashMap<String, Student>();
        int i = 0;
        for (Student item : stu)
        {
            Student st = new Student();
            st.setName(item.getName() + "_A");
            st.setId(item.getId());
            st.setAge(item.getAge());

            String jsonObj = JSON.toJSONString(item);
            System.out.println(jsonObj);

            i++;
            map.put("mapStu_" + i, st);
        }
        // 将数据返回前端
        return map;
    }

    // 示例5.4：ResponseBody返回 Map<List>列表
    @RequestMapping(value = "/student8")
    @ResponseBody
    public List<Map<String, Student>> testListMaps()
    {
        List<Map<String, Student>> lstMap = new ArrayList<Map<String, Student>>();
        Map<String, Student> map1 = new HashMap<String, Student>();
        Map<String, Student> map2 = new HashMap<String, Student>();
        Map<String, Student> map3 = new HashMap<String, Student>();

        Student stu1 = new Student();
        stu1.setAge(16);
        stu1.setId(1);
        stu1.setName("Tom");
        Student stu2 = new Student();
        stu2.setAge(17);
        stu2.setId(2);
        stu2.setName("Tpm");
        Student stu3 = new Student();
        stu3.setAge(18);
        stu3.setId(3);
        stu3.setName("Tum");

        map1.put("animal", stu1);
        map2.put("animal", stu2);
        map3.put("animal", stu3);

        lstMap.add(map1);
        lstMap.add(map2);
        lstMap.add(map3);
        System.out.println("----");

        return lstMap;
    }

}
