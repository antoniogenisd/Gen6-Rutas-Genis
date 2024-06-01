package com.genis.app.rutas.services;

import com.genis.app.rutas.models.Camion;
import com.genis.app.rutas.models.Chofer;
import com.genis.app.rutas.models.Ruta;
import com.genis.app.rutas.repositories.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class RutasService implements IRutasServices{
    private IRepository<Chofer> choferesRepo;
    private IRepository<Camion> camionesRepo;
    private IRutasRepository rutasRepository;

    public RutasService(Connection connection){
        this.choferesRepo = new ChoferesRepository(connection);
        this.camionesRepo = new CamionesRepository(connection);
        this.rutasRepository = new RutasRepository(connection);
    }


    @Override
    public List<Camion> listarCamiones() {
        try {
            return camionesRepo.listar();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage(), e.getCause());
        }
    }

    @Override
    public List<Chofer> listarChoferes() {
        try {
            return choferesRepo.listar();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage(), e.getCause());
        }
    }

    @Override
    public Long guardarReturnId(Ruta ruta) {
      try{
          return rutasRepository.guardarReturnId(ruta);
      }catch (SQLException e){
          throw new RuntimeException(e.getMessage(), e.getCause());
      }
    }

    @Override
    public List<Ruta> listar() {
        return List.of();
    }

    @Override
    public Optional<Ruta> getById(Long id) {
        return Optional.empty();
    }

    @Override
    public void guardar(Ruta ruta) {

    }

    @Override
    public void eliminar(Long id) {

    }
}
