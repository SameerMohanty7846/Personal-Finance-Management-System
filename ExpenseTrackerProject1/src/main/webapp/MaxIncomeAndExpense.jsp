<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense Tracker - Max Income & Expense</title>
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

        .main-div {
            height: auto;
            width: 80%;
            margin: 20px auto;
            display: flex;
            position: relative;
            z-index: 2;
            justify-content: space-between; 
            padding-left: 5%;
        }

        .max-expense, .max-income {
            height: 200px;
            width: 45%;
            border: 2px solid gray;
            border-radius: 10px;
            margin: 2%;
            padding: 10px;
            background: rgba(255, 255, 255, 0.3);
            color: white;
        }

        h4 {
            margin-left: 10px;
            color: white;
        }

        .max-amount {
            font-size: 2em;
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <h2>Max Income and Expense</h2>

    <div class="main-div">
        <!-- Max Income Display -->
        <div class="max-income">
            <h4>Maximum Income</h4>
            <% 
                // Fetch maximum income details
                String maxIncomeCategory = ""; // Retrieve this from your data source
                double maxIncomeAmount = 0.0; // Retrieve this from your data source
                
                // Example: Fetch max income details from your business logic or service
                // maxIncomeCategory = YourService.getMaxIncomeCategory();
                // maxIncomeAmount = YourService.getMaxIncomeAmount();
            %>
            <p class="max-amount">Category: <%= maxIncomeCategory %></p>
            <p class="max-amount">Amount: <%= maxIncomeAmount %></p>
        </div>

        <!-- Max Expense Display -->
        <div class="max-expense">
            <h4>Maximum Expense</h4>
            <% 
                // Fetch maximum expense details
                String maxExpenseCategory = ""; // Retrieve this from your data source
                double maxExpenseAmount = 0.0; // Retrieve this from your data source
                
                // Example: Fetch max expense details from your business logic or service
                // maxExpenseCategory = YourService.getMaxExpenseCategory();
                // maxExpenseAmount = YourService.getMaxExpenseAmount();
            %>
            <p class="max-amount">Category: <%= maxExpenseCategory %></p>
            <p class="max-amount">Amount: <%= maxExpenseAmount %></p>
        </div>
    </div>
</body>
</html>
