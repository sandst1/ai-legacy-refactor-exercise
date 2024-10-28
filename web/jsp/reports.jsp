<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
  <head>
    <title>Financial Reports</title>
    <style>
      .report-container {
        margin: 20px;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 4px;
      }
      .report-section {
        margin-bottom: 30px;
      }
      table {
        border-collapse: collapse;
        width: 100%;
        margin-top: 10px;
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
      .summary {
        font-weight: bold;
        margin-top: 10px;
        padding: 10px;
        background-color: #f8f9fa;
      }
    </style>
  </head>
  <body>
    <h1>Financial Reports</h1>

    <div class="report-container">
      <div class="report-section">
        <h2>Customer Account Activity Report</h2>

        <table>
          <tr>
            <th>Customer Name</th>
            <th>Total Accounts</th>
            <th>Total Balance</th>
            <th>Transaction Count</th>
            <th>Largest Transaction</th>
            <th>Activity Score</th>
            <th>Risk Level</th>
          </tr>
          <c:forEach items="${customerReports}" var="report">
            <tr>
              <td>${report.customerName}</td>
              <td>${report.totalAccounts}</td>
              <td>
                <fmt:formatNumber
                  value="${report.totalBalance}"
                  type="currency"
                />
              </td>
              <td>${report.transactionCount}</td>
              <td>
                <fmt:formatNumber
                  value="${report.largestTransaction}"
                  type="currency"
                />
              </td>
              <td>
                <fmt:formatNumber
                  value="${report.activityScore}"
                  type="number"
                  maxFractionDigits="2"
                />
              </td>
              <td>${report.riskLevel}</td>
            </tr>
          </c:forEach>
        </table>

        <div class="summary">
          <p>Total Customers Analyzed: ${reportSummary.totalCustomers}</p>
          <p>
            Average Activity Score:
            <fmt:formatNumber
              value="${reportSummary.averageActivityScore}"
              type="number"
              maxFractionDigits="2"
            />
          </p>
          <p>
            Total Transaction Volume:
            <fmt:formatNumber
              value="${reportSummary.totalTransactionVolume}"
              type="currency"
            />
          </p>
        </div>
      </div>
    </div>

    <p>
      <a href="${pageContext.request.contextPath}/index.do">Back to Home</a>
    </p>
  </body>
</html>
