package com.example.squirtle_lab8.Daos;

import com.example.squirtle_lab8.Beans.Usuarios;
import com.example.squirtle_lab8.Beans.Viajes;
import java.util.Random;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;



public class ViajeDao extends DaoBase{

    public void añadirViaje (Viajes viajes) throws SQLException{

        int id = 1234;
        int numeroAleatorio = generarNumeroAleatorioDesdeID(id);

        String sql = "insert into viajes (idViajes,fechaReserva,fechaViaje,ciudadOrigen,ciudadaDestino,numeroBoletos,costoTotal,idUsuarios,idSeguros)\n" +
                "values (88888888,?,?,Lima,DESTINO,?,?,,?);";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            setViajeParams(pstmt, viajes);
            pstmt.executeUpdate();
        }
    }

    public void setViajeParams (PreparedStatement pstmt, Viajes viajes) throws SQLException{

        pstmt.setDate(1,viajes.getFechaViaje());
        pstmt.setDate(2,viajes.getFechaReserva());
        pstmt.setInt(3,viajes.getNumeroBoletos());
        pstmt.setInt(4,viajes.getSeguros().getIdSeguros());
        pstmt.setBigDecimal(5,viajes.getCostoTotal());
        //pstmt.setInt(7,usuarios.getIdEstatus());


    }

    public static int generarNumeroAleatorioDesdeID(int id) {
        Random random = new Random(id);
        return random.nextInt();
    }




}
