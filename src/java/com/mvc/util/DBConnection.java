/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

 public static Connection createConnection()
 {
  Connection con = null;
  String url ="jdbc:derby://localhost:1527/alphaCab"; //MySQL URL followed by the database name
  String username = "alpha"; //MySQL username
  String password = "alpha"; //MySQL password
  
  
  try 
  {
   try 
   {
   Class.forName("org.apache.derby.jdbc.ClientDriver"); //loading MySQL drivers. This differs for database servers 
   } 
   catch (ClassNotFoundException e)
   {
   e.printStackTrace();
   }
   
   con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
   System.out.println("Printing connection object "+con);
  } 
  catch (Exception e) 
  {
  e.printStackTrace();
  }
  
  return con; 
 }
}