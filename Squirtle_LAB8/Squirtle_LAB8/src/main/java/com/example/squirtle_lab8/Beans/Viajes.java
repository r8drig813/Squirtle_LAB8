package com.example.squirtle_lab8.Beans;

import java.sql.Date;

public class Viajes {

    private Date fechaReserva;
    private Date fechaViaje;
    private String ciudadOrigen;
    private String ciudadDestino;
    private int numeroBoletos;
    private double costoTotal;
    private int idUsuarios;
    private Usuarios usuarios;
    private int idSeguros;
    private Seguros seguros;

    public Date getFechaReserva() {
        return fechaReserva;
    }

    public void setFechaReserva(Date fechaReserva) {
        this.fechaReserva = fechaReserva;
    }

    public Date getFechaViaje() {
        return fechaViaje;
    }

    public void setFechaViaje(Date fechaViaje) {
        this.fechaViaje = fechaViaje;
    }

    public String getCiudadOrigen() {
        return ciudadOrigen;
    }

    public void setCiudadOrigen(String ciudadOrigen) {
        this.ciudadOrigen = ciudadOrigen;
    }

    public String getCiudadDestino() {
        return ciudadDestino;
    }

    public void setCiudadDestino(String ciudadDestino) {
        this.ciudadDestino = ciudadDestino;
    }

    public int getNumeroBoletos() {
        return numeroBoletos;
    }

    public void setNumeroBoletos(int numeroBoletos) {
        this.numeroBoletos = numeroBoletos;
    }

    public double getCostoTotal() {
        return costoTotal;
    }

    public void setCostoTotal(double costoTotal) {
        this.costoTotal = costoTotal;
    }

    public int getIdUsuarios() {
        return idUsuarios;
    }

    public void setIdUsuarios(int idUsuarios) {
        this.idUsuarios = idUsuarios;
    }

    public Usuarios getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(Usuarios usuarios) {
        this.usuarios = usuarios;
    }

    public int getIdSeguros() {
        return idSeguros;
    }

    public void setIdSeguros(int idSeguros) {
        this.idSeguros = idSeguros;
    }

    public Seguros getSeguros() {
        return seguros;
    }

    public void setSeguros(Seguros seguros) {
        this.seguros = seguros;
    }
}
