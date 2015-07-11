package com.cuizhiquan.shopping.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB 
{	
	static
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
	}
	
	public static Connection getConn()
	{
		Connection conn = null;
		try 
		{
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?user=root&password=root");
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void closeConn(Connection conn)
	{
		try 
		{
			if(conn!=null)
			{
				conn.close();
				conn = null;
			}
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	
	public static Statement getStmt(Connection conn)
	{
		Statement stmt = null;
		try 
		{
			stmt = conn.createStatement();
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return stmt;
	}
	
	public static PreparedStatement getPStmt(Connection conn,String sql)
	{
		PreparedStatement pStmt = null;
		try
		{
			pStmt = conn.prepareStatement(sql);
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return pStmt;
	}
	
	public static void closeStmt(Statement stmt)
	{
		try 
		{
			if(stmt!=null)
			{
				stmt.close();
				stmt = null;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public static ResultSet getRS(Statement stmt,String sql)
	{
		ResultSet rs = null;
		try
		{
			rs = stmt.executeQuery(sql);
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return rs;
	}
	
	public static void closeRS(ResultSet rs)
	{
		try
		{
			if(rs!=null)
			{
				rs.close();
				rs = null;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
}
