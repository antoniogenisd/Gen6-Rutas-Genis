package com.genis.app.rutas.services;

import java.util.List;
import java.util.Optional;

public interface IService<T>{

    List<T> listar();
    Optional<T> getById(Long id);
    void guardar(T t);
    void eliminar(Long id);
}
