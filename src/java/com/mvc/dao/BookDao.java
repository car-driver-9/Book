/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;
import com.mvc.bean.BookBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.mvc.util.DBConnection;



public class BookDao {

    public static String bookUser(BookBean bookBean) {
        
   
		 String name = bookBean.getname();
                 String address = bookBean.getaddress();
                 String destination = bookBean.getdestination();
		 String home = bookBean.gethome();
                 String way = bookBean.getway();
		 String street = bookBean.getstreet();
                 String date = bookBean.getdate();
                 String time = bookBean.gettime();
		 
		 Connection con = null;
		 PreparedStatement preparedStatement = null;
		 
		 try
		 {
			 con = DBConnection.createConnection();
			 String query = "insert into booking(name,address,destination,home,way,street,date,time) values (?,?,?,?,?,?,?,?)"; //Insert user details into the table 'USERS'
			 preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
			 preparedStatement.setString(1, name);
			 preparedStatement.setString(2, address);
			 preparedStatement.setString(3, destination);
                         preparedStatement.setString(4, home);
                          preparedStatement.setString(5, way);
			 preparedStatement.setString(6, street);
                         preparedStatement.setString(7, date);
                         preparedStatement.setString(8, time);
			 
			 int i= preparedStatement.executeUpdate();
			 
			 if (i!=0)  //Just to ensure data has been inserted into the database
			 return "SUCCESS"; 
		 }
		 catch(SQLException e)
		 {
			e.printStackTrace();
		 }
		 
		 return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
	 }
}