package com.cuizhiquan.shopping;

import java.util.Date;
import java.util.List;

import com.cuizhiquan.shopping.dao.ProductDAO;
import com.cuizhiquan.shopping.dao.ProductMySQLDAO;

public class ProductMgr 
{	
	private static ProductMgr pm = null;
	
	private ProductMgr(){}
	
	static
	{
		if(pm == null)
		{
			pm = new ProductMgr();
			pm.setDao(new ProductMySQLDAO());
		}
	}
	
	ProductDAO dao = null;
	
	public static ProductMgr getInstance()
	{
		return pm;
	}
	
	public ProductDAO getDao()
	{
		return dao;
	}

	public void setDao(ProductDAO dao)
	{
		this.dao = dao;
	}

	public List<Product> getProducts()
	{
		return dao.getProducts();
	}
	
	public List<Product> getProducts(int pageNo,int pageSize)
	{
		return dao.getProducts(pageNo,pageSize);
	}
	
	public int getProducts(List<Product> products,int pageNo,int pageSize)
	{
		return dao.getProducts(products,pageNo, pageSize);
	}
	public List<Product> findProducts(int[] categoryId,
									  String keyWord,
									  double lowNormalPrice,
									  double highNormalPrice,
									  double lowMemberPrice,
									  double highMemberPrice,
									  Date startDate,
									  Date endDate,
									  int pageNo,
									  int pageSize)
	{
		return dao.findProducts(categoryId, keyWord, lowNormalPrice, highNormalPrice, lowMemberPrice,
								highMemberPrice, startDate, endDate, pageNo, pageSize);
	}
	
	public boolean deleteProductByCategoryId(int categoryId)
	{
		return false;
	}
	
	public boolean deleteProductsById(int[] idArray)
	{
		return false;
	}
	
	public boolean updateProduct(Product p)
	{
		return false;
	}
	
	public boolean addProduct(Product p)
	{
		return dao.addProduct(p);
	}
}
