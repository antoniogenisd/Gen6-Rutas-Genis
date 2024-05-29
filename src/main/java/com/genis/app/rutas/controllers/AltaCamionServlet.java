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
import java.util.HashMap;
import java.util.Map;

@WebServlet("/camiones/alta")
public class AltaCamionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/altaCamion.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Camion> service = new CamionesService(conn);
        String matricula = req.getParameter("matricula");
        String tipo = req.getParameter("tipoCamion");
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
        if(tipo == null || tipo.isEmpty() || modelo.isBlank()){
            errores.put("tipo","El tipo de camion no puede estar vacio!");
        }
        if(modelo == null || modelo.isEmpty() || modelo.isBlank()){
            errores.put("modelo","El modelo no puede estar vacio!");
        }
        if(marca == null || marca.isEmpty() || modelo.isBlank()){
            errores.put("marca","La marca no puede estar vacia!");
        }if(capacidad == null || capacidad.isEmpty()){
            errores.put("capacidad","La capacidad no puede estar vacia!");
        }if(kilometraje == null || kilometraje.isEmpty()){
            errores.put("kilometraje","El kilometraje no puede estar vacio!");
        }
        if(errores.isEmpty()){
            Camion camion = new Camion();
            camion.setId(0L);
            camion.setMatricula(matricula);
            camion.setTipoCamion(Tipos.valueOf(tipo));
            camion.setModelo(Integer.parseInt(modelo));
            camion.setMarca(Marcas.valueOf(marca));
            camion.setCapacidad(Integer.parseInt(capacidad));
            camion.setKilometraje(Double.parseDouble(kilometraje));
            camion.setDisponibilidad(habilitar);
            service.guardar(camion);
            resp.sendRedirect(req.getContextPath()+ "/camiones/listar");
        }else {
            req.setAttribute("errores",errores);
            getServletContext().getRequestDispatcher("/altaCamion.jsp").forward(req, resp);
        }
    }

}
