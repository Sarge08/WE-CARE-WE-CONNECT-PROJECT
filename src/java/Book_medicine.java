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
public class Book_medicine extends HttpServlet {

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
            out.println("<title>Servlet Book_medicine</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Book_medicine at " + request.getContextPath() + "</h1>");
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
        String had=request.getParameter("t3");
        String locality=request.getParameter("t4");
        String date=request.getParameter("t5");
        String meddetails=request.getParameter("t6");
         PrintWriter out=response.getWriter();
           try
        {
            ps=con.prepareStatement("insert into medicine(name,phn,had,locality,date,meddetails)values(?,?,?,?,?,?) ");
            ps.setString(1, name);
            ps.setString(2, phn);
            ps.setString(3, had);
            ps.setString(4, locality);
            ps.setString(5, date);
            ps.setString(6, meddetails);
           
            int count=ps.executeUpdate();
            if(count>0)
            {
                 response.setContentType("text/html");  
                out.println("<script type=\"text/javascript\">");  
                out.println("alert('Medicine booking successfull');");  
                out.println("window.location.href = 'services.html';");
                out.println("</script>");
            }
            else
            {
               response.setContentType("text/html");  
                out.println("<script type=\"text/javascript\">");  
                out.println("alert('Medicine booking unsuccessfull');");  
                out.println("window.location.href = 'services.html';");
                out.println("</script>"); 
            }
        }
        catch(Exception e)
        {
         out.println(e);
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
