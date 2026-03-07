package controller;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class LoginServletTest {

    @Test
    void testValidCredentials() {
        LoginServlet servlet = new LoginServlet();
        String result = servlet.processLogin("admin", "123");
        assertEquals("Login Successful", result);
    }

    @Test
    void testInvalidCredentials() {
        LoginServlet servlet = new LoginServlet();
        String result = servlet.processLogin("admin", "wrongpass");
        assertEquals("Invalid Credentials", result);
    }

    @Test
    void testEmptyUsername() {
        LoginServlet servlet = new LoginServlet();
        String result = servlet.processLogin("", "admin123");
        assertEquals("Please fill all required fields.", result);
    }

    @Test
    void testEmptyPassword() {
        LoginServlet servlet = new LoginServlet();
        String result = servlet.processLogin("admin", "");
        assertEquals("Please fill all required fields.", result);
    }

    @Test
    void testNullCredentials() {
        LoginServlet servlet = new LoginServlet();
        String result = servlet.processLogin(null, null);
        assertEquals("Please fill all required fields.", result);
    }
}
