/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.bean.BookBean;
import com.mvc.dao.BookDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "BookServlet", urlPatterns = {"/BookServlet"})
public class BookServlet extends HttpServlet {

public BookServlet() {
	 }

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Copying all the input parameters in to local variables
		 String name = request.getParameter("name");
                 String address = request.getParameter("address");
                 String destination = request.getParameter("destination");
                 String home = request.getParameter("home");
		 String way = request.getParameter("way");
		 String street = request.getParameter("street");
                 String date = request.getParameter("date");
                 String time = request.getParameter("time");
		 
		 BookBean bookBean = new BookBean();
		//Using Java Beans - An easiest way to play with group of related data
		 bookBean.setname(name);
                 bookBean.setaddress(address);
                 bookBean.setdestination(destination);
                 bookBean.sethome(home);
		 bookBean.setway(way);
		 bookBean.setstreet(street); 
                 bookBean.setdate(date);
                 bookBean.settime(time);
		 
		 BookDao bookDao = new BookDao();
		 
		//The core Logic of the Registration application is present here. We are going to insert user data in to the database.
		 String userbooked = BookDao.bookUser(bookBean);
		 
		 if(userbooked.equals("SUCCESS"))   //On success, you can display a message to user on Home page
		 {
			request.getRequestDispatcher("/customerhome.jsp").forward(request, response);
		 }
		 else   //On Failure, display a meaningful message to the User.
		 {
			request.setAttribute("errMessage", userbooked);
			request.getRequestDispatcher("/Book.jsp").forward(request, response);
		 }
	 }
}