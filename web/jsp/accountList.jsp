<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
  <head>
    <title>Account List</title>
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
    <h1>Account List</h1>

    <table>
      <tr>
        <th>Account ID</th>
        <th>Customer ID</th>
        <th>Account Type</th>
        <th>Balance</th>
        <th>Actions</th>
      </tr>
      <c:forEach items="${accounts}" var="account">
        <tr>
          <td>${account.accountId}</td>
          <td>${account.customerId}</td>
          <td>${account.accountType}</td>
          <td>${account.balance}</td>
          <td>
            <a href="viewAccount.do?id=${account.accountId}">View</a>
            <a href="editAccount.do?id=${account.accountId}">Edit</a>
          </td>
        </tr>
      </c:forEach>
    </table>

    <p>
      <a href="${pageContext.request.contextPath}/index.do">Back to Home</a>
    </p>
  </body>
</html>
