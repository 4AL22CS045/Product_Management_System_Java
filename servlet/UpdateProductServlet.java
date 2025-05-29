package com.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import com.dao.ProductDAO;
import com.model.Product;

@WebServlet("/UpdateProductServlet")  // Add servlet annotation to avoid web.xml config
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // Remove serialization warning

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            // Get and validate parameters
            String idStr = req.getParameter("productID");
            String name = req.getParameter("productName");
            String category = req.getParameter("category");
            String priceStr = req.getParameter("price");
            String quantityStr = req.getParameter("quantity");

            if (idStr == null || name == null || category == null || priceStr == null || quantityStr == null ||
                idStr.trim().isEmpty() || name.trim().isEmpty() || category.trim().isEmpty() ||
                priceStr.trim().isEmpty() || quantityStr.trim().isEmpty()) {
                
                req.setAttribute("errorMessage", "All fields are required.");
                req.getRequestDispatcher("productupdate.jsp").forward(req, res);
                return;
            }

            int id = Integer.parseInt(idStr.trim());
            double price = Double.parseDouble(priceStr.trim());
            int quantity = Integer.parseInt(quantityStr.trim());

            Product p = new Product(id, name.trim(), category.trim(), price, quantity);
            boolean updated = ProductDAO.updateProduct(p);

            if (updated) {
                // Redirect to refresh product list after successful update
                res.sendRedirect("DisplayProductsServlet");
            } else {
                req.setAttribute("errorMessage", "Product not found or update failed.");
                req.getRequestDispatcher("productupdate.jsp").forward(req, res);
            }

        } catch (NumberFormatException e) {
            req.setAttribute("errorMessage", "Invalid input format. ID, Price, and Quantity must be valid numbers.");
            req.getRequestDispatcher("productupdate.jsp").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "An error occurred while updating the product.");
            req.getRequestDispatcher("productupdate.jsp").forward(req, res);
        }
    }
}
