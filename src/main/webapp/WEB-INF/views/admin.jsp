<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Report</title>
</head>
<body>
<header>
    <h2>Registered Users Report</h2>
</header>
<table>
    <col width="100">
    <col width="100">
    <col width="100">
    <col width="100">
    <col width="100">
    <col width="10">
    <col width="50">
    <col width="10">
    <col width="80">
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Address1</th>
        <th>Address2</th>
        <th>City</th>
        <th>State</th>
        <th>Zip</th>
        <th>Country</th>
        <th>Date</th>
    </tr>

    <c:forEach items="${list}" var="userList">
        <tr>
            <td>
                    ${userList.firstName}
            </td>
            <td>
                    ${userList.lastName}
            </td>
            <td>
                    ${userList.address1}
            </td>
            <td>
                    ${userList.address2}
            </td>
            <td>
                    ${userList.city}
            </td>
            <td>
                    ${userList.state}
            </td>
            <td>
                    ${userList.zip}
            </td>
            <td>
                    ${userList.country}
            </td>
            <td>
                    ${userList.date}
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
