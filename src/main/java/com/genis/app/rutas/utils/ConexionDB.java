package com.genis.app.rutas.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {
    //atributos
    private static final String url = "jdbc:oracle:thin:@//127.0.0.1:1521/xe";
    private static final String username = "SYSTEM";
    private static final String password = "g3ni5";

    //metodo que establece la conexion a la base de datos de oracle
    public static Connection getInstance(){
        try {
            return DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
