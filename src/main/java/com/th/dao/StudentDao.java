package com.th.dao;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import com.th.bean.Student;

public class StudentDao
{
    public static final String filepath = "d:/stulist.xml";

    public List<Student> queryAllDatasets()
    {
        List<Student> lstStudents = new ArrayList<Student>();

        // 1.创建一个xml解析器对象
        SAXReader reader = new SAXReader();

        // 2.读取xml文档，返回Document对象
        Document doc = null;
        File file = new File(filepath);
        try
        {
            doc = reader.read(file);
        }
        catch (DocumentException e)
        {
            e.printStackTrace();
        }

        Element elem = doc.getRootElement();
        // System.out.println("-----------" + elem.getName());

        List<Node> nodes = doc.selectNodes("/studentlist/student");
        for (Node node : nodes)
        {
            Student stu = new Student();
            stu.setName(node.selectSingleNode("name").getText());
            stu.setAge(Integer.valueOf(node.selectSingleNode("age").getText()));
            stu.setId(Integer.valueOf(node.selectSingleNode("id").getText()));

            lstStudents.add(stu);
        }

        return lstStudents;
    }

    public void addNewStu(Student stu)
    {
        System.out.println("持久层------- 添加学生");
        File file = new File(filepath);

        SAXReader reader = new SAXReader();
        try
        {
            Document doc = reader.read(file);
            // 获取根目录
            Element rootElement = doc.getRootElement();

            // 根节点shopping下有多个student
            // List<Element> studentList = rootElement.elements("student");

            Element newElment = rootElement.addElement("student");
            Element nameElment = newElment.addElement("name");
            Element ageElment = newElment.addElement("age");
            Element idElment = newElment.addElement("id");
            nameElment.setText(stu.getName());
            ageElment.setText(stu.getAge().toString());
            idElment.setText(stu.getId().toString());

            // 格式化为缩进格式
            OutputFormat format = OutputFormat.createPrettyPrint();
            // 设置编码格式
            format.setEncoding("UTF-8");
            try
            {
                XMLWriter writer = new XMLWriter(new FileWriter(file), format);
                // 写入数据
                writer.write(doc);
                writer.close();
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }

        }
        catch (DocumentException e)
        {
            e.printStackTrace();
        }

    }

    public boolean deleteStudentById(Integer id)
    {

        File file = new File(filepath);
        boolean persistenceFlag = false;

        SAXReader reader = new SAXReader();
        try
        {
            Document doc = reader.read(file);
            // 获取根目录
            Element rootElement = doc.getRootElement();

            List<Node> nodes = doc.selectNodes("/studentlist/student");
            for (Node item : nodes)
            {
                if (item.selectSingleNode("id").getText().equals(id.toString()))
                {
                    rootElement.remove(item);
                    persistenceFlag = true;
                    System.out.println("持久层已删除  id=" + id + "  的数据");
                }
            }

            if (persistenceFlag == false)
            {
                System.out.println("持久层删除失败，不存在 id=" + id + " 的数据");
            }

            // // 获取指定节点
            // Element node = (Element) doc.selectSingleNode("/studentlist/student/id[@protocol='20180767']");
            // // 获取属性
            // Attribute attribute = node.attribute("age");
            // // 设置属性值
            // attribute.setValue("6666");

            // 格式化为缩进格式
            OutputFormat format = OutputFormat.createPrettyPrint();
            // 设置编码格式
            format.setEncoding("UTF-8");
            try
            {
                XMLWriter writer = new XMLWriter(new FileWriter(file), format);
                // 写入数据
                writer.write(doc);
                writer.close();
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }

        }
        catch (DocumentException e)
        {
            e.printStackTrace();
        }
        return persistenceFlag;

    }

    public boolean updataStudentById(Integer id, String name, String age)
    {
        File file = new File(filepath);
        boolean persistenceFlag = false;

        SAXReader reader = new SAXReader();
        try
        {
            Document doc = reader.read(file);
            // 获取根目录
            Element rootElement = doc.getRootElement();

            List<Node> nodes = doc.selectNodes("/studentlist/student");
            for (Node item : nodes)
            {
                if (item.selectSingleNode("id").getText().equals(id.toString()))
                {
                    item.selectSingleNode("name").setText(name);
                    item.selectSingleNode("age").setText(age);
                    System.out.println("持久层已修改  id=" + id + "  的数据");
                    persistenceFlag = true;
                }
            }

            if (persistenceFlag == false)
            {
                System.out.println("持久化失败，不存在对应id-----");
            }

            // // 获取指定节点
            // Element node = (Element) doc.selectSingleNode("/studentlist/student/id[@protocol='20180767']");
            // // 获取属性
            // Attribute attribute = node.attribute("age");
            // // 设置属性值
            // attribute.setValue("6666");

            // 格式化为缩进格式
            OutputFormat format = OutputFormat.createPrettyPrint();
            // 设置编码格式
            format.setEncoding("UTF-8");
            try
            {
                XMLWriter writer = new XMLWriter(new FileWriter(file), format);
                // 写入数据
                writer.write(doc);
                writer.close();
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }

        }
        catch (DocumentException e)
        {
            e.printStackTrace();
        }

        return persistenceFlag;

    }

}
