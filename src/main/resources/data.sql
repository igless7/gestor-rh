-- Seleccionamos la base de datos
USE gestor_rh;

-- --------------------------------------------------------
-- 1. Insertar Departamentos (2 registros)
-- --------------------------------------------------------
INSERT INTO departamento (nombre, descripcion) VALUES
                                                   ('Tecnología de la Información', 'Departamento encargado del desarrollo y mantenimiento de software e infraestructura.'),
                                                   ('Recursos Humanos', 'Departamento encargado del reclutamiento, bienestar y gestión del personal.');

-- --------------------------------------------------------
-- 2. Insertar Empleados (3 registros)
-- --------------------------------------------------------
INSERT INTO empleados (dui, nombre, usuario, telefono, correo, fechaNacimiento) VALUES
                                                                                    ('04567891-2', 'Juan Antonio Pérez', 'jperez', '7777-8888', 'jperez@empresa.com', '1990-05-15'),
                                                                                    ('05678912-3', 'Ana María Gómez', 'agomez', '7777-9999', 'agomez@empresa.com', '1985-11-20'),
                                                                                    ('06789123-4', 'Carlos Eduardo López', 'clopez', '7777-0000', 'clopez@empresa.com', '1995-02-10');

-- --------------------------------------------------------
-- 3. Insertar Cargos (3 registros)
-- --------------------------------------------------------
INSERT INTO cargos (cargo, descripcion, jefatura) VALUES
                                                      ('Desarrollador Senior', 'Encargado de la arquitectura y desarrollo de aplicativos web.', FALSE),
                                                      ('Gerente de RRHH', 'Responsable de la toma de decisiones del área de recursos humanos.', TRUE),
                                                      ('Analista de Sistemas', 'Encargado del levantamiento de requerimientos y soporte técnico.', FALSE);

-- --------------------------------------------------------
-- 4. Insertar Tipos de Contratación (2 registros)
-- --------------------------------------------------------
INSERT INTO tipoContratacion (tipoContratacion) VALUES
                                                    ('Tiempo Indefinido'),
                                                    ('Por Proyecto / Servicios Profesionales');

-- --------------------------------------------------------
-- 5. Insertar Contrataciones (3 registros transaccionales)
-- IMPORTANTE: Aquí cruzamos los IDs generados arriba.
-- --------------------------------------------------------
INSERT INTO contrataciones (idDepartamento, idEmpleados, idCargo, idtipoContratacion, fecha, salario, estado) VALUES
-- Contratación 1: Juan Pérez (IT, Desarrollador, Indefinido)
(1, 1, 1, 1, '2023-01-15', 2500.00, TRUE),

-- Contratación 2: Ana Gómez (RRHH, Gerente, Indefinido)
(2, 2, 2, 1, '2021-06-01', 3200.50, TRUE),

-- Contratación 3: Carlos López (IT, Analista, Por Proyecto)
(1, 3, 3, 2, '2024-03-01', 1500.00, TRUE);