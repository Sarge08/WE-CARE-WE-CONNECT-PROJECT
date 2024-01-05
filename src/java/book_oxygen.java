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
 * @author OCAC
 */
public class book_oxygen extends HttpServlet {

    Connection con=DataConnect.condb();
    PreparedStatement ps=null;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet book_oxygen</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet book_oxygen at " + request.getContextPath() + "</h1>");
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
        String name=request.getParameter("t1");
        String phn=request.getParameter("t2");
        String relphn=request.getParameter("t3");
        String hhad=request.getParameter("t4");
        String locality=request.getParameter("t5");
        String date=request.getParameter("t6");
        String prescribe=request.getParameter("prescribe");
        
        System.out.println("prescribe");
        PrintWriter out=response.getWriter();
           try
        {
            ps=con.prepareStatement("insert into cylinder(name,phn,relphn,hhad,locality,date,prescribe)values(?,?,?,?,?,?,?) ");
            ps.setString(1, name);
            ps.setString(2, phn);
            ps.setString(3, relphn);
            ps.setString(4, hhad);
            ps.setString(5, locality);
            ps.setString(6, date);
            ps.setString(7, prescribe);
             
            int count=ps.executeUpdate();
            if(count>0)
            {
                 response.setContentType("text/html");  
                out.println("<script type=\"text/javascript\">");  
                out.println("alert('Cylinder booking successfull');");  
                out.println("window.location.href = 'services.html';");
                out.println("</script>");
            }
            else
            {
               response.setContentType("text/html");  
                out.println("<script type=\"text/javascript\">");  
                out.println("alert('Cylinder booking unsuccessfull');");  
                out.println("window.location.href = 'services.html';");
                out.println("</script>"); 
            }
        }
        catch(Exception e)
        {
         out.println(e);
        }
        
    }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
  