<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
  <head>
    <title>Customer List</title>
    <style>
      table {
        border-collapse: collapse;
        width: 100%;
      }
      th,
      td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
      }
      th {
        background-color: #007bff;
        color: white;
      }
    </style>
  </head>
  <body>
    <h1>Customer List</h1>

    <table>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Phone Number</th>
        <th>Actions</th>
      </tr>
      <c:forEach items="${customers}" var="customer">
        <tr>
          <td>${customer.customerId}</td>
          <td>${customer.name}</td>
          <td>${customer.address}</td>
          <td>${customer.phoneNumber}</td>
          <td>
            <a href="viewCustomer.do?id=${customer.customerId}">View</a>
            <a href="editCustomer.do?id=${customer.customerId}">Edit</a>
          </td>
        </tr>
      </c:forEach>
    </table>

    <p>
      <a href="${pageContext.request.contextPath}/index.do">Back to Home</a>
    </p>
  </body>
</html>
