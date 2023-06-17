package com.example.squirtle_lab8.Daos;

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

    public Usuarios obtenerCuentas(int idUsuario) {

        Usuarios usuarios = null;

        String sql = "select * from cuenta c\n" +
                "inner join rol r on c.idRol = r.idRol\n" +
                "where c.idCuenta = ?;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    usuarios = new Usuarios();
                    fetchEmployeeData(usuarios, rs);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return usuarios;
    }

    private void fetchEmployeeData(Usuarios usuarios, ResultSet rs) throws SQLException {



    }

}
