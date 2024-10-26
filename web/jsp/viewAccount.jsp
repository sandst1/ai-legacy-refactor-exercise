<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
  <head>
    <title>View Account</title>
    <style>
      .account-details {
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
    <h1>Account Details</h1>

    <div class="account-details">
      <p><span class="label">Account ID:</span> ${account.accountId}</p>
      <p><span class="label">Customer ID:</span> ${account.customerId}</p>
      <p><span class="label">Account Type:</span> ${account.accountType}</p>
      <p>
        <span class="label">Balance:</span>
        <fmt:formatNumber value="${account.balance}" type="currency" />
      </p>
    </div>

    <p>
      <a href="editAccount.do?id=${account.accountId}">Edit</a>
      <a href="accountAction.do">Back to List</a>
    </p>
  </body>
</html>
