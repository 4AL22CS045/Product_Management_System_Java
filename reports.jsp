<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Reports Dashboard</title>
    <link rel="stylesheet" href="css/styles.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            color: #333;
            margin: 20px;
            text-align: center;
        }
        h2 {
            color: #007BFF;
            margin-bottom: 10px;
        }
        p {
            font-size: 1.1em;
            margin-bottom: 20px;
        }
        nav ul {
            list-style: none;
            padding: 0;
        }
        nav ul li {
            display: inline-block;
            margin: 0 15px;
        }
        nav ul li a {
            text-decoration: none;
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            font-weight: bold;
        }
        nav ul li a:hover {
            background-color: #0056b3;
        }
        a {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Reports Dashboard</h2>

    <p>Select a report option below:</p>

    <nav>
        <ul>
            <li><a href="report_form.jsp">Generate Custom Report</a></li>
            <!-- You can add quick links for pre-made reports here if you want -->
            <!-- Example:
            <li><a href="ReportServlet?action=topSelling">Top Selling Products</a></li>
            -->
        </ul>
    </nav>

    <br />
    <a href="index.jsp">Back to Home</a>
</body>
</html>
