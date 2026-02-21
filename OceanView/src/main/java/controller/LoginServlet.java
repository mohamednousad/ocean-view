package controller;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
	public class LoginServlet extends HttpServlet {
	    private UserDAO userDAO = new UserDAO();
	
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	
	        try {
	            if (userDAO.validate(username, password)) {
	                request.getSession().setAttribute("username", username);
	                response.sendRedirect("Dashboard.jsp");
	            } else {
	                request.setAttribute("error", "Invalid Credentials");
	                request.getRequestDispatcher("index.jsp").forward(request, response);
	            }
	        } catch (Exception e) {
	            e.printStackTrace(); 
	            request.setAttribute("error", "Something went wrong. Please try again later.");
	            request.getRequestDispatcher("index.jsp").forward(request, response);
	        }
	    }
	}