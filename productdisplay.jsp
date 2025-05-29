<%@ page import="java.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page import="com.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>All Products</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #333;
            padding: 8px 12px;
            text-align: center;
        }
        th {
            background-color: #ddd;
        }
        h2 {
            text-align: center;
        }
        .center {
            text-align: center;
        }
        a, .print-button {
            display: block;
            text-align: center;
            margin: 20px auto;
            text-decoration: none;
            font-weight: bold;
        }
        .print-button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        @media print {
            .print-button, a {
                display: none !important;
            }
        }
    </style>
</head>
<body>
    <h2>Product List</h2>

    <%
        List<Product> products = new ArrayList<>();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/productdb", "root", "");

            String sql = "SELECT ProductID, ProductName, Category, Price, Quantity FROM Products";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setCategory(rs.getString("Category"));
                p.setPrice(rs.getDouble("Price"));
                p.setQuantity(rs.getInt("Quantity"));
                products.add(p);
            }
        } catch (Exception e) {
            out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
        } finally {
            try { if (rs != null) rs.close(); } catch(Exception e) {}
            try { if (ps != null) ps.close(); } catch(Exception e) {}
            try { if (conn != null) conn.close(); } catch(Exception e) {}
        }

        if (products.isEmpty()) {
    %>
        <p class="center">No products found in the database.</p>
    <%
        } else {
    %>
        <table>
            <tr>
                <th>Product ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Quantity</th>
            </tr>
            <%
                for (Product p : products) {
            %>
            <tr>
                <td><%= p.getProductID() %></td>
                <td><%= p.getProductName() %></td>
                <td><%= p.getCategory() %></td>
                <td><%= p.getPrice() %></td>
                <td><%= p.getQuantity() %></td>
            </tr>
            <%
                }
            %>
        </table>
    <%
        }
    %>

    <div class="center">
        <button class="print-button" onclick="window.print()">Print Product List</button>
    </div>

    <a href="index.jsp">Back to Home</a>
</body>
</html>
