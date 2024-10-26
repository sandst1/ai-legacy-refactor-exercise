<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://struts.apache.org/tags-html" prefix="html" %>

<html>
  <head>
    <title>Edit Account</title>
    <style>
      .form-group {
        margin: 10px 0;
      }
      label {
        display: inline-block;
        width: 100px;
      }
    </style>
  </head>
  <body>
    <h1>Edit Account</h1>

    <html:form action="/editAccount">
      <html:hidden property="accountId" />
      <html:hidden property="customerId" />

      <div class="form-group">
        <label>Account Type:</label>
        <html:select property="accountType">
          <html:option value="Checking">Checking</html:option>
          <html:option value="Savings">Savings</html:option>
          <html:option value="Investment">Investment</html:option>
        </html:select>
      </div>

      <div class="form-group">
        <label>Balance:</label>
        <html:text property="balance" />
      </div>

      <div class="form-group">
        <html:submit value="Save" />
        <html:cancel value="Cancel" />
      </div>
    </html:form>
  </body>
</html>
