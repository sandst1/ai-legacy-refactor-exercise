<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://struts.apache.org/tags-html" prefix="html" %>

<html>
  <head>
    <title>Edit Customer</title>
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
    <h1>Edit Customer</h1>

    <html:form action="/editCustomer">
      <html:hidden property="customerId" />

      <div class="form-group">
        <label>Name:</label>
        <html:text property="name" />
      </div>

      <div class="form-group">
        <label>Address:</label>
        <html:text property="address" />
      </div>

      <div class="form-group">
        <label>Phone:</label>
        <html:text property="phoneNumber" />
      </div>

      <div class="form-group">
        <html:submit value="Save" />
        <html:cancel value="Cancel" />
      </div>
    </html:form>
  </body>
</html>
