package com.example.squirtle_lab8.Daos;

import com.example.squirtle_lab8.Beans.Estatus;
import com.example.squirtle_lab8.Beans.Usuarios;
import com.example.squirtle_lab8.Beans.Viajes;

import java.sql.*;
import java.util.ArrayList;

public class UsuarioDaos extends DaoBase{

    public Usuarios validateUsernameAndPassword(String nombre, String password) {

        Usuarios usuarios = null;

        String sql = "SELECT * FROM usuarios u \n" +
                "inner join credenciales cr  on  cr.idUsuarios = u.idUsuarios  \n" +
                "where cr.nombre = ? and cr.passwordHashed = sha2(?,256)";

        try (Connection connection = getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, nombre);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    usuarios = obtenerCuentas(rs.getInt(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuarios;
    }

    public Usuarios obtenerCuentas(int idUsuarios) {

        Usuarios usuarios = null;

        String sql = "select * from usuarios u\n" +
                "inner join estatus e on u.idEstatus = e.idEstatus\n" +
                "where u.idUsuarios = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuarios);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    usuarios = new Usuarios();
                    fetchCuentasData(usuarios, rs);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return usuarios;
    }

    private void fetchCuentasData(Usuarios usuarios, ResultSet rs) throws SQLException {
        usuarios.setIdUsuarios(rs.getInt(1));
        usuarios.setNombre(rs.getString(2));
        usuarios.setApellido(rs.getString(3));
        usuarios.setEdad(rs.getInt(4));
        usuarios.setCodigoPucp(rs.getString(5));
        usuarios.setCorreoPucp(rs.getString(6));
        usuarios.setEspecialidad( rs.getString(7));

        Estatus estatus = new Estatus();
        estatus.setIdEstatus(rs.getInt(9));
        estatus.setNombre(rs.getString(10));
        usuarios.setEstatus(estatus);

    }

    public ArrayList<Viajes> mostrarViajesUsuario(String nombre){

        ArrayList<Viajes> listaViajesUsuario = new ArrayList<>();

        String sql = "SELECT concat(u.nombre,' ',u.apellido),\n" +
                "       v.idViajes,\n" +
                "       v.fechaReserva,\n" +
                "       v.fechaViaje,\n" +
                "       v.ciudadOrigen,\n" +
                "       v.ciudadaDestino,\n" +
                "       s.nombre,\n" +
                "       v.numeroBoletos,\n" +
                "       v.costoTotal\n" +
                "FROM estatus e, usuarios u, viajes v, seguros s\n" +
                "where e.idEstatus = u.idEstatus \n" +
                "\t  and u.idUsuarios = v.idUsuarios\n" +
                "      and v.idSeguros = s.idSeguros\n" +
                "      and u.nombre=?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, nombre);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Viajes viaje = new Viajes();
                viaje.setNombreUsuario(rs.getString(1));
                viaje.setIdViaje(rs.getInt(2));
                viaje.setFechaReserva(rs.getDate(3));
                viaje.setFechaViaje(rs.getDate(4));
                viaje.setCiudadOrigen(rs.getString(5));
                viaje.setCiudadDestino(rs.getString(6));
                viaje.setNombreSeguro(rs.getString(7));
                viaje.setNumeroBoletos(rs.getInt(8));
                viaje.setCostoTotal(rs.getBigDecimal(9));
                listaViajesUsuario.add(viaje);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return listaViajesUsuario;

    }

}
