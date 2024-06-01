package com.genis.app.rutas.repositories;

import com.genis.app.rutas.models.Ruta;

import java.sql.SQLException;

public interface IRutasRepository extends IRepository<Ruta> {
    Long guardarReturnId(Ruta ruta) throws SQLException;
}
