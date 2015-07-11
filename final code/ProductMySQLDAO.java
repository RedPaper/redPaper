package com.cuizhiquan.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.cuizhiquan.shopping.Product;
import com.cuizhiquan.shopping.util.DB;

public class ProductMySQLDAO implements ProductDAO 
{
	public List<Product> getProducts()
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from product";
		List<Product> list = new ArrayList<Product>();
		
		try
		{
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			rs = DB.getRS(stmt, sql);
			while(rs.next())
			{
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryid(rs.getInt("categoryid"));
				list.add(p);
			}
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}finally
		{
			DB.closeRS(rs);
			DB.closeStmt(stmt);
			DB.closeConn(conn);
		}
		return list;
	}
	
	public List<Product> getProducts(int pageNo,int pageSize)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from product limit " + (pageNo-1) * pageSize + "," + pageSize;
		List<Product> list = new ArrayList<Product>();
		
		try
		{
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			rs = DB.getRS(stmt, sql);
			while(rs.next())
			{
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryid(rs.getInt("categoryid"));
				list.add(p);
			}
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}finally
		{
			DB.closeRS(rs);
			DB.closeStmt(stmt);
			DB.closeConn(conn);
		}
		return list;
	}

	public int getProducts(List<Product> products, int pageNo, int pageSize) 
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		int pageCount = 0;
		String sql = "select * from product limit " + (pageNo-1) * pageSize + "," + pageSize;
		try
		{
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			rsCount = DB.getRS(stmt, "select count(*) from product");
			rsCount.next();
			pageCount = (rsCount.getInt(1) + pageSize - 1)/pageSize;
			
			rs = DB.getRS(stmt, sql);
			while(rs.next())
			{
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryid(rs.getInt("categoryid"));
				products.add(p);
			}
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}finally
		{
			DB.closeRS(rsCount);
			DB.closeRS(rs);
			DB.closeStmt(stmt);
			DB.closeConn(conn);
		}
		return pageCount;
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
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Product> products = new ArrayList<Product>();
		try
		{
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			String sql = "select * from product where 1=1";
			String strId = "";
			if(categoryId != null && categoryId.length > 0)
			{
				strId += "(";
				for(int i=0;i<categoryId.length;i++)
				{
					if(i<categoryId.length-1)
					{
						strId += categoryId[i] + ",";
					}
					else
					{
						strId += categoryId[i];
					}
				}
				strId += ")";
				sql += " and categoryid in " + strId;
			}
			System.out.println(keyWord);
			if(keyWord != null && !keyWord.trim().equals(""))
			{
				sql += " and name like '%" + keyWord + "%' or descr like '%" + keyWord + "%'";
			}
			
			if(lowNormalPrice >= 0)
			{
				sql += " and normalprice > " + lowNormalPrice;
			}
			
			if(highNormalPrice > 0)
			{
				sql += " and normalprice < " + highNormalPrice;
			}
			
			if(lowMemberPrice >= 0)
			{
				sql += " and memnberprice < " + lowMemberPrice;
			}
			
			if(highMemberPrice > 0)
			{
				sql += " and memnberprice < " + highMemberPrice;
			}
			
			if(startDate != null)
			{
				sql += " and pdate >= '" + new SimpleDateFormat("yyyy-MM-dd").format(startDate) + "'";
			}
			
			if(startDate != null)
			{
				sql += " and pdate >= '" + new SimpleDateFormat("yyyy-MM-dd").format(startDate) + "'";
			}
			
			sql += " limit " + (pageNo-1) * pageSize + "," + pageSize;
		System.out.println(sql);
			rs = DB.getRS(stmt, sql);
			while(rs.next())
			{
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryid(rs.getInt("categoryid"));
				products.add(p);
			}
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}finally
		{
			DB.closeRS(rs);
			DB.closeStmt(stmt);
			DB.closeConn(conn);
		}
		return products;
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
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try
		{
			conn = DB.getConn();
			String sql = "insert into product values (null,?,?,?,?,?,?)";
			pstmt = DB.getPStmt(conn, sql);
			pstmt.setString(1,p.getName());
			pstmt.setString(2, p.getDescr());
			pstmt.setDouble(3, p.getNormalprice());
			pstmt.setDouble(4, p.getMemberprice());
			pstmt.setTimestamp(5, p.getPdate());
			pstmt.setInt(6, p.getCategoryid());
			
			pstmt.executeUpdate();
		} catch (SQLException e) 
		{
			e.printStackTrace();
			return false;
		}finally
		{
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
		return true;
	}
}
