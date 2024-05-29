package com.genis.app.rutas.repositories;

import com.genis.app.rutas.models.Camion;
import com.genis.app.rutas.models.enums.Marcas;
import com.genis.app.rutas.models.enums.Tipos;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CamionesRepository implements IRepository<Camion> {

    //atributos
    private Connection conn;

    public CamionesRepository(Connection conn) {
        this.conn = conn;
    }



    @Override
    public List<Camion> listar() throws SQLException {
       List<Camion> camiones = new ArrayList<>();

        try(Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM CAMIONES")){
            while(rs.next()){
                Camion a = this.getCamion(rs);
                camiones.add(a);
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return camiones;
    }

    @Override
    public Camion getById(Long id) throws SQLException {
        return null;
    }

    @Override
    public void guardar(Camion camion) throws SQLException {
        String sql = "";
        if (camion.getId() != 0 && camion.getId() > 0){
            sql = "update camiones set matricula=?, tipo_camion=?"+" modelo=?, marca=?, capacidad=?"+" kilometraje  =?, disponibilidad=?"+" where id_camion=?";
        }else{
            sql = "insert into camiones (id_camion, matricula,"+" tipo_camion, modelo, marca, capacidad,"+" KILOMETRAJE, disponibilidad) values (SEQUENCE2.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
        }
        try(PreparedStatement stmt = conn.prepareStatement(sql)){
            if(camion.getId() != 0 && camion.getId() > 0){
                stmt.setString(1, camion.getMatricula());
                stmt.setString(2, camion.getTipoCamion().toString());
                stmt.setString(3, camion.getModelo().toString());
                stmt.setString(4, camion.getMarca().toString());
                stmt.setInt(5, camion.getCapacidad());
                stmt.setDouble(6, camion.getKilometraje());
                stmt.setInt(7, camion.getDisponibilidad() ? 1 : 0);
                stmt.setLong(8, camion.getId());
            }else {
                stmt.setString(1, camion.getMatricula());
                stmt.setString(2, camion.getTipoCamion().toString());
                stmt.setString(3, camion.getModelo().toString());
                stmt.setString(4, camion.getMarca().toString());
                stmt.setInt(5, camion.getCapacidad());
                stmt.setDouble(6, camion.getKilometraje());
                stmt.setInt(7, camion.getDisponibilidad() ? 1 : 0);
            }
            stmt.executeUpdate();
        }
    }

    @Override
    public void eliminar(Long id) throws SQLException {

    }

    private Camion getCamion(ResultSet rs) throws SQLException{
        Camion a = new Camion();
        a.setId(rs.getLong("ID_CAMION"));
        a.setMatricula(rs.getString("MATRICULA"));
        a.setTipoCamion(Tipos.valueOf(rs.getString("TIPO_CAMION")));
        a.setModelo(rs.getInt("MODELO"));
        a.setMarca(Marcas.valueOf(rs.getString("MARCA")));
        a.setCapacidad(rs.getInt("CAPACIDAD"));
        a.setKilometraje(rs.getDouble("KILOMETRAJE"));
        a.setDisponibilidad(rs.getBoolean("DISPONIBILIDAD"));
        return a;
    }
}
