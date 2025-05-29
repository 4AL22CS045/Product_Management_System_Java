package com.servlet;

import com.dao.ProductDAO;
import com.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reportType = request.getParameter("reportType");
        List<Product> result = null;

        try {
            if ("price".equals(reportType)) {
                String minPriceStr = request.getParameter("minPrice");
                if (minPriceStr != null && !minPriceStr.trim().isEmpty()) {
                    double minPrice = Double.parseDouble(minPriceStr.trim());
                    result = ProductDAO.getProductsByMinPrice(minPrice);
                }
            } else if ("category".equals(reportType)) {
                String category = request.getParameter("category");
                if (category != null && !category.trim().isEmpty()) {
                    result = ProductDAO.getProductsByCategory(category.trim());
                }
            } else if ("topN".equals(reportType)) {
                String topNStr = request.getParameter("topN");
                if (topNStr != null && !topNStr.trim().isEmpty()) {
                    int topN = Integer.parseInt(topNStr.trim());
                    result = ProductDAO.getTopNProductsByQuantity(topN);
                }
            }

            request.setAttribute("reportProducts", result);
            request.getRequestDispatcher("report_result.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error generating report: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
