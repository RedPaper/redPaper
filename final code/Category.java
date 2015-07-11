package com.cuizhiquan.shopping;

import java.util.ArrayList;
import java.util.List;

public class Category 
{
	int id;
	String name;
	String descr;
	int pid;
	boolean isleaf;
	int grade;
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

	public int getPid() 
	{
		return pid;
	}

	public void setPid(int pid) 
	{
		this.pid = pid;
	}

	public boolean isIsleaf()
	{
		return isleaf;
	}

	public void setIsleaf(boolean isleaf) {
		this.isleaf = isleaf;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public void addChild(Category c)
	{
		Category.addChildCategory(id, c.getName(), c.getDescr());
	}
	
	public static void addTopCategory(String name,String descr)
	{
		/*Category c = new Category();
		c.setName(name);
		c.setDescr(descr);
		c.setPid(0);
		c.setIsleaf(true);
		c.setGrade(0);
		CategoryDAO.save(c);*/
		addChildCategory(0,name,descr);
	}
	
	public static void addChildCategory(int pid,String name,String descr)
	{
		CategoryDAO.addChildCategory(pid,name,descr);
	}
	public static List<Category> getCategories()
	{
		List<Category> list = new ArrayList<Category>();
		CategoryDAO.getCategories(list,0);
		return list;
	}
}
