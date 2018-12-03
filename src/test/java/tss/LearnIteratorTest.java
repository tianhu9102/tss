package tss;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.th.sk.LearnIterator;

public class LearnIteratorTest
{

    @Test
    public void case1()
    {
        List<Integer> lstData = new ArrayList<Integer>();
        lstData.add(52);
        lstData.add(3);
        lstData.add(5);
        lstData.add(35);
        lstData.add(49);

        LearnIterator tt = new LearnIterator();
        tt.setLstData(lstData);
        List<Integer> outData = tt.remove(35);
        System.out.println(outData.toString());

    }

    @Test
    public void case2()
    {

    }

}
