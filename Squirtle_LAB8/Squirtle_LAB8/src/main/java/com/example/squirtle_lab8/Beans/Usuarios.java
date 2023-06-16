package com.example.squirtle_lab8.Beans;

public class Usuarios {

    private int idUsuarios;
    private String nombre;
    private String apellido;
    private int edad;
    private String codigoPucp;
    private String correoPucp;
    private String especialidad;
    private int idEstatus;
    private Estatus estatus;

    public int getIdUsuarios() {
        return idUsuarios;
    }

    public void setIdUsuarios(int idUsuarios) {
        this.idUsuarios = idUsuarios;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getCodigoPucp() {
        return codigoPucp;
    }

    public void setCodigoPucp(String codigoPucp) {
        this.codigoPucp = codigoPucp;
    }

    public String getCorreoPucp() {
        return correoPucp;
    }

    public void setCorreoPucp(String correoPucp) {
        this.correoPucp = correoPucp;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getIdEstatus() {
        return idEstatus;
    }

    public void setIdEstatus(int idEstatus) {
        this.idEstatus = idEstatus;
    }

    public Estatus getEstatus() {
        return estatus;
    }

    public void setEstatus(Estatus estatus) {
        this.estatus = estatus;
    }
}
