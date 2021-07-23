<%-- 
    Document   : verify
    Created on : Jun 5, 2021, 10:32:41 AM
    Author     : ACER
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <form action="verifying" method="POST">
            <input type="text" name="email" hidden="true" value="${requestScope.email}">
            Please enter verify code: <input type="text" name="code">
            <input type="text" name="actualcode" hidden="true" value="${requestScope.code}">
            <br>
            <input type="submit" value="submit">
        </form>
            
    </body>
</html>
