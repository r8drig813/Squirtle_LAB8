package com.example.squirtle_lab8.Daos;

import com.example.squirtle_lab8.Beans.Estatus;
import com.example.squirtle_lab8.Beans.Usuarios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

}
