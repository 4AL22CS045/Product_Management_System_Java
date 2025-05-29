package com.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;  // Import this
import com.dao.ProductDAO;
import com.model.Product;

@WebServlet("/AddProductServlet")  // <-- Annotation to map the servlet URL
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String idStr = req.getParameter("productID");
            String name = req.getParameter("productName");
            String category = req.getParameter("category");
            String priceStr = req.getParameter("price");
            String quantityStr = req.getParameter("quantity");

            if (idStr == null || idStr.isEmpty() ||
                name == null || name.isEmpty() ||
                category == null || category.isEmpty() ||
                priceStr == null || priceStr.isEmpty() ||
                quantityStr == null || quantityStr.isEmpty()) {

                req.setAttribute("errorMessage", "All fields are required.");
                req.getRequestDispatcher("productadd.jsp").forward(req, res);
                return;
            }

            int id = Integer.parseInt(idStr);
            double price = Double.parseDouble(priceStr);
            int quantity = Integer.parseInt(quantityStr);

            Product p = new Product(id, name, category, price, quantity);

            boolean added = ProductDAO.addProduct(p);

            if (added) {
                res.sendRedirect("DisplayProductsServlet"); // Make sure DisplayProductsServlet also has @WebServlet
            } else {
                req.setAttribute("errorMessage", "Failed to add product. It might already exist.");
                req.getRequestDispatcher("productadd.jsp").forward(req, res);
            }

        } catch (NumberFormatException e) {
            req.setAttribute("errorMessage", "Invalid number format for ID, price or quantity.");
            req.getRequestDispatcher("productadd.jsp").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "An error occurred while adding product.");
            req.getRequestDispatcher("productadd.jsp").forward(req, res);
        }
    }
}
