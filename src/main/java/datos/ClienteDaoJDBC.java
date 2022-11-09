/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package datos;

import dominio.Cliente;
import java.sql.*;
import java.util.logging.Formatter;
import java.util.logging.LogRecord;

/**
 *
 * @author faber
 */
public class ClienteDaoJDBC {

    private static final String SQL_SELECT = "SELECT id_cliente, nombre, apellido, email, telefono, saldo FROM cliente";
    private static final String SQL_SELECT_BY_ID = "SELECT id_cliente, nombre, apellido, email, telefono, saldo FROM cliente WHERE id_cliente=?";
    private static final String SQL_INSERT = "INSERT INTO cliente(nombre, apellido, email, telefono, saldo) VALUES (?,?,?,?,?)";
    private static final String SQL_UPDATE = "UPDATE cliente SET nombre=?, apellido=?, email=?, telefono=?, saldo=? WHERE id_cliente=?";
    private static final String SQL_DELETE = "DELETE cliente WHERE id_cliente=?";

    public void Listar() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Cliente cliente = null;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT);
            rs = stmt.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int cols = rsmd.getColumnCount();
            String col, colData;
            for (int i = 0; i <= cols; i++) {
                col = leftJustify(rsmd.getColumnName(i), rsmd.getColumnDisplaySize(i));
                System.out.println(col);
            }
            System.out.println();
            while (rs.next()) {
                for (int i = 0; i <= cols; i++) {
                    if (rs.getObject(i) != null) {
                        colData = rs.getObject(i).toString();
                    } else {
                        colData = "NULL";
                    }
                    col = leftJustify(colData, rsmd.getColumnDisplaySize(cols));
                    System.out.println(col);
                }
                System.out.println();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();

        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }

    }

    private String leftJustify(String s, int n) {
        if (s.length() <= n) {
            n++;
        }
        return String.format("%1$-" + n + "s", s);
    }
}
