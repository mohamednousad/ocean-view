package controller;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    String processLogin(String username, String password) {
        if (username == null || username.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            return "Please fill all required fields.";
        }
        try {
            if (userDAO.login(username, password)) {
                return "Login Successful";
            } else {
                return "Invalid Credentials";
            }
        } catch (Exception e) {
            return "Something went wrong. Please try again later.";
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String result = processLogin(username, password);

        try {
            if (result.equals("Login Successful")) {
                request.getSession().setAttribute("username", username);
                response.sendRedirect("Dashboard.jsp");
            } else {
                request.setAttribute("error", result);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong. Please try again later.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}