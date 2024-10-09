<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.expensetracker.service.GetTotalBalanceService" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense Tracker</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        body {
            background-image: url('public/images/expense tracker2.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            height: 100vh;
            margin: 0;
            position: relative;
            overflow: hidden;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        h2 {
            text-align: center;
            color: white;
            position: relative;
            z-index: 2;
        }

        .maindiv-a {
            height: 350px;
            width: 80%;
            margin: 20px auto;
            display: flex;
            position: relative;
            z-index: 2;
            justify-content: space-between; /* Space between columns */
            padding-left: 5%; /* Shifted to the left */
        }

        .expense, .income {
            height: 80%;
            width: 45%;
            border: 2px solid gray;
            border-radius: 10px;
            margin: 2%;
            padding: 10px;
            background: rgba(255, 255, 255, 0.3); /* Transparent background */
            color: white;
        }

        .total {
            height: 200px;
            width: 500px;
            border: 2px solid gray;
            border-radius: 15px;
            margin: 20px auto;
            position: relative;
            z-index: 2;
            text-align: center;
            color: white;
            background: rgba(255, 255, 255, 0.3); /* Transparent background */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            padding: 20px;
        }

        h4 {
            margin-left: 10px;
            color: white;
        }

        .total-balance {
            font-size: 2em;
        }

        .btn-add {
            display: block;
            margin: 20px auto 0;
        }

        .form-label {
            color: white;
        }

        /* Menu styling */
        .hidden-menu {
            display: none;
            position: absolute;
            top: 60px;
            left: 10px;
            width: 200px;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            padding: 10px 0;
            z-index: 3;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        .hidden-menu a {
            padding: 10px 15px;
            text-decoration: none;
            color: white;
            display: block;
            transition: background-color 0.3s, color 0.3s;
            border-radius: 5px;
        }

        .hidden-menu a:hover {
            background-color: rgba(255, 255, 255, 0.4);
            color: #000; /* Change text color on hover */
        }

        .menu-btn {
            font-size: 30px;
            color: white;
            position: absolute;
            top: 10px;
            left: 10px;
            z-index: 4;
            cursor: pointer;
        }

        /* Inline output styling */
        .form-range + output {
            display: inline;
            margin-left: 10px;
            color: white;
            font-weight: bold;
        }
    </style>

    <script>
        function toggleMenu() {
            var menu = document.getElementById("hiddenMenu");
            menu.style.display = (menu.style.display === "block") ? "none" : "block";
        }
    </script>
</head>
<body>
    <div class="overlay"></div>
    <h2>Personal Finance Management System</h2>
    
    <!-- Hidden Menu Trigger Button -->
    <div class="menu-btn" onclick="toggleMenu()">
        <i class="bi bi-list"></i>
    </div>

    <!-- Hidden Menu Bar -->
    <div id="hiddenMenu" class="hidden-menu">
        <a href="Update.jsp">Edit Categories</a>
        <a href="deleteInvestment.jsp">Remove Transaction</a>
        <a href="#">Top Sources</a>
        <a href="alldata.jsp">View All Transactions</a>
    </div>

    <div class="maindiv-a">
        <!-- Expense Form -->
        <div class="expense">
            <h4>Specify Your Expense</h4>
            <form method="post" action="AddExpenseServlet">
                <div class="mb-3">
                    <label class="form-label">Expense Type:</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="expenseType" id="food" value="Food">
                        <label class="form-check-label" for="food">Food</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="expenseType" id="cloth" value="Cloth">
                        <label class="form-check-label" for="cloth">Cloth</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="expenseType" id="travel" value="Travel">
                        <label class="form-check-label" for="travel">Travel</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="expenseType" id="expenseOthers" value="Others" checked>
                        <label class="form-check-label" for="expenseOthers">Others</label>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="expenseAmount" class="form-label">Amount:</label>
                    <input type="range" class="form-range" id="expenseRange" min="500" max="5000" step="100" name="expenseAmount" value="1500" oninput="expenseAmountOutput.value = this.value">
                    <output id="expenseAmountOutput" for="expenseRange">1500</output>
                </div>
                <button type="submit" class="btn btn-primary btn-add">Add Expense</button>
            </form>
        </div>

        <!-- Income Form -->
        <div class="income">
            <h4>Specify Your Income</h4>
            <form method="post" action="AddIncomeServlet">
                <div class="mb-3">
                    <label class="form-label">Income Type:</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="incomeType" id="trading" value="Trading">
                        <label class="form-check-label" for="trading">Trading</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="incomeType" id="freelancing" value="Freelancing">
                        <label class="form-check-label" for="freelancing">Freelancing</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="incomeType" id="business" value="Business">
                        <label class="form-check-label" for="business">Business</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="incomeType" id="incomeOthers" value="Others" checked>
                        <label class="form-check-label" for="incomeOthers">Others</label>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="incomeAmount" class="form-label">Amount:</label>
                    <input type="range" class="form-range" id="incomeRange" min="500" max="5000" step="100" name="incomeAmount" value="1500" oninput="incomeAmountOutput.value = this.value">
                    <output id="incomeAmountOutput" for="incomeRange">1500</output>
                </div>
                <button type="submit" class="btn btn-primary btn-add">Add Income</button>
            </form>
        </div>
    </div>

    <div class="total">
        <h4>Total Balance</h4>
        <% 
            GetTotalBalanceService ob = new GetTotalBalanceService();
            int amount = ob.getBal();
        %>
        <p class="total-balance" id="totalBalance"><%= amount %></p>
    </div>
</body>
</html>
