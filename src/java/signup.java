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
public class signup extends HttpServlet {

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
            out.println("<title>Servlet signup</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet signup at " + request.getContextPath() + "</h1>");
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
        String adh=request.getParameter("t2");
        String dopos=request.getParameter("t3");
        String phn=request.getParameter("t4");
        String address=request.getParameter("t5");
        String pwd=request.getParameter("t6");
        
        String gender=request.getParameter("gender");
        System.out.println("gender");
        PrintWriter out=response.getWriter();
           try
        {
            ps=con.prepareStatement("insert into signup(name,adh,dopos,phn,address,pwd,gender)values(?,?,?,?,?,?,?) ");
            ps.setString(1, name);
            ps.setString(2, adh);
            ps.setString(3, dopos);
            ps.setString(4, phn);
            ps.setString(5, address);
            ps.setString(6, pwd);
           
            ps.setString(7, gender);
            int count=ps.executeUpdate();
            if(count>0)
            {
                 response.setContentType("text/html");  
                out.println("<script type=\"text/javascript\">");  
                out.println("alert('Registration sucessfull');");  
                out.println("window.location.href = 'index.html';");
                out.println("</script>");
            }
            else
            {
               response.setContentType("text/html");  
                out.println("<script type=\"text/javascript\">");  
                out.println("alert('Registration unsucessfull');");  
                out.println("window.location.href = 'index.html';");
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
    