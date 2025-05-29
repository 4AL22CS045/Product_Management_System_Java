<%@ page language="java" import="java.sql.*, java.util.ArrayList, java.util.List, com.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Report Results</title>
    <link rel="stylesheet" href="css/styles.css" />
    <style>
        /* Your existing styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 30px 20px;
        }
        h2 {
            text-align: center;
            color: #444;
            font-weight: 700;
            letter-spacing: 1px;
            margin-bottom: 30px;
        }
        p {
            text-align: center;
            font-size: 1.1em;
            color: #666;
            margin-top: 40px;
        }
        table {
            width: 90%;
            max-width: 900px;
            margin: 0 auto 40px auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 12px 18px;
            text-align: center;
            border-bottom: 1px solid #eee;
            font-size: 1em;
        }
        th {
            background-color: #007BFF;
            color: white;
            font-weight: 600;
            letter-spacing: 0.05em;
            text-transform: uppercase;
        }
        tr:hover {
            background-color: #f1faff;
        }
        a {
            display: inline-block;
            margin: 10px 15px;
            text-decoration: none;
            color: #007BFF;
            font-weight: 600;
            transition: color 0.3s ease;
        }
        a:hover {
            color: #0056b3;
        }
        @media (max-width: 600px) {
            table, th, td {
                font-size: 0.9em;
            }
        }
    </style>
</head>
<body>
    <h2>Report Results</h2>

    <%
        List<Product> products = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/productdb", "root", "");

            // Example SQL query, adjust WHERE conditions as needed for your report
            String sql = "SELECT ProductID, ProductName, Category, Price, Quantity FROM Products ORDER BY ProductID";
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
    %>
        <p style="color:red; text-align:center;">Error retrieving data: <%= e.getMessage() %></p>
    <%
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception e) {}
            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(conn != null) conn.close(); } catch(Exception e) {}
        }

        if (products.isEmpty()) {
    %>
        <p>No products found for the selected criteria.</p>
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

    <div style="text-align:center;">
        <a href="report_form.jsp">Back to Report Form</a> |
        <a href="index.jsp">Back to Home</a>
    </div>
</body>
</html>
