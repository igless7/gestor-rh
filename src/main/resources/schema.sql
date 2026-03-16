-- 1. Crear la base de datos y usarla
CREATE DATABASE IF NOT EXISTS gestor_rh;
USE gestor_rh;

-- 2. Crear las tablas
-- Tabla: departamento
CREATE TABLE departamento (
                              idDepartamento INT AUTO_INCREMENT PRIMARY KEY,
                              nombre VARCHAR(100) NOT NULL,
                              descripcion TEXT
);

-- Tabla: empleados
CREATE TABLE empleados (
                           idEmpleados INT AUTO_INCREMENT PRIMARY KEY,
                           dui VARCHAR(10) NOT NULL UNIQUE,
                           nombre VARCHAR(100) NOT NULL,
                           usuario VARCHAR(50) NOT NULL UNIQUE,
                           telefono VARCHAR(20),
                           correo VARCHAR(100),
                           fechaNacimiento DATE
);

-- Tabla: cargos
CREATE TABLE cargos (
                        idCargo INT AUTO_INCREMENT PRIMARY KEY,
                        cargo VARCHAR(100) NOT NULL,
                        descripcion TEXT,
                        jefatura BOOLEAN NOT NULL DEFAULT FALSE
);

-- Tabla: tipoContratacion
CREATE TABLE tipoContratacion (
                                  idtipoContratacion INT AUTO_INCREMENT PRIMARY KEY,
                                  tipoContratacion VARCHAR(100) NOT NULL
);

-- 3. Crear la tabla transaccional (tabla central)
-- Tabla: contrataciones
CREATE TABLE contrataciones (
                                idContrataciones INT AUTO_INCREMENT PRIMARY KEY,
                                idDepartamento INT NOT NULL,
                                idEmpleados INT NOT NULL,
                                idCargo INT NOT NULL,
                                idtipoContratacion INT NOT NULL,
                                fecha DATE NOT NULL,
                                salario DECIMAL(10,2) NOT NULL, -- Uso de DECIMAL para exactitud financiera
                                estado BOOLEAN NOT NULL DEFAULT TRUE, -- TRUE (1) puede ser Activo, FALSE (0) Inactivo

-- Declaración de las Llaves Foráneas (Foreign Keys)
                                CONSTRAINT fk_contra_depto FOREIGN KEY (idDepartamento) REFERENCES departamento(idDepartamento),
                                CONSTRAINT fk_contra_emp FOREIGN KEY (idEmpleados) REFERENCES empleados(idEmpleados),
                                CONSTRAINT fk_contra_cargo FOREIGN KEY (idCargo) REFERENCES cargos(idCargo),
                                CONSTRAINT fk_contra_tipo FOREIGN KEY (idtipoContratacion) REFERENCES tipoContratacion(idtipoContratacion)
);