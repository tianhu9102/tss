package com.th.sk;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Set;

public class LearnIterator
{
    private List<Integer> lstData;

    private List<String> lstString;

    public List<Integer> getLstData()
    {
        return lstData;
    }

    public void setLstData(List<Integer> lstData)
    {
        this.lstData = lstData;
    }

    public List<String> getLstString()
    {
        return lstString;
    }

    public void setLstString(List<String> lstString)
    {
        this.lstString = lstString;
    }

    /**
     * remove<br>
     * 
     * @author y00318765
     * @since Appollo, 2018年11月21日
     * @param rmvElement
     * @return List<Integer>
     */
    public List<Integer> remove(Integer rmvElement)
    {
        Iterator<Integer> lst = this.lstData.iterator();

        while (lst.hasNext())
        {
            if (lst.next() == rmvElement)
            {
                lst.remove();
            }
        }
        return this.lstData;
    }

    /**
     * remove<br>
     * 
     * @author y00318765
     * @since Appollo, 2018年11月21日
     * @param rmvStr String
     * @return List<String>
     */
    public List<String> remove(String rmvStr)
    {
        ListIterator<String> lst = this.lstString.listIterator();
        while (lst.hasNext())
        {
            if (lst.next() == "rt")
            {
                lst.add("has rt");
            }
        }

        return this.lstString;
    }

    // listIterator() 仅存在List中
    // listIterator()
    public Set<Long> remove(HashSet<Long> hashData)
    {
        hashData.iterator();

        return hashData;
    }
}
