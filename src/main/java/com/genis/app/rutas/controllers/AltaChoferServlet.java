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
import java.time.DateTimeException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/choferes/alta")
public class AltaChoferServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/altaChofer.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Chofer> service = new ChoferesService(conn);
        String nombre = req.getParameter("nombre");
        String apPaterno = req.getParameter("apPaterno");
        String apMaterno = req.getParameter("apMaterno");
        String licencia = req.getParameter("licencia");
        String telefono = req.getParameter("telefono");
        String fechaNacimiento = req.getParameter("fechaNacimiento");
        LocalDate fecha;
        try{
            fecha = LocalDate.parse(fechaNacimiento, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        }catch (DateTimeException e){
            fecha = null;
        }
        String checkbox[];
        checkbox = req.getParameterValues("disponibilidad");
        boolean habilitar;
        if(checkbox != null){
            habilitar = true;
        }else{
            habilitar = false;
        }
        Map<String,String> errores = new HashMap<>();
        if(nombre == null || nombre.isBlank()){
            errores.put("nombre","El nombre no puede estar vacio!");
        }
        if(apPaterno == null || apPaterno.isEmpty()){
            errores.put("apPaterno","El apellido paterno no puede estar vacio!");
        }
        if(apMaterno == null || apMaterno.isEmpty()){
            errores.put("apMaterno","El apellido materno no puede estar vacio!");
        }
        if(licencia == null || licencia.isEmpty()){
            errores.put("licencia","La licencia no puede estar vacia!");
        }if(telefono == null || telefono.isEmpty()){
            errores.put("telefono","El telefono no puede estar vacio!");
        }if(fechaNacimiento == null || fechaNacimiento.isEmpty()){
            errores.put("fechaNacimiento","La fecha de nacimiento no puede estar vacia!");
        }
        if(errores.isEmpty()){
            Chofer chofer = new Chofer();
            chofer.setId(0L);
            chofer.setNombre(nombre);
            chofer.setApPaterno(apPaterno);
            chofer.setApMaterno(apMaterno);
            chofer.setLicencia(licencia);
            chofer.setTelefono(telefono);
            chofer.setFechaNacimiento(fecha);
            chofer.setDisponibilidad(habilitar);
            service.guardar(chofer);
            resp.sendRedirect(req.getContextPath()+ "/choferes/listar");
        }else {
            req.setAttribute("errores",errores);
            getServletContext().getRequestDispatcher("/altaChofer.jsp").forward(req, resp);
        }
    }
}