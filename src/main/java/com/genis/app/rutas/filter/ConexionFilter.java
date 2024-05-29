package com.genis.app.rutas.filter;

import com.genis.app.rutas.utils.ConexionDB;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;
import java.sql.Connection;

@WebFilter("/*")
public class ConexionFilter implements Filter {
    //metodo
    private Connection getConnection(){
        return ConexionDB.getInstance();
    }
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        Connection conn = this.getConnection(); //conexion a la bd
        servletRequest.setAttribute("conn", conn);
        try {
            filterChain.doFilter(servletRequest, servletResponse);
        } catch (IOException | ServletException e) {
            throw new RuntimeException(e);
        }
    }
}
