package com.genis.app.rutas.controllers;

import com.genis.app.rutas.models.Chofer;
import com.genis.app.rutas.services.ChoferesService;
import com.genis.app.rutas.services.IService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/choferes/listar")
public class ListaChoferesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //recuperamos la conexion que provee el filtro
        Connection conn = (Connection) req.getAttribute("conn");
        //declaramos un objeto de tipo servicio
        IService<Chofer> service = new ChoferesService(conn);
        List<Chofer> choferes = service.listar();
         /*for (Chofer c: choferes) {
            resp.getWriter().println("<h2>"+c.getId() + " -> " +c.getNombre() + " -> " + c.getApPaterno()+"</h2>");
        }*/
        req.setAttribute("choferes", choferes);
        getServletContext().getRequestDispatcher("/listaChoferes.jsp").forward(req, resp);
    }
}
