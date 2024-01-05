/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author HP
 */
public class login extends HttpServlet {

    Connection con=DataConnect.condb();
    String phn1,pwd1;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login at " + request.getContextPath() + "</h1>");
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
        String phn=request.getParameter("t1");
        String pwd=request.getParameter("t2");
        PrintWriter out = response.getWriter();
 
            try
            {
                Statement stmt=con.createStatement();
                ResultSet rs=stmt.executeQuery("select * from signup where phn='"+phn+"'");
                while(rs.next())
                {
                    phn1=rs.getString("phn");
                    pwd1=rs.getString("pwd");
                }
          
            
            if(phn.equals(phn1)&& pwd.equals(pwd1))
            {
                out.println("<html>");
                out.println("<body>");
                out.println("<script type=\"text/javascript\">");  
                out.println("alert('Login Sucessfull');");  
                out.println("window.location.href = 'services.html';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
                
            }
            else
            {
              out.println("<html>");
                out.println("<body>");
                out.println("<script type=\"text/javascript\">");  
                out.println("alert('Login Unsucessfull');");  
                out.println("window.location.href = 'login.html';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
              
            }
        }
        catch(Exception e)
        {
         System.out.println(e);
        }
        
    }
  
    }
  