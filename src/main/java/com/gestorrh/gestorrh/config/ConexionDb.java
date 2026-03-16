package com.gestorrh.gestorrh.config;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConexionDb {
    private static final Properties props = new Properties();

    // Bloque estático para cargar las propiedades una sola vez al iniciar la clase
    static {
        try (InputStream input = ConexionDb.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (input == null) {
                System.out.println("Lo siento, no se pudo encontrar db.properties");
            } else {
                props.load(input);
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public static Connection getConnection() {
        Connection conexion = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(
                    props.getProperty("db.url"),
                    props.getProperty("db.user"),
                    props.getProperty("db.password")
            );
            System.out.println("Conexion establecida con exito");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conexion;
    }

    public static void closeConnection(Connection conexion) {
        if (conexion != null) {
            try {
                conexion.close();
                System.out.println("Se ha finalizado la conexion");
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
