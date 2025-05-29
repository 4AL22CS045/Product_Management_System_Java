package com.servlet;

import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import com.dao.ProductDAO;
import com.model.Product;

@WebServlet("/ReportServlet")  // Add this annotation to avoid web.xml config
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; 

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String type = req.getParameter("reportType");
        List<Product> list = new ArrayList<>();

        try {
            if (type == null || type.trim().isEmpty()) {
                req.setAttribute("errorMessage", "Report type is required.");
                req.getRequestDispatcher("report_form.jsp").forward(req, res);
                return;
            }

            switch (type) {
                case "price":
                    String minPrice = req.getParameter("value");
                    if (minPrice != null && !minPrice.trim().isEmpty()) {
                        double price = Double.parseDouble(minPrice.trim());
                        // FIX: Use getProductsByMinPrice (your DAO method name)
                        list = ProductDAO.getProductsByMinPrice(price);
                    } else {
                        req.setAttribute("errorMessage", "Minimum price is required.");
                    }
                    break;

                case "category":
                    String category = req.getParameter("value");
                    if (category != null && !category.trim().isEmpty()) {
                        list = ProductDAO.getProductsByCategory(category.trim());
                    } else {
                        req.setAttribute("errorMessage", "Category is required.");
                    }
                    break;

                case "topN":
                    String topN = req.getParameter("value");
                    if (topN != null && !topN.trim().isEmpty()) {
                        int n = Integer.parseInt(topN.trim());
                        list = ProductDAO.getTopNProductsByQuantity(n);
                    } else {
                        req.setAttribute("errorMessage", "Number of top products is required.");
                    }
                    break;

                default:
                    req.setAttribute("errorMessage", "Invalid report type.");
                    break;
            }
        } catch (NumberFormatException e) {
            req.setAttribute("errorMessage", "Invalid number format for criteria.");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Error occurred while generating report.");
        }

        req.setAttribute("reportProducts", list);
        RequestDispatcher rd = req.getRequestDispatcher("report_result.jsp");
        rd.forward(req, res);
    }
}
