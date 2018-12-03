package com.th.sk;

public enum Color
{
    RED("red", 1), GREEN("green", 2), YELLOW("yellow", 3), DARK("dark", 4);

    private String name;
    private int index;

    private Color(String name, int index)
    {
        this.name = name;
        this.index = index;
    }

    public static String getName(int index)
    {
        for (Color c : Color.values())
        {
            if (c.getIndex() == index)
            {
                return c.name;
            }
        }
        return null;
    }

    public int getIndex()
    {
        return index;
    }

    public String getName()
    {
        return name;
    }

    public void setIndex(int index)
    {
        this.index = index;
    }

    public void setName(String name)
    {
        this.name = name;
    }

}
