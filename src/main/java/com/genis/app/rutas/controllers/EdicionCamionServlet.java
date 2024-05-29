package com.genis.app.rutas.controllers;

import com.genis.app.rutas.models.Camion;
import com.genis.app.rutas.models.enums.Marcas;
import com.genis.app.rutas.models.enums.Tipos;
import com.genis.app.rutas.services.CamionesService;
import com.genis.app.rutas.services.IService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.time.DateTimeException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@WebServlet("/camiones/editar")
public class EdicionCamionServlet extends HttpServlet {
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
                camion = o.get();
                req.setAttribute("camion", camion);
                getServletContext().getRequestDispatcher("/edicionCamion.jsp").forward(req, resp);
            }else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "El camion no existe en la base de datos");
            }
        }
        else {
            //resp.sendRedirect(req.getContextPath() + "/cammiones/listar");
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Error de id, el id es null, debe agregarse como parametro a la url");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Camion> service = new CamionesService(conn);
        String matricula = req.getParameter("matricula");
        String tipoCamion = req.getParameter("tipoCamion");
        String modelo = req.getParameter("modelo");
        String marca = req.getParameter("marca");
        String capacidad = req.getParameter("capacidad");
        String kilometraje = req.getParameter("kilometraje");
        String checkbox[];
        checkbox = req.getParameterValues("disponibilidad");
        boolean habilitar;
        if(checkbox != null){
            habilitar = true;
        }else{
            habilitar = false;
        }
        Map<String,String> errores = new HashMap<>();
        if(matricula == null || matricula.isBlank()){
            errores.put("matricula","La matricula no puede estar vacia!");
        }
        if(tipoCamion == null || tipoCamion.isEmpty()){
            errores.put("tipoCamion","El tipo de camion  no puede estar vacio!");
        }
        if(modelo == null || modelo.isEmpty()){
            errores.put("modelo","El modelo  no puede estar vacio!");
        }
        if(marca == null || marca.isEmpty()){
            errores.put("marca","La marca no puede estar vacia!");
        }if(capacidad == null || capacidad.isEmpty()){
            errores.put("capacidad","La capacidad no puede estar vacia!");
        }if(kilometraje == null || kilometraje.isEmpty()){
            errores.put("kilometraje","El kilometraje no puede estar vacio!");
        }
        long id;
        id = Long.parseLong(req.getParameter("id"));
        Camion camion = new Camion();
        camion.setId(id);
        camion.setMatricula(matricula);
        camion.setTipoCamion(Tipos.valueOf(tipoCamion));
        camion.setModelo(Integer.parseInt(modelo));
        camion.setMarca(Marcas.valueOf(marca));
        camion.setCapacidad(Integer.parseInt(capacidad));
        camion.setKilometraje(Double.parseDouble(kilometraje));
        camion.setDisponibilidad(habilitar);

        if(errores.isEmpty()){
            service.guardar(camion);
            resp.sendRedirect(req.getContextPath()+ "/camiones/listar");
        }else {
            req.setAttribute("errores",errores);
            getServletContext().getRequestDispatcher("/edicionCamion.jsp").forward(req, resp);
        }
    }
}
