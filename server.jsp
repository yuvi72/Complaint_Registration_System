<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%

String userid = request.getParameter("userid");
String password = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "1234");
Statement st = con.createStatement();
int i = st.executeUpdate("INSERT INTO users values('" +userid+ "','" +password+ "')");
if(i == 1) {
    out.println("Success");
} else {
    out.println("Failure");
}

%>
