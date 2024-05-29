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
import java.util.Optional;

@WebServlet("/choferes/detalle")
public class DetalleChoferServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Chofer> service = new ChoferesService(conn);
        long id;
        try {
            id = Long.parseLong(req.getParameter("id"));
        }catch (NumberFormatException e){
            id = 0L;
        }
        Chofer chofer = new Chofer();
        if(id > 0){
            Optional<Chofer> o = service.getById(id);
            if (o.isPresent()){
                chofer = o.get();
                req.setAttribute("chofer", chofer);
                getServletContext().getRequestDispatcher("/detalleChofer.jsp").forward(req, resp);
            }else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "El chofer no existe en la base de datos");
            }
        }
        else {
            //resp.sendRedirect(req.getContextPath() + "/choferes/listar");
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Error de id, el id es null, debe agregarse como parametro a la url");
        }
    }
}
