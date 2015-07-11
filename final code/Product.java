package com.cuizhiquan.shopping;

import java.sql.Timestamp;

public class Product
{
	int id;
	String name;
	String descr;
	double normalprice;
	double memberprice;
	Timestamp pdate;
	int categoryid;
	
	public int getId() 
	{
		return id;
	}
	
	public void setId(int id)
	{
		this.id = id;
	}
	
	public String getName()
	{
		return name;
	}
	
	public void setName(String name) 
	{
		this.name = name;
	}
	
	public String getDescr()
	{
		return descr;
	}
	
	public void setDescr(String descr)
	{
		this.descr = descr;
	}
	
	public double getNormalprice()
	{
		return normalprice;
	}
	
	public void setNormalprice(double normalprice) 
	{
		this.normalprice = normalprice;
	}
	
	public double getMemberprice()
	{
		return memberprice;
	}
	
	public void setMemberprice(double memberprice) 
	{
		this.memberprice = memberprice;
	}
	
	public Timestamp getPdate() 
	{
		return pdate;
	}
	
	public void setPdate(Timestamp pdate) 
	{
		this.pdate = pdate;
	}
	
	public int getCategoryid() 
	{
		return categoryid;
	}
	
	public void setCategoryid(int categoryid) 
	{
		this.categoryid = categoryid;
	}
}
