package com.th.sk;

import java.util.HashSet;
import java.util.Set;
import java.util.StringTokenizer;

public class LearnSets
{

    public static void main(String[] args)
    {
        testHashSet();
        testToken();
        test1();
    }

    public static void testHashSet()
    {
        Set<String> lstMap = new HashSet<String>();
        lstMap.add("key1");
        lstMap.add("key2");
        lstMap.add("key3");
        lstMap.add("key1");
        System.out.println(lstMap);
    }

    public static void testToken()
    {
        StringTokenizer st = new StringTokenizer("fda fdas fa");
        while (st.hasMoreTokens())
        {
            System.out.println(st.nextToken());
        }
    }

    public static void test1()
    {
        String s1 = "abc";
        String s2 = "ab" + new String("c");

        // 比较地址
        System.out.println(s1 == s2);

        // 比较字符串
        System.out.println(s1.equals(s2));
    }

}
