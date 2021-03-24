/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Account;
import entity.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.accountDAO;
import model.uOrderDAO;


/**
 *
 * @author Admin
 */
public class loginServlet extends HttpServlet {

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
            out.println("<title>Servlet loginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
        
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        
        accountDAO adb = new accountDAO();
        
        if(!adb.checkAcc(username, password)){
            request.setAttribute("error", "1");
            request.getRequestDispatcher("index").forward(request, response);
        }else{
            Account user = adb.getInfo(username, password);
            
            HttpSession session = request.getSession();
            if(user.getPermission() == 0){
                session.setAttribute("user", user);
            Cookie cUsername = new Cookie("username",username);
            Cookie cPassword = new Cookie("password",password);
            Cookie cRemember = new Cookie("remember",remember);
            
            if(remember != null){
                cUsername.setMaxAge(60*60*24*10);
                cPassword.setMaxAge(60*60*24*10);
                cRemember.setMaxAge(60*60*24*10);
            }else{
                cUsername.setMaxAge(0);
                cPassword.setMaxAge(0);
                cRemember.setMaxAge(0);
            }
            
            response.addCookie(cUsername);
            response.addCookie(cPassword);
            response.addCookie(cRemember);
            request.getRequestDispatcher("index").forward(request, response);
            }
            else{
                session.setAttribute("admin",new Admin() );
            request.getRequestDispatcher("product?status=1&begin=0&end=9").forward(request, response);
            }
        }

        
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
