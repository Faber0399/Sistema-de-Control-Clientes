/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package web;

import datos.ClienteDaoJDBC;
import dominio.Cliente;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author faber
 */
@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
        this.accionDefaul(request, response);
    }
    public double saldoTotal(List<Cliente> clientes){
        double saldoTotal=0;
        for (Cliente cliente: clientes){
            saldoTotal+=cliente.getSaldo();
        }
        return saldoTotal;
    }
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
        
        String accion=request.getParameter("accion");
    }
    private void accionDefaul(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
        List<Cliente> clientes = new ClienteDaoJDBC().listar2();
        System.out.println("clientes= " + clientes);
        request.setAttribute("clientes", clientes);
        request.setAttribute("totalClientes",clientes.size());
        request.setAttribute("saldoTotal", saldoTotal(clientes));
        request.getRequestDispatcher("clientes.jsp").forward(request,response);
    }
}
