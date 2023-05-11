<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    boolean isValid = false;
    try {
        // Connect to the database
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=mydatabase";
        String user = "username";
        String pass = "password";
        conn = DriverManager.getConnection(dbURL, user, pass);
        
        // Check if the username and password exist in the database
        stmt = conn.createStatement();
        String sql = "SELECT * FROM users WHERE username = '" + username + "' AND password = '" + password + "'";
        rs = stmt.executeQuery(sql);
        isValid = rs.next();
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        // Close the database connection
        try { rs.close(); } catch (Exception e) {}
        try { stmt.close(); } catch (Exception e) {}
        try { conn.close(); } catch (Exception e) {}
    }
    
    // If the username and password are valid, redirect to the success page
    // Otherwise, display an error message
    if (isValid) {
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid username or password");
    }
%>
