package com.example.squirtle_lab8.Beans;

public class Credenciales {

    private String nombre;
    private String passwordHashed;
    private int idUsuarios;


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPasswordHashed() {
        return passwordHashed;
    }

    public void setPasswordHashed(String passwordHashed) {
        this.passwordHashed = passwordHashed;
    }

    public int getIdUsuario() {
        return idUsuarios;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuarios = idUsuario;
    }
}
