package com.cuizhiquan.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.cuizhiquan.shopping.util.DB;

public class User 
{
	private int id;
	private String username;
	private String password;
	private String phone;
	private String addr;
	private Date rDate;
	
	public int getId() 
	{
		return id;
	}
	
	public void setId(int id)
	{
		this.id = id;
	}
	
	public String getUsername()
	{
		return username;
	}
	
	public void setUsername(String username)
	{
		this.username = username;
	}
	
	public String getPassword()
	{
		return password;
	}
	
	public void setPassword(String password) 
	{
		this.password = password;
	}
	
	public String getPhone() 
	{
		return phone;
	}
	
	public void setPhone(String phone)
	{
		this.phone = phone;
	}
	
	public String getAddr() 
	{
		return addr;
	}
	
	public void setAddr(String addr)
	{
		this.addr = addr;
	}
	
	public Date getrDate()
	{
		return rDate;
	}
	
	public void setrDate(Date rDate) 
	{
		this.rDate = rDate;
	}
	
	public void save()
	{
		Connection conn = DB.getConn(); 
		String sql = "insert into user values(null,?,?,?,?,?)";
		PreparedStatement pstmt = DB.getPStmt(conn, sql);
		try 
		{
			pstmt.setString(1,username);
			pstmt.setString(2,password);
			pstmt.setString(3,phone);
			pstmt.setString(4,addr);
			pstmt.setTimestamp(5,new Timestamp(rDate.getTime()));
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
	
	public void update()
	{
		Connection conn = DB.getConn(); 
		String sql = "update user set username = ?,phone = ?,addr = ? where id = " + this.id;
		PreparedStatement pstmt = DB.getPStmt(conn, sql);
		try 
		{
			pstmt.setString(1,username);
			pstmt.setString(2,phone);
			pstmt.setString(3,addr);
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
	
	public static List<User> getUsers()
	{
		List<User> list = new ArrayList<User>();
		Connection conn =null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from user";
		
		try 
		{
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			rs = DB.getRS(stmt, sql);
			while(rs.next())
			{
				User u = new User();
				u.setId(rs.getInt("Id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setrDate(rs.getTimestamp("rdate"));
				list.add(u);
			}
		}catch (SQLException e) 
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

	public static void delete(int id)
	{
		Connection conn = null;
		Statement stmt = null;
		String sql = "delete from user where id = " + id;
		try 
		{
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			stmt.executeUpdate(sql);
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}finally
		{
			DB.closeStmt(stmt);
			DB.closeConn(conn);
		}
	}
	
	public static boolean userExists(String username)
	{
		return false;
	}
	
	public static boolean isPasswordCorrect(String username,String password)
	{
		
		return false;
	}
	
	public static User validate(String username,String passeword) throws PasswordNotCorrectException, UserNotFoundException
	{
		User u = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from user where username = '" + username + "'";
		
		try 
		{
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			rs = DB.getRS(stmt, sql);
			if(!rs.next())
			{
				throw new UserNotFoundException();
			}
			else if(!rs.getString("password").equals(passeword))
				{
					throw new PasswordNotCorrectException();
				}
				else
				{
					 u = new User();
					 u.setId(rs.getInt("id"));
					 u.setUsername(rs.getString("username"));
					 u.setPassword(rs.getString("password"));
					 u.setPhone(rs.getString("phone"));
					 u.setAddr(rs.getString("addr"));
					 u.setrDate(rs.getTimestamp("rdate"));
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
		return u;
	}

}
