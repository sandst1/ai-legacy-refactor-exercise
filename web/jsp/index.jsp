<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Legacy Financial Application</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 20px;
      }
      .menu {
        margin-bottom: 20px;
      }
      .menu a {
        padding: 10px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        margin-right: 10px;
        border-radius: 4px;
      }
    </style>
  </head>
  <body>
    <h1>Welcome to Legacy Financial Application</h1>

    <div class="menu">
      <a href="customerAction.do">View Customers</a>
      <a href="accountAction.do">View Accounts</a>
      <a href="transactionAction.do">View Transactions</a>
    </div>

    <div>
      <h2>Quick Overview</h2>
      <p>This application allows you to:</p>
      <ul>
        <li>Manage customer information</li>
        <li>View and manage accounts</li>
        <li>Track transactions</li>
      </ul>
    </div>
  </body>
</html>
