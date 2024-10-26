<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
  <head>
    <title>Transaction List</title>
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
    <h1>Transaction List</h1>

    <table>
      <tr>
        <th>Transaction ID</th>
        <th>Account ID</th>
        <th>Date</th>
        <th>Amount</th>
        <th>Type</th>
        <th>Actions</th>
      </tr>
      <c:forEach items="${transactions}" var="transaction">
        <tr>
          <td>${transaction.transactionId}</td>
          <td>${transaction.accountId}</td>
          <td>
            <fmt:formatDate
              value="${transaction.date}"
              pattern="yyyy-MM-dd HH:mm:ss"
            />
          </td>
          <td>${transaction.amount}</td>
          <td>${transaction.type}</td>
          <td>
            <a href="viewTransaction.do?id=${transaction.transactionId}"
              >View</a
            >
          </td>
        </tr>
      </c:forEach>
    </table>

    <p>
      <a href="${pageContext.request.contextPath}/index.do">Back to Home</a>
    </p>
  </body>
</html>
