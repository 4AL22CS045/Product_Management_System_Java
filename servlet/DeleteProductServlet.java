package com.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;  // import annotation
import com.dao.ProductDAO;

@WebServlet("/DeleteProductServlet")  // map this servlet to the URL
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            int productID = Integer.parseInt(req.getParameter("productID"));

            boolean deleted = ProductDAO.deleteProduct(productID);

            if (deleted) {
                res.sendRedirect("DisplayProductsServlet");  // make sure DisplayProductsServlet also has @WebServlet
            } else {
                req.setAttribute("errorMessage", "Product could not be deleted. It may not exist.");
                req.getRequestDispatcher("productdisplay.jsp").forward(req, res);
            }

        } catch (NumberFormatException e) {
            req.setAttribute("errorMessage", "Invalid product ID.");
            req.getRequestDispatcher("productdisplay.jsp").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "An error occurred while deleting the product.");
            req.getRequestDispatcher("productdisplay.jsp").forward(req, res);
        }
    }
}
