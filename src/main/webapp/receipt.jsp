<%-- 
    Document   : receipt
    Created on : 03-05-2017, 22:28:17
    Author     : felesiah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSSz.css">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Carport Receipt.</h2>
<%
try {
/* Create string of connection url within specified format with machine
name, port number and database name. Here machine name id localhost and 
database name is carport. */
String connectionURL = "jdbc:mysql://localhost:3306/carport?useSSL=false";
// declare a connection by using Connection interface
Connection connection = null;
/* declare object of Statement interface that is used for executing sql 
statements. */
Statement statement = null;
// declare a resultset that uses as a table for output data from tha table.
ResultSet rs = null;
// Load JBBC driver "com.mysql.jdbc.Driver"
Class.forName("com.mysql.jdbc.Driver").newInstance();
/* Create a connection by using getConnection() method that takes parameters 
of string type connection url, user name and password to connect to database.*/
connection = DriverManager.getConnection(connectionURL, "root", "indeche2013");
/* createStatement() is used for create statement object that is used for 
sending sql statements to the specified database. */
statement = connection.createStatement();
// sql query to retrieve values from the secified table.
String QueryString = "SELECT * from order;";
rs = statement.executeQuery(QueryString);
%>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<%
    while (rs.next()) {
%>
<TR>
<TD><%=rs.getInt(1)%></TD>
<br>
<TD><%=rs.getString(2)%></TD>
<br>
<TD><%=rs.getString(3)%></TD>
<br>
<TD><%=rs.getString(4)%></TD>
<br>
</TR>
<% } %>
<%
// close all the connections.
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
%>
<font size="+3" color="red"></b>
<%
out.println("Unable to connect to database.");
}
%>
<font size="+2" color="Black"></b>
</TABLE><TABLE>
    <TR>
        <td>Get your receipt! </td> 
    <br>
    <button type="submit">PRINT</button></TD>
    </TR>
<TR>
<TD><FORM ACTION="database_query.jsp" method="get" >
<button type="submit">BACK</button></TD>
</TR>
</TABLE>