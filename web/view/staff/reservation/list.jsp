<%-- 
    Document   : list
    Created on : Jul 5, 2021, 6:54:35 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table>
            <tr>
                <td>ID</td>
                <td>Staff Name</td>
                <td>Total Cost</td>
                <td>Array</td>
            </tr>
            <c:forEach items="${requestScope.reservations}" var="r">
                <tr>
                    <td>${r.id}</td>
                    <td>${r.staff.fullName}</td>
                    <td>${r.totalCost}</td>
                    <td>
                        <c:forEach items="${r.listReservationService}" var="s">
                            ${s.service.fullname} - ${s.quantity} <br>
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
