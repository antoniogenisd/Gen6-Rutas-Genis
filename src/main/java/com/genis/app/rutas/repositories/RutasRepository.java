package com.genis.app.rutas.repositories;

import com.genis.app.rutas.models.Ruta;

import java.sql.*;
import java.util.List;

public class RutasRepository implements IRutasRepository{
    private Connection conn;

    public RutasRepository(Connection conn){
        this.conn = conn;
    }
    @Override
    public Long guardarReturnId(Ruta ruta) throws SQLException {
        String sql = "";
        Long resultado = -1L;
        sql = "insert into rutas (ID_RUTA, CAMION_ID, CHOFER_ID,DIRECCION_ORIGEN_ID, DIRECCION_DESTINO_ID, DISTANCIA, FECHA_SALIDA, FECHA_LLEGADA_ESTIMADA, FECHA_LLEGADA_REAL, A_TIEMPO) values (SEQUENCE4.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try(PreparedStatement stmt = conn.prepareStatement(sql,new String[] {"ID_RUTA"})){
            stmt.setLong(1, ruta.getCamionId());
            stmt.setLong(2, ruta.getChoferId());
            stmt.setLong(3, ruta.getDireccionOrigenId());
            stmt.setLong(4, ruta.getDireccionDestinoId());
            stmt.setFloat(5, ruta.getDistancia());
           stmt.setDate(6, Date.valueOf(ruta.getFechaSalida()));
            stmt.setDate(7, Date.valueOf(ruta.getFechaLlegadaEstimada()));
            stmt.setDate(8, Date.valueOf(ruta.getFechaLlegadaReal()));
            stmt.setInt(9, ruta.getaTiempo());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if(rs.next()){
                resultado = rs.getLong(1);
            }
        }
        return resultado;
    }

    @Override
    public List<Ruta> listar() throws SQLException {
        return List.of();
    }

    @Override
    public Ruta getById(Long id) throws SQLException {
        return null;
    }

    @Override
    public void guardar(Ruta ruta) throws SQLException {

    }

    @Override
    public void eliminar(Long id) throws SQLException {

    }
}
