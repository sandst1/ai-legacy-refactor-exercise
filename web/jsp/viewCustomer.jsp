<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
  <head>
    <title>View Customer</title>
    <style>
      .customer-details {
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
    <h1>Customer Details</h1>

    <div class="customer-details">
      <p><span class="label">Customer ID:</span> ${customer.customerId}</p>
      <p><span class="label">Name:</span> ${customer.name}</p>
      <p><span class="label">Address:</span> ${customer.address}</p>
      <p><span class="label">Phone Number:</span> ${customer.phoneNumber}</p>
    </div>

    <p>
      <a href="editCustomer.do?id=${customer.customerId}">Edit</a>
      <a href="customerAction.do">Back to List</a>
    </p>
  </body>
</html>
