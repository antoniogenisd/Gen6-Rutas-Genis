package com.genis.app.rutas.controllers;

import com.genis.app.rutas.models.Camion;
import com.genis.app.rutas.services.CamionesService;
import com.genis.app.rutas.services.IService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/camiones/listar")
public class ListaCamionesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //recuperamos la conexion que provee el filtro
        Connection conn = (Connection) req.getAttribute("conn");
        //declaramos un objeto de tipo servicio
        IService<Camion> service = new CamionesService(conn);
        List<Camion> camiones = service.listar();
        req.setAttribute("camiones", camiones);
        getServletContext().getRequestDispatcher("/listaCamiones.jsp").forward(req, resp);
    }
}
