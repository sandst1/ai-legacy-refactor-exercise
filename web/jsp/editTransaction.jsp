<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://struts.apache.org/tags-html" prefix="html" %>

<html>
  <head>
    <title>Edit Transaction</title>
    <style>
      .form-group {
        margin: 10px 0;
      }
      label {
        display: inline-block;
        width: 100px;
      }
      .note {
        font-size: 0.8em;
        color: #666;
        margin-left: 10px;
      }
    </style>
    <script>
      window.onload = function () {
        var dateInput = document.querySelector(".date-input");
        dateInput.type = "date";

        // Format existing date if any
        if (dateInput.value) {
          var date = new Date(dateInput.value);
          dateInput.value = date.toISOString().split("T")[0];
        }
      };
    </script>
  </head>
  <body>
    <h1>Edit Transaction</h1>

    <html:form action="/editTransaction">
      <html:hidden property="transactionId" />
      <html:hidden property="accountId" />

      <div class="form-group">
        <label>Date:</label>
        <html:text property="date" styleClass="date-input" />
        <span class="note">(Format: YYYY-MM-DD)</span>
      </div>

      <div class="form-group">
        <label>Amount:</label>
        <html:text property="amount" />
      </div>

      <div class="form-group">
        <label>Type:</label>
        <html:select property="type">
          <html:option value="Deposit">Deposit</html:option>
          <html:option value="Withdrawal">Withdrawal</html:option>
          <html:option value="Transfer">Transfer</html:option>
        </html:select>
      </div>

      <div class="form-group">
        <html:submit value="Save" />
        <html:cancel value="Cancel" />
      </div>
    </html:form>
  </body>
</html>
