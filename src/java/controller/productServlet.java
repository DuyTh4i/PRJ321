/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Account;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.cartDAO;
import model.productDAO;

/**
 *
 * @author Admin
 */
public class productServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet productServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet productServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int status = Integer.parseInt(request.getParameter("status"));
        int begin = 0, end = 9;
        if (request.getParameter("begin") != null) {
            begin = Integer.parseInt(request.getParameter("begin"));
        }
        if (request.getParameter("end") != null) {
            end = Integer.parseInt(request.getParameter("end"));
        }
        productDAO pdb = new productDAO();
        ArrayList<Product> ps = pdb.getProducts(status);
        ArrayList<Product> list = pdb.viewByPage(pdb.getProducts(status), begin, end);
        request.setAttribute("list", list);
        String mess = (status == 1) ? "Hàng có sẵn" : "Hàng order";
        request.setAttribute("mess", mess);
        request.setAttribute("size", ps.size());
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            cartDAO cdb = new cartDAO();
            Account user = (Account) session.getAttribute("user");
            request.setAttribute("total", cdb.getTotalQ(user.getId()));
        }
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int status = Integer.parseInt(request.getParameter("status"));
        int begin = 0, end = 9;
        if (request.getParameter("begin") != null) {
            begin = Integer.parseInt(request.getParameter("begin"));
        }
        if (request.getParameter("end") != null) {
            end = Integer.parseInt(request.getParameter("end"));
        }
        productDAO pdb = new productDAO();
        ArrayList<Product> ps = pdb.getProducts(status);
        ArrayList<Product> list = pdb.viewByPage(pdb.getProducts(status), begin, end);
        request.setAttribute("list", list);
        String mess = (status == 1) ? "Hàng có sẵn" : "Hàng order";
        request.setAttribute("mess", mess);
        request.setAttribute("size", ps.size());
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            cartDAO cdb = new cartDAO();
            Account user = (Account) session.getAttribute("user");
            request.setAttribute("total", cdb.getTotalQ(user.getId()));
        }
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
