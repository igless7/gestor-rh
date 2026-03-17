package com.gestorrh.gestorrh;

import com.gestorrh.gestorrh.config.ConexionDb;

public class Prueba {
    public static void main(String[] args) {
        System.out.println(ConexionDb.getConnection());
    }
}
