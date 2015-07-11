package com.cuizhiquan.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.cuizhiquan.shopping.util.DB;

public class CategoryDAO 
{
	public static void save(Category c)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try 
		{
			conn = DB.getConn();
			String sql = null;
			if(c.getId()==-1)
			{
				sql = "insert into category values(null,?,?,?,?,?)";
			}
			else
			{
				sql = "insert into category values(" + c.getId() + ",?,?,?,?,?)";
			}
			pstmt = DB.getPStmt(conn, sql);
			pstmt.setString(1,c.getName());
			pstmt.setString(2, c.getDescr());
			pstmt.setInt(3, c.getPid());
			pstmt.setInt(4, c.isIsleaf() == true ? 0 : 1);
			pstmt.setInt(5, c.getGrade());
			pstmt.executeUpdate();
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}finally
		{
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
	}
	
	public static void getCategories(List<Category> list,int id)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from category where pid = " + id;
		
		try 
		{
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			rs = DB.getRS(stmt, sql);
			
			while(rs.next())
			{
				Category c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setPid(rs.getInt("pid"));
				c.setIsleaf(rs.getInt("isleaf") == 0 ? true : false);
				c.setGrade(rs.getInt("grade"));
				list.add(c);
				if(!c.isleaf)
				{
					getCategories(list,c.getId());
				}
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
	}

	public static void addChildCategory(int pid,String name,String descr) 
	{
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			
			conn.setAutoCommit(false);
			String sqlRS = "select * from category where id = " + pid;
			rs = DB.getRS(stmt, sqlRS);
			int parentGrade = 0;
			if(rs.next())
			{
				parentGrade = rs.getInt("grade");
			}
			String sql = "insert into category values(null,?,?,?,?,?)";
			pstmt = DB.getPStmt(conn, sql);
			pstmt.setString(1,name);
			pstmt.setString(2, descr);
			pstmt.setInt(3, pid);
			pstmt.setInt(4,0);
			pstmt.setInt(5,parentGrade + 1);
			pstmt.executeUpdate();
			
			stmt.executeUpdate("update category set isleaf = 1 where id = " + pid);
			
			conn.commit();
			conn.setAutoCommit(true);
		} catch (SQLException e) 
		{
			try 
			{
				conn.rollback();
			} catch (SQLException e1) 
			{
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally
		{
			DB.closeRS(rs);
			DB.closeStmt(stmt);
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
	}
}
