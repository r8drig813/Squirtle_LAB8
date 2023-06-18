package com.example.squirtle_lab8.Daos;

import com.example.squirtle_lab8.Beans.Seguros;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class SeguroDaos extends DaoBase{

    public ArrayList<Seguros> lista() {

        ArrayList<Seguros> list = new ArrayList<>();
        try (Connection conn = getConection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM seguros;")) {

            while (rs.next()) {
                Seguros seguros = new Seguros();
                seguros.setIdSeguros(rs.getInt(1));
                seguros.setNombre(rs.getString(2));
                list.add(seguros);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);

        }
        return list;
    }
}
