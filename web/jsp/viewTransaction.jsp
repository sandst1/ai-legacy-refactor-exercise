<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
  <head>
    <title>View Transaction</title>
    <style>
      .transaction-details {
        margin: 20px;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 4px;
      }
      .label {
        font-weight: bold;
        margin-right: 10px;
      }
    </style>
  </head>
  <body>
    <h1>Transaction Details</h1>

    <div class="transaction-details">
      <p>
        <span class="label">Transaction ID:</span> ${transaction.transactionId}
      </p>
      <p><span class="label">Account ID:</span> ${transaction.accountId}</p>
      <p>
        <span class="label">Date:</span>
        <fmt:formatDate
          value="${transaction.date}"
          pattern="yyyy-MM-dd HH:mm:ss"
        />
      </p>
      <p>
        <span class="label">Amount:</span>
        <fmt:formatNumber value="${transaction.amount}" type="currency" />
      </p>
      <p><span class="label">Type:</span> ${transaction.type}</p>
    </div>

    <p>
      <a href="editTransaction.do?id=${transaction.transactionId}">Edit</a>
      <a href="transactionAction.do">Back to List</a>
    </p>
  </body>
</html>
