<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Product Management System</title>
    <style>
        /* Soft background with light gray-blue gradient */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
			color: #1e1e1e;
            margin: 0;
            padding: 40px 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background: #fff;
            padding: 40px 35px;
            border-radius: 16px;
            box-shadow: 0 20px 40px rgba(97, 218, 251, 0.25);
            width: 100%;
            max-width: 480px;
            text-align: center;
        }

        h2 {
            font-weight: 700;
            font-size: 2.4rem;
            margin-bottom: 18px;
            color: #20232a;
        }

        p {
            font-size: 1.1rem;
            color: #55595c;
            margin-bottom: 30px;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        ul li {
            margin-bottom: 18px;
        }

        ul li a {
            display: inline-block;
            width: 100%;
            max-width: 280px;
            padding: 14px 0;
            font-weight: 600;
            font-size: 1.1rem;
            text-decoration: none;
            color: #61dafb;
            border: 2px solid #61dafb;
            border-radius: 12px;
            transition: all 0.3s ease;
            box-shadow: 0 6px 12px rgba(97, 218, 251, 0.2);
            cursor: pointer;
            user-select: none;
        }

        ul li a:hover,
        ul li a:focus {
            background-color: #61dafb;
            color: #ffffff;
            box-shadow: 0 10px 20px rgba(97, 218, 251, 0.4);
            transform: translateY(-3px);
            outline: none;
        }

        @media (max-width: 500px) {
            .container {
                padding: 30px 20px;
            }
            ul li a {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Product Management System</h2>
        <p>CHOOSE YOUR CHOICE:</p>
        <ul>
            <li><a href="productadd.jsp">Add Product</a></li>
            <li><a href="productupdate.jsp">Update Product</a></li>
            <li><a href="productdelete.jsp">Delete Product</a></li>
            <li><a href="productdisplay.jsp">View All Products</a></li>
            <li><a href="report_form.jsp">Generate Reports</a></li>
        </ul>
    </div>
</body>
</html>

/* Gajendra New Execution */
