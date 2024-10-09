<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.expensetracker.service.GetAllDataService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.expensetracker.bean.Bean" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Investment Tracker</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1556801643-4a702a619b53?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&q=80&w=1080');
            background-size: cover;
            background-repeat: no-repeat;
            font-family: 'Arial', sans-serif;
        }
        h2 {
            text-align: center;
            margin: 20px 0;
            color: #333;
            text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.8);
        }
        .table-container {
            margin: 20px auto;
            width: 80%;
            border-radius: 15px;
            overflow: hidden;
            background-color: rgba(255, 255, 255, 0.8);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
        }
        .table {
            border-radius: 15px;
            overflow: hidden;
        }
        .table th {
            background-color: #007bff;
            color: white;
            text-align: center;
        }
        .table tr {
            transition: transform 0.2s;
        }
        .table tr:hover {
            transform: scale(1.02);
            background-color: #e2e6ea;
        }
        .table td {
            text-align: center;
            vertical-align: middle;
            color: #555;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f8f9fa;
        }
        .table-striped tbody tr:nth-of-type(even) {
            background-color: #e9ecef;
        }
        .table-striped tbody tr:hover {
            background-color: #d1ecf1;
            color: #0c5460;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Investment Tracker</h2>
        
        <!-- Home button at the top -->
        <div class="text-center mb-3">
            <a href="index.jsp" class="btn btn-secondary">Home</a>
        </div>
        
        <% 
            GetAllDataService ob = new GetAllDataService();
            ArrayList<Bean> al = ob.showdata(); 
        %>
        
        <div class="table-container">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Sl No</th>
                        <th scope="col">Investment Type</th>
                        <th scope="col">Category</th>
                        <th scope="col">Amount</th>
                        <th scope="col">Time</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Bean b : al) { %>
                    <tr>
                        <td><%= b.getSlno() %></td>
                        <td><%= b.getInvestmentType() %></td>
                        <td><%= b.getCategory() %></td>
                        <td><%= b.getAmount() %></td>
                        <td><%= b.getTime() %></td>
                        <td>
                            <!-- Form to send data to updateInvestment.jsp -->
                            <form action="updateInvestment.jsp" method="post" class="d-inline">
                                <input type="hidden" name="slno" value="<%= b.getSlno() %>">
                                <input type="hidden" name="investmentType" value="<%= b.getInvestmentType() %>">
                                <input type="hidden" name="category" value="<%= b.getCategory() %>">
                                <input type="hidden" name="amount" value="<%= b.getAmount() %>">
                                <input type="hidden" name="time" value="<%= b.getTime() %>">
                                <button type="submit" class="btn btn-primary btn-sm">Update</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
