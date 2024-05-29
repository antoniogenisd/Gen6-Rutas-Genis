package com.genis.app.rutas.controllers;

import com.genis.app.rutas.models.Camion;
import com.genis.app.rutas.models.Chofer;
import com.genis.app.rutas.services.CamionesService;
import com.genis.app.rutas.services.ChoferesService;
import com.genis.app.rutas.services.IService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.Optional;

@WebServlet("/camiones/eliminar")
public class EliminarCamionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Camion> service = new CamionesService(conn);
        long id;
        try {
            id = Long.parseLong(req.getParameter("id"));
        }catch (NumberFormatException e){
            id = 0L;
        }
        Camion camion = new Camion();
        if(id > 0){
            Optional<Camion> o = service.getById(id);
            if (o.isPresent()){
                service.eliminar(id);
                resp.sendRedirect(req.getContextPath() + "/camiones/listar");
            }else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "El camion no existe en la base de datos");
            }
        }
        else {
            //resp.sendRedirect(req.getContextPath() + "/camiones/listar");
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Error de id, el id es null, debe agregarse como parametro a la url");
        }
    }
}
