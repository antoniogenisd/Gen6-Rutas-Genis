package com.genis.app.rutas.services;

import com.genis.app.rutas.models.Camion;
import com.genis.app.rutas.models.Chofer;
import com.genis.app.rutas.models.Ruta;

import java.util.List;

public interface IRutasServices extends IService<Ruta> {
    List<Camion> listarCamiones();
    List<Chofer> listarChoferes();
    Long guardarReturnId(Ruta ruta);
}
