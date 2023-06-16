package com.example.squirtle_lab8.Daos;

import com.example.squirtle_lab8.Beans.Usuarios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDaos extends DaoBase{

    public Usuarios validateUsernameAndPassword(String nombre, String password) {

        Usuarios usuarios = null;

        String sql = "SELECT * FROM cuenta c \n" +
                "inner join credencial cr  on  cr.idCuenta = c.idCuenta  \n" +
                "where cr.correo = ? and cr.contraseniaHashed = sha2(?,256)";

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

        usuarios.setIdCuentas(rs.getInt(1));
        usuarios.setNombre(rs.getString(2));
        usuarios.setApellido(rs.getString(3));
        usuarios.setNickname(rs.getString(4));
        usuarios.setDireccion(rs.getString(5));
        usuarios.setCorreo(rs.getString(6));
        usuarios.setFoto(rs.getString(7));
        usuarios.setDescripcion(rs.getString(8));
        usuarios.setDesabilitado(rs.getBoolean(9));

        Roles roles = new Roles();
        roles.setIdRol(rs.getInt(11));
        roles.setRol(rs.getString(12));
        cuentas.setRoles(roles);

    }

}
