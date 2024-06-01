package com.genis.app.rutas.models;

import java.time.LocalDate;

public class Ruta {
    private Long id;
    private Long camionId;
    private Long choferId;
    private Long direccionOrigenId;
    private Long direccionDestinoId;
    private Float distancia;
    private LocalDate fechaSalida;
    private LocalDate fechaLlegadaEstimada;
    private LocalDate fechaLlegadaReal;
    private Integer aTiempo;
    public Ruta(){

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCamionId() {
        return camionId;
    }

    public void setCamionId(Long camionId) {
        this.camionId = camionId;
    }

    public Long getChoferId() {
        return choferId;
    }

    public void setChoferId(Long choferId) {
        this.choferId = choferId;
    }

    public Long getDireccionOrigenId() {
        return direccionOrigenId;
    }

    public void setDireccionOrigenId(Long direccionOrigenId) {
        this.direccionOrigenId = direccionOrigenId;
    }

    public Long getDireccionDestinoId() {
        return direccionDestinoId;
    }

    public void setDireccionDestinoId(Long direccionDestinoId) {
        this.direccionDestinoId = direccionDestinoId;
    }

    public Float getDistancia() {
        return distancia;
    }

    public void setDistancia(Float distancia) {
        this.distancia = distancia;
    }

    public LocalDate getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(LocalDate fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public LocalDate getFechaLlegadaEstimada() {
        return fechaLlegadaEstimada;
    }

    public void setFechaLlegadaEstimada(LocalDate fechaLlegadaEstimada) {
        this.fechaLlegadaEstimada = fechaLlegadaEstimada;
    }

    public LocalDate getFechaLlegadaReal() {
        return fechaLlegadaReal;
    }

    public void setFechaLlegadaReal(LocalDate fechaLlegadaReal) {
        this.fechaLlegadaReal = fechaLlegadaReal;
    }

    public Integer getaTiempo() {
        return aTiempo;
    }

    public void setaTiempo(Integer aTiempo) {
        this.aTiempo = aTiempo;
    }
}
