<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #61dafb 0%, #e0f7fa 100%);
            color: #282c34;
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

        input, button {
            width: 100%;
            padding: 12px;
            margin-top: 12px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 1rem;
            box-sizing: border-box;
        }

        button {
            background-color: #61dafb;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #21a1c4;
        }

        .message {
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Product</h2>
        <form method="post">
            <input type="number" name="productId" placeholder="Product ID" required />
            <input type="text" name="productName" placeholder="Product Name" required />
            <input type="text" name="category" placeholder="Category" required />
            <input type="number" name="price" placeholder="Price" step="0.01" required />
            <input type="number" name="quantity" placeholder="Quantity" required />
            <button type="submit">Add Product</button>
        </form>

        <%
            String productIdStr = request.getParameter("productId");
            String productName = request.getParameter("productName");
            String category = request.getParameter("category");
            String priceStr = request.getParameter("price");
            String quantityStr = request.getParameter("quantity");

            if (productIdStr != null && productName != null && category != null && priceStr != null && quantityStr != null) {
                double price = Double.parseDouble(priceStr);
                int quantity = Integer.parseInt(quantityStr);

                if (price < 0 || quantity < 0) {
                    out.println("<p class='message' style='color:red;'>Price and Quantity must be non-negative.</p>");
                } else {
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    Statement tableStmt = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/productdb", "root", "");

                        String createTableSQL = "CREATE TABLE IF NOT EXISTS Products (" +
                                                "ProductID INT PRIMARY KEY," +
                                                "ProductName VARCHAR(100)," +
                                                "Category VARCHAR(50)," +
                                                "Price DECIMAL(10,2) CHECK (Price >= 0)," +
                                                "Quantity INT CHECK (Quantity >= 0)" +
                                                ")";
                        tableStmt = conn.createStatement();
                        tableStmt.executeUpdate(createTableSQL);

                        String insertSQL = "INSERT INTO Products (ProductID, ProductName, Category, Price, Quantity) VALUES (?, ?, ?, ?, ?)";
                        stmt = conn.prepareStatement(insertSQL);
                        stmt.setInt(1, Integer.parseInt(productIdStr));
                        stmt.setString(2, productName);
                        stmt.setString(3, category);
                        stmt.setDouble(4, price);
                        stmt.setInt(5, quantity);

                        int rows = stmt.executeUpdate();
                        if (rows > 0) {
                            out.println("<p class='message' style='color:green;'>Product added successfully!</p>");
                        } else {
                            out.println("<p class='message' style='color:red;'>Failed to add product.</p>");
                        }

                    } catch (Exception e) {
                        out.println("<p class='message' style='color:red;'>Error: " + e.getMessage() + "</p>");
                    } finally {
                        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
                        try { if (tableStmt != null) tableStmt.close(); } catch (Exception e) {}
                        try { if (conn != null) conn.close(); } catch (Exception e) {}
                    }
                }
            }

        %>
    </div>
</body>
</html>
