/* 2026-11-08 21:03:41 [65 ms] */ 
CREATE TABLE IF NOT EXISTS dependencias (
    id_dependencia INT AUTO_INCREMENT PRIMARY KEY,
    nombre_dependencia VARCHAR(500) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/* 2026-11-08 21:03:53 [64 ms] */ 
CREATE TABLE IF NOT EXISTS secciones (
    id_seccion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_seccion VARCHAR(500) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/* 2026-11-08 21:03:57 [62 ms] */ 
CREATE TABLE IF NOT EXISTS formatos (
    id_formato INT AUTO_INCREMENT PRIMARY KEY,
    nombre_formato VARCHAR(500) NOT NULL UNIQUE,
    descripcion_formato TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/* 2026-11-08 21:04:01 [71 ms] */ 
CREATE TABLE IF NOT EXISTS frecuencias (
    id_frecuencia INT AUTO_INCREMENT PRIMARY KEY,
    descripcion_frecuencia VARCHAR(500) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/* 2026-11-08 21:04:04 [65 ms] */ 
CREATE TABLE IF NOT EXISTS idiomas (
    id_idioma INT AUTO_INCREMENT PRIMARY KEY,
    nombre_idioma VARCHAR(500) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/* 2026-11-08 21:04:06 [45 ms] */ 
CREATE TABLE IF NOT EXISTS medios_conservacion (
    id_medio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_medio VARCHAR(500) NOT NULL UNIQUE,
    descripcion_medio TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/* 2026-11-08 21:04:10 [77 ms] */ 
CREATE TABLE IF NOT EXISTS publicaciones (
    id_publicacion INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(500) NOT NULL,
    fecha_generacion DATE DEFAULT NULL,
    fecha_generacion_original VARCHAR(500) DEFAULT NULL,
    ruta_consulta TEXT,
    id_seccion INT NOT NULL,
    id_medio INT,
    id_frecuencia INT,
    id_dependencia_responsable INT,
    id_dependencia_actualizacion INT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_pub_seccion
        FOREIGN KEY (id_seccion)
        REFERENCES secciones(id_seccion),

    CONSTRAINT fk_pub_medio
        FOREIGN KEY (id_medio)
        REFERENCES medios_conservacion(id_medio),

    CONSTRAINT fk_pub_frecuencia
        FOREIGN KEY (id_frecuencia)
        REFERENCES frecuencias(id_frecuencia),

    CONSTRAINT fk_pub_dep_responsable
        FOREIGN KEY (id_dependencia_responsable)
        REFERENCES dependencias(id_dependencia),

    CONSTRAINT fk_pub_dep_actualizacion
        FOREIGN KEY (id_dependencia_actualizacion)
        REFERENCES dependencias(id_dependencia)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/* 2026-11-08 21:04:16 [66 ms] */ 
CREATE TABLE IF NOT EXISTS publicaciones_formatos (
    id_publicacion INT NOT NULL,
    id_formato INT NOT NULL,
    PRIMARY KEY (id_publicacion, id_formato),

    FOREIGN KEY (id_publicacion)
        REFERENCES publicaciones(id_publicacion),

    FOREIGN KEY (id_formato)
        REFERENCES formatos(id_formato)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/* 2026-11-08 21:04:19 [115 ms] */ 
CREATE TABLE IF NOT EXISTS publicaciones_idiomas (
    id_publicacion INT NOT NULL,
    id_idioma INT NOT NULL,
    PRIMARY KEY (id_publicacion, id_idioma),

    FOREIGN KEY (id_publicacion)
        REFERENCES publicaciones(id_publicacion),

    FOREIGN KEY (id_idioma)
        REFERENCES idiomas(id_idioma)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/* 2026-11-08 21:04:42 [4 ms] */ 
CREATE TABLE IF NOT EXISTS publicaciones (
    id_publicacion INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(500) NOT NULL,
    fecha_generacion DATE DEFAULT NULL,
    fecha_generacion_original VARCHAR(500) DEFAULT NULL,
    ruta_consulta TEXT,
    id_seccion INT NOT NULL,
    id_medio INT,
    id_frecuencia INT,
    id_dependencia_responsable INT,
    id_dependencia_actualizacion INT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_pub_seccion
        FOREIGN KEY (id_seccion)
        REFERENCES secciones(id_seccion),

    CONSTRAINT fk_pub_medio
        FOREIGN KEY (id_medio)
        REFERENCES medios_conservacion(id_medio),

    CONSTRAINT fk_pub_frecuencia
        FOREIGN KEY (id_frecuencia)
        REFERENCES frecuencias(id_frecuencia),

    CONSTRAINT fk_pub_dep_responsable
        FOREIGN KEY (id_dependencia_responsable)
        REFERENCES dependencias(id_dependencia),

    CONSTRAINT fk_pub_dep_actualizacion
        FOREIGN KEY (id_dependencia_actualizacion)
        REFERENCES dependencias(id_dependencia)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/* 2026-11-08 21:04:49 [3 ms] */ 
CREATE TABLE IF NOT EXISTS publicaciones_formatos (
    id_publicacion INT NOT NULL,
    id_formato INT NOT NULL,
    PRIMARY KEY (id_publicacion, id_formato),

    FOREIGN KEY (id_publicacion)
        REFERENCES publicaciones(id_publicacion),

    FOREIGN KEY (id_formato)
        REFERENCES formatos(id_formato)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/* 2026-11-08 21:04:54 [3 ms] */ 
CREATE TABLE IF NOT EXISTS publicaciones_idiomas (
    id_publicacion INT NOT NULL,
    id_idioma INT NOT NULL,
    PRIMARY KEY (id_publicacion, id_idioma),

    FOREIGN KEY (id_publicacion)
        REFERENCES publicaciones(id_publicacion),

    FOREIGN KEY (id_idioma)
        REFERENCES idiomas(id_idioma)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/* 2026-11-08 21:04:56 [49 ms] */ 
CREATE TABLE IF NOT EXISTS auditoria_publicaciones (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_publicacion INT,
    accion VARCHAR(20) NOT NULL,
    fecha_accion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR(150),
    detalle TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/* 2026-11-08 21:26:04 [44 ms] */ 
INSERT IGNORE INTO dependencias (nombre_dependencia)
VALUES
('Dirección General'),
('Subdirección de Planeación'),
('Subdirección de Gestión Corporativa'),
('Área de Talento Humano'),
('Atención al Ciudadano'),
('Oficina Asesora Jurídica'),
('Oficina Jurídica'),
('Subdirección de Desarrollo y Competitividad'),
('Subdirección de Mercadeo'),
('Subdirección de Inteligencia y Gestión de Tecnologías de la Información'),
('Área Financiera'),
('Gestión Documental'),
('Oficina de Control Interno'),
('Oficina Asesora de Comunicaciones'),
('Todas las dependencias'),
('N.A.');
/* 2026-11-08 21:26:08 [3 ms] */ 
SELECT * FROM dependencias
ORDER BY id_dependencia LIMIT 100;
/* 2026-11-08 21:27:15 [43 ms] */ 
INSERT IGNORE INTO dependencias (nombre_dependencia)
VALUES
('Dirección General'),
('Subdirección de Planeación'),
('Subdirección de Gestión Corporativa'),
('Área de Talento Humano'),
('Atención al Ciudadano'),
('Oficina Asesora Jurídica'),
('Oficina Jurídica'),
('Subdirección de Desarrollo y Competitividad'),
('Subdirección de Mercadeo'),
('Subdirección de Inteligencia y Gestión de Tecnologías de la Información'),
('Área Financiera'),
('Gestión Documental'),
('Oficina de Control Interno'),
('Oficina Asesora de Comunicaciones'),
('Todas las dependencias'),
('N.A.');
/* 2026-11-08 21:27:20 [2 ms] */ 
SELECT * FROM dependencias
ORDER BY id_dependencia LIMIT 100;
/* 2026-11-08 21:28:01 [42 ms] */ 
INSERT IGNORE INTO secciones (nombre_seccion)
VALUES
('Transparencia y acceso a la información pública'),
('Información de la entidad'),
('Normatividad'),
('Planeación y presupuesto participativo'),
('Control'),
('Contratación'),
('Trámites y servicios'),
('Participa'),
('Datos abiertos'),
('Información turística'),
('Gestión institucional'),
('Atención al ciudadano');
/* 2026-11-08 21:28:03 [3 ms] */ 
SELECT * FROM secciones
ORDER BY id_seccion LIMIT 100;
/* 2026-11-08 21:28:42 [42 ms] */ 
INSERT IGNORE INTO formatos (nombre_formato)
VALUES
('PDF'),
('Excel'),
('Word'),
('Página web'),
('Documento electrónico'),
('Documento físico'),
('Presentación'),
('Imagen'),
('Video'),
('Enlace externo');
/* 2026-11-08 21:28:44 [3 ms] */ 
SELECT * FROM formatos
ORDER BY id_formato LIMIT 100;
/* 2026-11-08 21:29:39 [2 ms] */ 
SELECT * FROM frecuencias
ORDER BY id_frecuencia LIMIT 100;
/* 2026-11-08 21:30:03 [3 ms] */ 
VALUES
('Diaria'),
('Semanal'),
('Mensual'),
('Trimestral'),
('Semestral'),
('Anual'),
('Cuando se requiera'),
('No aplica');
/* 2026-11-08 21:30:06 [2 ms] */ 
SELECT * FROM frecuencias
ORDER BY id_frecuencia LIMIT 100;
/* 2026-11-08 21:30:18 [2 ms] */ 
SELECT * FROM formatos
ORDER BY id_formato LIMIT 100;
/* 2026-11-08 21:30:23 [3 ms] */ 
VALUES
('Diaria'),
('Semanal'),
('Mensual'),
('Trimestral'),
('Semestral'),
('Anual'),
('Cuando se requiera'),
('No aplica');
/* 2026-11-08 21:30:59 [43 ms] */ 
INSERT IGNORE INTO idiomas (nombre_idioma)
VALUES
('Español'),
('Inglés'),
('Francés'),
('Portugués'),
('Alemán'),
('Italiano'),
('Bilingüe'),
('Multilingüe');
/* 2026-11-08 21:31:01 [3 ms] */ 
SELECT * FROM idiomas
ORDER BY id_idioma LIMIT 100;
/* 2026-11-08 21:31:31 [48 ms] */ 
INSERT IGNORE INTO idiomas (nombre_idioma)
VALUES
('Español'),
('Inglés'),
('Francés'),
('Portugués'),
('Alemán'),
('Italiano'),
('Bilingüe'),
('Multilingüe');
/* 2026-11-08 21:31:35 [2 ms] */ 
SELECT * FROM idiomas
ORDER BY id_idioma LIMIT 100;
/* 2026-11-08 21:31:36 [5 ms] */ 
INSERT IGNORE INTO medios_conservacion (nombre_medio)
VALUES
('Digital'),
('Físico'),
('Digital y físico'),
('Página web institucional'),
('Repositorio documental'),
('Sistema de información'),
('Enlace externo'),
('Archivo electrónico');
/* 2026-11-08 21:31:39 [3 ms] */ 
SELECT * FROM medios_conservacion
ORDER BY id_medio LIMIT 100;
/* 2026-11-08 21:32:23 [59 ms] */ 
DESCRIBE publicaciones;
/* 2026-11-08 21:32:24 [55 ms] */ 
DESCRIBE auditoria_publicaciones;
/* 2026-11-08 21:47:45 [3 ms] */ 
DROP TRIGGER IF EXISTS trg_auditoria_publicaciones_insert;
/* 2026-11-08 21:47:48 [48 ms] */ 
CREATE TRIGGER trg_auditoria_publicaciones_insert
AFTER INSERT ON publicaciones
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_publicaciones
    (
        id_publicacion,
        accion,
        usuario,
        detalle
    )
    VALUES
    (
        NEW.id_publicacion,
        'INSERT',
        CURRENT_USER(),
        CONCAT('Se registró la publicación: ', NEW.titulo)
    );
END;
/* 2026-11-08 21:47:52 [55 ms] */ 
SHOW TRIGGERS LIKE 'publicaciones';
/* 2026-11-08 21:49:55 [3 ms] */ 
SELECT 'Dependencias' AS tabla, COUNT(*) AS registros FROM dependencias
UNION ALL
SELECT 'Secciones', COUNT(*) FROM secciones
UNION ALL
SELECT 'Formatos', COUNT(*) FROM formatos
UNION ALL
SELECT 'Frecuencias', COUNT(*) FROM frecuencias
UNION ALL
SELECT 'Idiomas', COUNT(*) FROM idiomas
UNION ALL
SELECT 'Medios de conservación', COUNT(*) FROM medios_conservacion LIMIT 100;
/* 2026-11-08 21:50:52 [39 ms] */ 
DESCRIBE publicaciones_formatos;
/* 2026-11-08 21:52:20 [15 ms] */ 
DESCRIBE publicaciones_idiomas;
/* 2026-11-08 21:54:10 [2 ms] */ 
SHOW CREATE TABLE publicaciones;
/* 2026-11-08 21:55:13 [41 ms] */ 
SHOW COLUMNS FROM publicaciones;
/* 2026-11-08 21:56:47 [40 ms] */ 
DESCRIBE publicaciones;
/* 2026-11-08 22:01:46 [2 ms] */ 
SELECT COUNT(*) AS publicaciones_actuales
FROM publicaciones LIMIT 100;
/* 2026-11-08 22:05:25 [3 ms] */ 
SELECT * FROM frecuencias
ORDER BY id_frecuencia LIMIT 100;
/* 2026-11-08 22:07:15 [4 ms] */ 
SELECT id_frecuencia, descripcion_frecuencia
FROM frecuencias
ORDER BY id_frecuencia LIMIT 100;
/* 2026-11-08 22:09:18 [3 ms] */ 
SELECT * FROM frecuencias LIMIT 100;
/* 2026-11-08 22:10:44 [3 ms] */ 
SELECT COUNT(*) AS total_frecuencias
FROM frecuencias LIMIT 100;
/* 2026-11-08 22:11:34 [40 ms] */ 
INSERT INTO frecuencias (descripcion_frecuencia)
VALUES
('Diaria'),
('Semanal'),
('Mensual'),
('Trimestral'),
('Semestral'),
('Anual'),
('Cuando se requiera'),
('No aplica');
/* 2026-11-08 22:11:36 [2 ms] */ 
SELECT * FROM frecuencias
ORDER BY id_frecuencia LIMIT 100;
/* 2026-11-08 22:12:10 [3 ms] */ 
SELECT * FROM medios_conservacion LIMIT 100;
/* 2026-11-08 22:12:28 [4 ms] */ 
SELECT * FROM dependencias LIMIT 100;
/* 2026-11-08 22:13:05 [3 ms] */ 
SELECT * FROM secciones LIMIT 100;
/* 2026-11-08 22:13:40 [4 ms] */ 
SELECT * FROM formatos LIMIT 100;
/* 2026-11-08 22:14:06 [4 ms] */ 
SELECT * FROM idiomas LIMIT 100;
/* 2026-11-08 22:15:00 [3 ms] */ 
SELECT id_seccion, nombre_seccion FROM secciones LIMIT 100;
/* 2026-11-08 22:15:07 [3 ms] */ 
SELECT id_medio, nombre_medio FROM medios_conservacion LIMIT 100;
/* 2026-11-08 22:15:09 [2 ms] */ 
SELECT id_frecuencia, descripcion_frecuencia FROM frecuencias LIMIT 100;
/* 2026-11-08 22:15:11 [2 ms] */ 
SELECT id_dependencia, nombre_dependencia FROM dependencias LIMIT 100;
/* 2026-11-08 22:15:53 [3 ms] */ 
SELECT COUNT(*) AS total_publicaciones
FROM publicaciones LIMIT 100;
/* 2026-11-08 22:16:53 [17 ms] */ 
INSERT INTO publicaciones
(
    titulo,
    fecha_generacion,
    fecha_generacion_original,
    ruta_consulta,
    id_seccion,
    id_medio,
    id_frecuencia,
    id_dependencia_actualizacion
)
VALUES
(
    'Informe de gestión institucional',
    '2026-01-15',
    '15 de enero de 2026',
    'Registro de prueba - informe de gestión',
    (SELECT id_seccion FROM secciones WHERE nombre_seccion = 'Información de la entidad'),
    (SELECT id_medio FROM medios_conservacion WHERE nombre_medio = 'Digital'),
    (SELECT id_frecuencia FROM frecuencias WHERE descripcion_frecuencia = 'Anual'),
    (SELECT id_dependencia FROM dependencias WHERE nombre_dependencia = 'Dirección General')
),
(
    'Plan de acción institucional',
    '2026-02-10',
    '10 de febrero de 2026',
    'Registro de prueba - plan de acción',
    (SELECT id_seccion FROM secciones WHERE nombre_seccion = 'Planeación y presupuesto participativo'),
    (SELECT id_medio FROM medios_conservacion WHERE nombre_medio = 'Digital'),
    (SELECT id_frecuencia FROM frecuencias WHERE descripcion_frecuencia = 'Mensual'),
    (SELECT id_dependencia FROM dependencias WHERE nombre_dependencia = 'Subdirección de Planeación')
),
(
    'Directorio de servidores públicos',
    '2026-03-05',
    '5 de marzo de 2026',
    'Registro de prueba - directorio',
    (SELECT id_seccion FROM secciones WHERE nombre_seccion = 'Información de la entidad'),
    (SELECT id_medio FROM medios_conservacion WHERE nombre_medio = 'Digital'),
    (SELECT id_frecuencia FROM frecuencias WHERE descripcion_frecuencia = 'Anual'),
    (SELECT id_dependencia FROM dependencias WHERE nombre_dependencia = 'Subdirección de Gestión Corporativa')
),
(
    'Presupuesto general de la entidad',
    '2026-04-20',
    '20 de abril de 2026',
    'Registro de prueba - presupuesto',
    (SELECT id_seccion FROM secciones WHERE nombre_seccion = 'Planeación y presupuesto participativo'),
    (SELECT id_medio FROM medios_conservacion WHERE nombre_medio = 'Digital'),
    (SELECT id_frecuencia FROM frecuencias WHERE descripcion_frecuencia = 'Trimestral'),
    (SELECT id_dependencia FROM dependencias WHERE nombre_dependencia = 'Área Financiera')
),
(
    'Información de atención al ciudadano',
    '2026-05-12',
    '12 de mayo de 2026',
    'Registro de prueba - atención al ciudadano',
    (SELECT id_seccion FROM secciones WHERE nombre_seccion = 'Trámites y servicios'),
    (SELECT id_medio FROM medios_conservacion WHERE nombre_medio = 'Página web institucional'),
    (SELECT id_frecuencia FROM frecuencias WHERE descripcion_frecuencia = 'Mensual'),
    (SELECT id_dependencia FROM dependencias WHERE nombre_dependencia = 'Atención al Ciudadano')
);
/* 2026-11-08 22:17:29 [3 ms] */ 
SELECT COUNT(*) AS total_publicaciones
FROM publicaciones LIMIT 100;
/* 2026-11-08 22:17:45 [3 ms] */ 
SELECT COUNT(*) AS total_auditorias
FROM auditoria_publicaciones LIMIT 100;
/* 2026-11-08 22:20:18 [10 ms] */ 
SELECT
    CONCAT(t.tema, ' - Registro ', LPAD(n.numero, 2, '0')),

    DATE_ADD('2024-01-01', INTERVAL n.numero DAY),

    DATE_FORMAT(
        DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
        '%d/%m/%Y'
    ),

    CONCAT(
        'Registro académico de prueba: ',
        t.tema,
        ' - ',
        n.numero
    ),

    (SELECT id_seccion FROM secciones
     WHERE nombre_seccion = t.seccion),

    (SELECT id_medio FROM medios_conservacion
     WHERE nombre_medio = t.medio),

    (SELECT id_frecuencia FROM frecuencias
     WHERE descripcion_frecuencia = t.frecuencia),

    (SELECT id_dependencia FROM dependencias
     WHERE nombre_dependencia = t.dependencia)

FROM
(
    SELECT
        a.d * 100 + b.d * 10 + c.d AS numero
    FROM
        (SELECT 0 d UNION ALL SELECT 1 UNION ALL SELECT 2
         UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6
         UNION ALL SELECT 7 UNION ALL SELECT 8
         UNION ALL SELECT 9) a
    CROSS JOIN
        (SELECT 0 d UNION ALL SELECT 1 UNION ALL SELECT 2
         UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6
         UNION ALL SELECT 7 UNION ALL SELECT 8
         UNION ALL SELECT 9) b
    CROSS JOIN
        (SELECT 0 d UNION ALL SELECT 1 UNION ALL SELECT 2
         UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6
         UNION ALL SELECT 7 UNION ALL SELECT 8
         UNION ALL SELECT 9) c
    WHERE a.d * 100 + b.d * 10 + c.d BETWEEN 1 AND 33
) n

CROSS JOIN
(
    SELECT
        'Informe de gestión institucional' tema,
        'Información de la entidad' seccion,
        'Digital' medio,
        'Anual' frecuencia,
        'Dirección General' dependencia

    UNION ALL SELECT
        'Plan de acción institucional',
        'Planeación y presupuesto participativo',
        'Digital', 'Mensual', 'Subdirección de Planeación'

    UNION ALL SELECT
        'Directorio de servidores públicos',
        'Información de la entidad',
        'Digital', 'Anual', 'Subdirección de Gestión Corporativa'

    UNION ALL SELECT
        'Presupuesto general de la entidad',
        'Planeación y presupuesto participativo',
        'Digital', 'Trimestral', 'Área Financiera'

    UNION ALL SELECT
        'Información de atención al ciudadano',
        'Trámites y servicios',
        'Página web institucional', 'Mensual', 'Atención al Ciudadano'

    UNION ALL SELECT
        'Normatividad vigente de la entidad',
        'Normatividad',
        'Digital', 'Cuando se requiera', 'Oficina Asesora Jurídica'

    UNION ALL SELECT
        'Procesos de contratación pública',
        'Contratación',
        'Digital', 'Cuando se requiera', 'Oficina Jurídica'

    UNION ALL SELECT
        'Datos abiertos del sector turismo',
        'Datos abiertos',
        'Digital', 'Semestral',
        'Subdirección de Inteligencia y Gestión de Tecnologías de la Información'

    UNION ALL SELECT
        'Informe de indicadores turísticos',
        'Información turística',
        'Digital', 'Trimestral',
        'Subdirección de Desarrollo y Competitividad'

    UNION ALL SELECT
        'Estrategia de promoción turística',
        'Información turística',
        'Digital', 'Semestral', 'Subdirección de Mercadeo'

    UNION ALL SELECT
        'Programa de participación ciudadana',
        'Participa',
        'Página web institucional', 'Anual', 'Atención al Ciudadano'

    UNION ALL SELECT
        'Informe de control interno',
        'Control',
        'Digital', 'Semestral', 'Oficina de Control Interno'

    UNION ALL SELECT
        'Plan de comunicaciones institucionales',
        'Información de la entidad',
        'Digital', 'Anual', 'Oficina Asesora de Comunicaciones'

    UNION ALL SELECT
        'Inventario documental institucional',
        'Información de la entidad',
        'Repositorio documental', 'Cuando se requiera', 'Gestión Documental'

    UNION ALL SELECT
        'Servicios y trámites turísticos',
        'Trámites y servicios',
        'Página web institucional', 'Mensual',
        'Subdirección de Desarrollo y Competitividad'
) t LIMIT 100;
/* 2026-11-08 22:21:19 [2 ms] */ 
SELECT COUNT(*) AS total_publicaciones
FROM publicaciones LIMIT 100;
/* 2026-11-08 22:23:07 [51 ms] */ 
INSERT INTO publicaciones
(
    titulo,
    fecha_generacion,
    fecha_generacion_original,
    ruta_consulta,
    id_seccion,
    id_medio,
    id_frecuencia,
    id_dependencia_actualizacion
)
SELECT
    CONCAT('Publicación de transparencia número ', n.numero),
    DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
    DATE_FORMAT(
        DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
        '%d/%m/%Y'
    ),
    CONCAT('Registro académico de prueba ', n.numero),
    (SELECT MIN(id_seccion) FROM secciones),
    (SELECT MIN(id_medio) FROM medios_conservacion),
    (SELECT MIN(id_frecuencia) FROM frecuencias),
    (SELECT MIN(id_dependencia) FROM dependencias)
FROM
(
    SELECT 6 AS numero UNION ALL SELECT 7 UNION ALL SELECT 8
    UNION ALL SELECT 9 UNION ALL SELECT 10
    UNION ALL SELECT 11 UNION ALL SELECT 12
    UNION ALL SELECT 13 UNION ALL SELECT 14
    UNION ALL SELECT 15 UNION ALL SELECT 16
    UNION ALL SELECT 17 UNION ALL SELECT 18
    UNION ALL SELECT 19 UNION ALL SELECT 20
    UNION ALL SELECT 21 UNION ALL SELECT 22
    UNION ALL SELECT 23 UNION ALL SELECT 24
    UNION ALL SELECT 25 UNION ALL SELECT 26
    UNION ALL SELECT 27 UNION ALL SELECT 28
    UNION ALL SELECT 29 UNION ALL SELECT 30
) AS n;
/* 2026-11-08 22:23:42 [15 ms] */ 
SELECT COUNT(*) AS total_publicaciones
FROM publicaciones LIMIT 100;
/* 2026-11-08 22:26:32 [51 ms] */ 
INSERT INTO publicaciones
(
    titulo,
    fecha_generacion,
    fecha_generacion_original,
    ruta_consulta,
    id_seccion,
    id_medio,
    id_frecuencia,
    id_dependencia_actualizacion
)
SELECT
    CONCAT('Publicación de transparencia número ', n.numero),
    DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
    DATE_FORMAT(
        DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
        '%d/%m/%Y'
    ),
    CONCAT('Registro académico de prueba ', n.numero),
    (SELECT MIN(id_seccion) FROM secciones),
    (SELECT MIN(id_medio) FROM medios_conservacion),
    (SELECT MIN(id_frecuencia) FROM frecuencias),
    (SELECT MIN(id_dependencia) FROM dependencias)
FROM
(
    SELECT 56 AS numero UNION ALL SELECT 57 UNION ALL SELECT 58
    UNION ALL SELECT 59 UNION ALL SELECT 60
    UNION ALL SELECT 61 UNION ALL SELECT 62
    UNION ALL SELECT 63 UNION ALL SELECT 64
    UNION ALL SELECT 65 UNION ALL SELECT 66
    UNION ALL SELECT 67 UNION ALL SELECT 68
    UNION ALL SELECT 69 UNION ALL SELECT 70
    UNION ALL SELECT 71 UNION ALL SELECT 72
    UNION ALL SELECT 73 UNION ALL SELECT 74
    UNION ALL SELECT 75 UNION ALL SELECT 76
    UNION ALL SELECT 77 UNION ALL SELECT 78
    UNION ALL SELECT 79 UNION ALL SELECT 80
) AS n;
/* 2026-11-08 22:26:42 [2 ms] */ 
SELECT COUNT(*) AS total_publicaciones
FROM publicaciones LIMIT 100;
/* 2026-11-08 22:27:11 [50 ms] */ 
INSERT INTO publicaciones
(
    titulo,
    fecha_generacion,
    fecha_generacion_original,
    ruta_consulta,
    id_seccion,
    id_medio,
    id_frecuencia,
    id_dependencia_actualizacion
)
SELECT
    CONCAT('Publicación de transparencia número ', n.numero),
    DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
    DATE_FORMAT(
        DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
        '%d/%m/%Y'
    ),
    CONCAT('Registro académico de prueba ', n.numero),
    (SELECT MIN(id_seccion) FROM secciones),
    (SELECT MIN(id_medio) FROM medios_conservacion),
    (SELECT MIN(id_frecuencia) FROM frecuencias),
    (SELECT MIN(id_dependencia) FROM dependencias)
FROM
(
    SELECT 81 AS numero UNION ALL SELECT 82 UNION ALL SELECT 83
    UNION ALL SELECT 84 UNION ALL SELECT 85
    UNION ALL SELECT 86 UNION ALL SELECT 87
    UNION ALL SELECT 88 UNION ALL SELECT 89
    UNION ALL SELECT 90 UNION ALL SELECT 91
    UNION ALL SELECT 92 UNION ALL SELECT 93
    UNION ALL SELECT 94 UNION ALL SELECT 95
    UNION ALL SELECT 96 UNION ALL SELECT 97
    UNION ALL SELECT 98 UNION ALL SELECT 99
    UNION ALL SELECT 100 UNION ALL SELECT 101
    UNION ALL SELECT 102 UNION ALL SELECT 103
    UNION ALL SELECT 104 UNION ALL SELECT 105
) AS n;
/* 2026-11-08 22:27:26 [2 ms] */ 
SELECT COUNT(*) AS total_publicaciones
FROM publicaciones LIMIT 100;
/* 2026-11-08 22:27:55 [56 ms] */ 
INSERT INTO publicaciones
(
    titulo,
    fecha_generacion,
    fecha_generacion_original,
    ruta_consulta,
    id_seccion,
    id_medio,
    id_frecuencia,
    id_dependencia_actualizacion
)
SELECT
    CONCAT('Publicación de transparencia número ', n.numero),
    DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
    DATE_FORMAT(
        DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
        '%d/%m/%Y'
    ),
    CONCAT('Registro académico de prueba ', n.numero),
    (SELECT MIN(id_seccion) FROM secciones),
    (SELECT MIN(id_medio) FROM medios_conservacion),
    (SELECT MIN(id_frecuencia) FROM frecuencias),
    (SELECT MIN(id_dependencia) FROM dependencias)
FROM
(
    SELECT 106 AS numero UNION ALL SELECT 107 UNION ALL SELECT 108
    UNION ALL SELECT 109 UNION ALL SELECT 110
    UNION ALL SELECT 111 UNION ALL SELECT 112
    UNION ALL SELECT 113 UNION ALL SELECT 114
    UNION ALL SELECT 115 UNION ALL SELECT 116
    UNION ALL SELECT 117 UNION ALL SELECT 118
    UNION ALL SELECT 119 UNION ALL SELECT 120
    UNION ALL SELECT 121 UNION ALL SELECT 122
    UNION ALL SELECT 123 UNION ALL SELECT 124
    UNION ALL SELECT 125 UNION ALL SELECT 126
    UNION ALL SELECT 127 UNION ALL SELECT 128
    UNION ALL SELECT 129 UNION ALL SELECT 130
) AS n;
/* 2026-11-08 22:28:05 [2 ms] */ 
SELECT COUNT(*) AS total_publicaciones
FROM publicaciones LIMIT 100;
/* 2026-11-08 22:28:31 [50 ms] */ 
INSERT INTO publicaciones
(
    titulo,
    fecha_generacion,
    fecha_generacion_original,
    ruta_consulta,
    id_seccion,
    id_medio,
    id_frecuencia,
    id_dependencia_actualizacion
)
SELECT
    CONCAT('Publicación de transparencia número ', n.numero),
    DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
    DATE_FORMAT(
        DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
        '%d/%m/%Y'
    ),
    CONCAT('Registro académico de prueba ', n.numero),
    (SELECT MIN(id_seccion) FROM secciones),
    (SELECT MIN(id_medio) FROM medios_conservacion),
    (SELECT MIN(id_frecuencia) FROM frecuencias),
    (SELECT MIN(id_dependencia) FROM dependencias)
FROM
(
    SELECT 131 AS numero UNION ALL SELECT 132 UNION ALL SELECT 133
    UNION ALL SELECT 134 UNION ALL SELECT 135
    UNION ALL SELECT 136 UNION ALL SELECT 137
    UNION ALL SELECT 138 UNION ALL SELECT 139
    UNION ALL SELECT 140 UNION ALL SELECT 141
    UNION ALL SELECT 142 UNION ALL SELECT 143
    UNION ALL SELECT 144 UNION ALL SELECT 145
    UNION ALL SELECT 146 UNION ALL SELECT 147
    UNION ALL SELECT 148 UNION ALL SELECT 149
    UNION ALL SELECT 150 UNION ALL SELECT 151
    UNION ALL SELECT 152 UNION ALL SELECT 153
    UNION ALL SELECT 154 UNION ALL SELECT 155
) AS n;
/* 2026-11-08 22:28:37 [2 ms] */ 
SELECT COUNT(*) AS total_publicaciones
FROM publicaciones LIMIT 100;
/* 2026-11-08 22:29:06 [51 ms] */ 
INSERT INTO publicaciones
(
    titulo,
    fecha_generacion,
    fecha_generacion_original,
    ruta_consulta,
    id_seccion,
    id_medio,
    id_frecuencia,
    id_dependencia_actualizacion
)
SELECT
    CONCAT('Publicación de transparencia número ', n.numero),
    DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
    DATE_FORMAT(
        DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
        '%d/%m/%Y'
    ),
    CONCAT('Registro académico de prueba ', n.numero),
    (SELECT MIN(id_seccion) FROM secciones),
    (SELECT MIN(id_medio) FROM medios_conservacion),
    (SELECT MIN(id_frecuencia) FROM frecuencias),
    (SELECT MIN(id_dependencia) FROM dependencias)
FROM
(
    SELECT 156 AS numero UNION ALL SELECT 157 UNION ALL SELECT 158
    UNION ALL SELECT 159 UNION ALL SELECT 160
    UNION ALL SELECT 161 UNION ALL SELECT 162
    UNION ALL SELECT 163 UNION ALL SELECT 164
    UNION ALL SELECT 165 UNION ALL SELECT 166
    UNION ALL SELECT 167 UNION ALL SELECT 168
    UNION ALL SELECT 169 UNION ALL SELECT 170
    UNION ALL SELECT 171 UNION ALL SELECT 172
    UNION ALL SELECT 173 UNION ALL SELECT 174
    UNION ALL SELECT 175 UNION ALL SELECT 176
    UNION ALL SELECT 177 UNION ALL SELECT 178
    UNION ALL SELECT 179 UNION ALL SELECT 180
) AS n;
/* 2026-11-08 22:29:16 [2 ms] */ 
SELECT COUNT(*) AS total_publicaciones
FROM publicaciones LIMIT 100;
/* 2026-11-08 22:29:40 [46 ms] */ 
INSERT INTO publicaciones
(
    titulo,
    fecha_generacion,
    fecha_generacion_original,
    ruta_consulta,
    id_seccion,
    id_medio,
    id_frecuencia,
    id_dependencia_actualizacion
)
SELECT
    CONCAT('Publicación de transparencia número ', n.numero),
    DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
    DATE_FORMAT(
        DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
        '%d/%m/%Y'
    ),
    CONCAT('Registro académico de prueba ', n.numero),
    (SELECT MIN(id_seccion) FROM secciones),
    (SELECT MIN(id_medio) FROM medios_conservacion),
    (SELECT MIN(id_frecuencia) FROM frecuencias),
    (SELECT MIN(id_dependencia) FROM dependencias)
FROM
(
    SELECT 181 AS numero UNION ALL SELECT 182 UNION ALL SELECT 183
    UNION ALL SELECT 184 UNION ALL SELECT 185
    UNION ALL SELECT 186 UNION ALL SELECT 187
    UNION ALL SELECT 188 UNION ALL SELECT 189
    UNION ALL SELECT 190 UNION ALL SELECT 191
    UNION ALL SELECT 192 UNION ALL SELECT 193
    UNION ALL SELECT 194 UNION ALL SELECT 195
    UNION ALL SELECT 196 UNION ALL SELECT 197
    UNION ALL SELECT 198 UNION ALL SELECT 199
    UNION ALL SELECT 200 UNION ALL SELECT 201
    UNION ALL SELECT 202 UNION ALL SELECT 203
    UNION ALL SELECT 204 UNION ALL SELECT 205
) AS n;
/* 2026-11-08 22:29:47 [2 ms] */ 
SELECT COUNT(*) AS total_publicaciones
FROM publicaciones LIMIT 100;
/* 2026-11-08 22:30:19 [43 ms] */ 
INSERT INTO publicaciones
(
    titulo,
    fecha_generacion,
    fecha_generacion_original,
    ruta_consulta,
    id_seccion,
    id_medio,
    id_frecuencia,
    id_dependencia_actualizacion
)
SELECT
    CONCAT('Publicación de transparencia número ', n.numero),
    DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
    DATE_FORMAT(
        DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
        '%d/%m/%Y'
    ),
    CONCAT('Registro académico de prueba ', n.numero),
    (SELECT MIN(id_seccion) FROM secciones),
    (SELECT MIN(id_medio) FROM medios_conservacion),
    (SELECT MIN(id_frecuencia) FROM frecuencias),
    (SELECT MIN(id_dependencia) FROM dependencias)
FROM
(
    SELECT 206 AS numero UNION ALL SELECT 207 UNION ALL SELECT 208
    UNION ALL SELECT 209 UNION ALL SELECT 210
    UNION ALL SELECT 211 UNION ALL SELECT 212
    UNION ALL SELECT 213 UNION ALL SELECT 214
    UNION ALL SELECT 215 UNION ALL SELECT 216
    UNION ALL SELECT 217 UNION ALL SELECT 218
    UNION ALL SELECT 219 UNION ALL SELECT 220
    UNION ALL SELECT 221 UNION ALL SELECT 222
    UNION ALL SELECT 223 UNION ALL SELECT 224
    UNION ALL SELECT 225 UNION ALL SELECT 226
    UNION ALL SELECT 227 UNION ALL SELECT 228
    UNION ALL SELECT 229 UNION ALL SELECT 230
) AS n;
/* 2026-11-08 22:30:26 [2 ms] */ 
SELECT COUNT(*) AS total_publicaciones
FROM publicaciones LIMIT 100;
/* 2026-11-08 22:31:09 [52 ms] */ 
INSERT INTO publicaciones
(
    titulo,
    fecha_generacion,
    fecha_generacion_original,
    ruta_consulta,
    id_seccion,
    id_medio,
    id_frecuencia,
    id_dependencia_actualizacion
)
SELECT
    CONCAT('Publicación de transparencia número ', n.numero),
    DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
    DATE_FORMAT(DATE_ADD('2024-01-01', INTERVAL n.numero DAY), '%d/%m/%Y'),
    CONCAT('Registro académico de prueba ', n.numero),
    (SELECT MIN(id_seccion) FROM secciones),
    (SELECT MIN(id_medio) FROM medios_conservacion),
    (SELECT MIN(id_frecuencia) FROM frecuencias),
    (SELECT MIN(id_dependencia) FROM dependencias)
FROM
(
    SELECT 231 AS numero UNION ALL SELECT 232 UNION ALL SELECT 233 UNION ALL SELECT 234 UNION ALL SELECT 235
    UNION ALL SELECT 236 UNION ALL SELECT 237 UNION ALL SELECT 238 UNION ALL SELECT 239 UNION ALL SELECT 240
    UNION ALL SELECT 241 UNION ALL SELECT 242 UNION ALL SELECT 243 UNION ALL SELECT 244 UNION ALL SELECT 245
    UNION ALL SELECT 246 UNION ALL SELECT 247 UNION ALL SELECT 248 UNION ALL SELECT 249 UNION ALL SELECT 250
    UNION ALL SELECT 251 UNION ALL SELECT 252 UNION ALL SELECT 253 UNION ALL SELECT 254 UNION ALL SELECT 255
    UNION ALL SELECT 256 UNION ALL SELECT 257 UNION ALL SELECT 258 UNION ALL SELECT 259 UNION ALL SELECT 260
    UNION ALL SELECT 261 UNION ALL SELECT 262 UNION ALL SELECT 263 UNION ALL SELECT 264 UNION ALL SELECT 265
    UNION ALL SELECT 266 UNION ALL SELECT 267 UNION ALL SELECT 268 UNION ALL SELECT 269 UNION ALL SELECT 270
    UNION ALL SELECT 271 UNION ALL SELECT 272 UNION ALL SELECT 273 UNION ALL SELECT 274 UNION ALL SELECT 275
    UNION ALL SELECT 276 UNION ALL SELECT 277 UNION ALL SELECT 278 UNION ALL SELECT 279 UNION ALL SELECT 280
) AS n;
/* 2026-11-08 22:31:17 [2 ms] */ 
SELECT COUNT(*) AS total_publicaciones FROM publicaciones LIMIT 100;
/* 2026-11-08 22:31:40 [52 ms] */ 
INSERT INTO publicaciones
(
    titulo,
    fecha_generacion,
    fecha_generacion_original,
    ruta_consulta,
    id_seccion,
    id_medio,
    id_frecuencia,
    id_dependencia_actualizacion
)
SELECT
    CONCAT('Publicación de transparencia número ', n.numero),
    DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
    DATE_FORMAT(DATE_ADD('2024-01-01', INTERVAL n.numero DAY), '%d/%m/%Y'),
    CONCAT('Registro académico de prueba ', n.numero),
    (SELECT MIN(id_seccion) FROM secciones),
    (SELECT MIN(id_medio) FROM medios_conservacion),
    (SELECT MIN(id_frecuencia) FROM frecuencias),
    (SELECT MIN(id_dependencia) FROM dependencias)
FROM
(
    SELECT 281 AS numero UNION ALL SELECT 282 UNION ALL SELECT 283 UNION ALL SELECT 284 UNION ALL SELECT 285
    UNION ALL SELECT 286 UNION ALL SELECT 287 UNION ALL SELECT 288 UNION ALL SELECT 289 UNION ALL SELECT 290
    UNION ALL SELECT 291 UNION ALL SELECT 292 UNION ALL SELECT 293 UNION ALL SELECT 294 UNION ALL SELECT 295
    UNION ALL SELECT 296 UNION ALL SELECT 297 UNION ALL SELECT 298 UNION ALL SELECT 299 UNION ALL SELECT 300
    UNION ALL SELECT 301 UNION ALL SELECT 302 UNION ALL SELECT 303 UNION ALL SELECT 304 UNION ALL SELECT 305
    UNION ALL SELECT 306 UNION ALL SELECT 307 UNION ALL SELECT 308 UNION ALL SELECT 309 UNION ALL SELECT 310
    UNION ALL SELECT 311 UNION ALL SELECT 312 UNION ALL SELECT 313 UNION ALL SELECT 314 UNION ALL SELECT 315
    UNION ALL SELECT 316 UNION ALL SELECT 317 UNION ALL SELECT 318 UNION ALL SELECT 319 UNION ALL SELECT 320
    UNION ALL SELECT 321 UNION ALL SELECT 322 UNION ALL SELECT 323 UNION ALL SELECT 324 UNION ALL SELECT 325
    UNION ALL SELECT 326 UNION ALL SELECT 327 UNION ALL SELECT 328 UNION ALL SELECT 329 UNION ALL SELECT 330
) AS n;
/* 2026-11-08 22:31:47 [2 ms] */ 
SELECT COUNT(*) AS total_publicaciones FROM publicaciones LIMIT 100;
/* 2026-11-08 22:32:10 [57 ms] */ 
INSERT INTO publicaciones
(
    titulo,
    fecha_generacion,
    fecha_generacion_original,
    ruta_consulta,
    id_seccion,
    id_medio,
    id_frecuencia,
    id_dependencia_actualizacion
)
SELECT
    CONCAT('Publicación de transparencia número ', n.numero),
    DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
    DATE_FORMAT(DATE_ADD('2024-01-01', INTERVAL n.numero DAY), '%d/%m/%Y'),
    CONCAT('Registro académico de prueba ', n.numero),
    (SELECT MIN(id_seccion) FROM secciones),
    (SELECT MIN(id_medio) FROM medios_conservacion),
    (SELECT MIN(id_frecuencia) FROM frecuencias),
    (SELECT MIN(id_dependencia) FROM dependencias)
FROM
(
    SELECT 331 AS numero UNION ALL SELECT 332 UNION ALL SELECT 333 UNION ALL SELECT 334 UNION ALL SELECT 335
    UNION ALL SELECT 336 UNION ALL SELECT 337 UNION ALL SELECT 338 UNION ALL SELECT 339 UNION ALL SELECT 340
    UNION ALL SELECT 341 UNION ALL SELECT 342 UNION ALL SELECT 343 UNION ALL SELECT 344 UNION ALL SELECT 345
    UNION ALL SELECT 346 UNION ALL SELECT 347 UNION ALL SELECT 348 UNION ALL SELECT 349 UNION ALL SELECT 350
    UNION ALL SELECT 351 UNION ALL SELECT 352 UNION ALL SELECT 353 UNION ALL SELECT 354 UNION ALL SELECT 355
    UNION ALL SELECT 356 UNION ALL SELECT 357 UNION ALL SELECT 358 UNION ALL SELECT 359 UNION ALL SELECT 360
    UNION ALL SELECT 361 UNION ALL SELECT 362 UNION ALL SELECT 363 UNION ALL SELECT 364 UNION ALL SELECT 365
    UNION ALL SELECT 366 UNION ALL SELECT 367 UNION ALL SELECT 368 UNION ALL SELECT 369 UNION ALL SELECT 370
    UNION ALL SELECT 371 UNION ALL SELECT 372 UNION ALL SELECT 373 UNION ALL SELECT 374 UNION ALL SELECT 375
    UNION ALL SELECT 376 UNION ALL SELECT 377 UNION ALL SELECT 378 UNION ALL SELECT 379 UNION ALL SELECT 380
) AS n;
/* 2026-11-08 22:32:18 [2 ms] */ 
SELECT COUNT(*) AS total_publicaciones FROM publicaciones LIMIT 100;
/* 2026-11-08 22:32:55 [58 ms] */ 
INSERT INTO publicaciones
(
    titulo,
    fecha_generacion,
    fecha_generacion_original,
    ruta_consulta,
    id_seccion,
    id_medio,
    id_frecuencia,
    id_dependencia_actualizacion
)
SELECT
    CONCAT('Publicación de transparencia número ', n.numero),
    DATE_ADD('2024-01-01', INTERVAL n.numero DAY),
    DATE_FORMAT(DATE_ADD('2024-01-01', INTERVAL n.numero DAY), '%d/%m/%Y'),
    CONCAT('Registro académico de prueba ', n.numero),
    (SELECT MIN(id_seccion) FROM secciones),
    (SELECT MIN(id_medio) FROM medios_conservacion),
    (SELECT MIN(id_frecuencia) FROM frecuencias),
    (SELECT MIN(id_dependencia) FROM dependencias)
FROM
(
    SELECT 381 + (a.d * 100) + (b.d * 10) + c.d AS numero
    FROM
        (SELECT 0 AS d UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
    CROSS JOIN
        (SELECT 0 AS d UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    CROSS JOIN
        (SELECT 0 AS d UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c
) AS n
WHERE n.numero BETWEEN 381 AND 500;
/* 2026-11-08 22:33:02 [26 ms] */ 
SELECT COUNT(*) AS total_publicaciones
FROM publicaciones LIMIT 100;
/* 2026-11-08 22:35:59 [2 ms] */ 
SELECT COUNT(*) AS total_auditorias
FROM auditoria_publicaciones LIMIT 100;
/* 2026-11-08 22:38:12 [30 ms] */ 
SELECT
    p.id_publicacion,
    p.titulo,
    d.nombre_dependencia
FROM publicaciones p
INNER JOIN dependencias d
    ON p.id_dependencia_actualizacion = d.id_dependencia
LIMIT 10;
/* 2026-11-08 22:39:02 [41 ms] */ 
SELECT COUNT(*) AS total_relaciones_formatos
FROM publicaciones_formatos LIMIT 100;
/* 2026-11-08 22:39:40 [2 ms] */ 
SELECT
    p.id_publicacion,
    p.titulo,
    d.nombre_dependencia
FROM publicaciones p
INNER JOIN dependencias d
    ON p.id_dependencia_actualizacion = d.id_dependencia
LIMIT 10;
/* 2026-11-08 22:39:49 [3 ms] */ 
SELECT COUNT(*) AS total_relaciones_formatos
FROM publicaciones_formatos LIMIT 100;
/* 2026-11-08 22:39:53 [50 ms] */ 
INSERT INTO publicaciones_formatos (id_publicacion, id_formato)
SELECT
    p.id_publicacion,
    (SELECT MIN(id_formato) FROM formatos)
FROM publicaciones p;
/* 2026-11-08 22:40:45 [3 ms] */ 
SELECT COUNT(*) AS total_relaciones_formatos
FROM publicaciones_formatos LIMIT 100;
/* 2026-11-08 22:41:31 [50 ms] */ 
INSERT INTO publicaciones_idiomas (id_publicacion, id_idioma)
SELECT
    p.id_publicacion,
    (SELECT MIN(id_idioma) FROM idiomas)
FROM publicaciones p;
/* 2026-11-08 22:41:52 [3 ms] */ 
SELECT COUNT(*) AS total_relaciones_idiomas
FROM publicaciones_idiomas LIMIT 100;
/* 2026-11-08 22:43:18 [28 ms] */ 
SELECT
    p.id_publicacion,
    p.titulo,
    f.nombre_formato,
    i.nombre_idioma
FROM publicaciones p
INNER JOIN publicaciones_formatos pf
    ON p.id_publicacion = pf.id_publicacion
INNER JOIN formatos f
    ON pf.id_formato = f.id_formato
INNER JOIN publicaciones_idiomas pi
    ON p.id_publicacion = pi.id_publicacion
INNER JOIN idiomas i
    ON pi.id_idioma = i.id_idioma
LIMIT 10;
/* 2026-11-08 22:48:39 [46 ms] */ 
CREATE OR REPLACE VIEW vw_detalle_publicaciones AS
SELECT
    p.id_publicacion,
    p.titulo,
    p.fecha_generacion,
    p.fecha_generacion_original,
    p.ruta_consulta,
    s.nombre_seccion,
    d.nombre_dependencia,
    m.nombre_medio,
    fr.descripcion_frecuencia,
    GROUP_CONCAT(DISTINCT fo.nombre_formato SEPARATOR ', ') AS formatos,
    GROUP_CONCAT(DISTINCT i.nombre_idioma SEPARATOR ', ') AS idiomas
FROM publicaciones p
LEFT JOIN secciones s
    ON p.id_seccion = s.id_seccion
LEFT JOIN dependencias d
    ON p.id_dependencia_actualizacion = d.id_dependencia
LEFT JOIN medios_conservacion m
    ON p.id_medio = m.id_medio
LEFT JOIN frecuencias fr
    ON p.id_frecuencia = fr.id_frecuencia
LEFT JOIN publicaciones_formatos pf
    ON p.id_publicacion = pf.id_publicacion
LEFT JOIN formatos fo
    ON pf.id_formato = fo.id_formato
LEFT JOIN publicaciones_idiomas pi
    ON p.id_publicacion = pi.id_publicacion
LEFT JOIN idiomas i
    ON pi.id_idioma = i.id_idioma
GROUP BY
    p.id_publicacion,
    p.titulo,
    p.fecha_generacion,
    p.fecha_generacion_original,
    p.ruta_consulta,
    s.nombre_seccion,
    d.nombre_dependencia,
    m.nombre_medio,
    fr.descripcion_frecuencia;
/* 2026-11-08 22:48:57 [74 ms] */ 
SELECT *
FROM vw_detalle_publicaciones
LIMIT 10;
/* 2026-11-08 22:50:17 [43 ms] */ 
CREATE OR REPLACE VIEW vw_publicaciones_por_dependencia AS
SELECT
    d.id_dependencia,
    d.nombre_dependencia,
    COUNT(p.id_publicacion) AS total_publicaciones
FROM dependencias d
LEFT JOIN publicaciones p
    ON d.id_dependencia = p.id_dependencia_actualizacion
GROUP BY
    d.id_dependencia,
    d.nombre_dependencia;
/* 2026-11-08 22:50:35 [4 ms] */ 
SELECT *
FROM vw_publicaciones_por_dependencia LIMIT 100;
/* 2026-11-08 22:51:00 [41 ms] */ 
CREATE OR REPLACE VIEW vw_publicaciones_por_frecuencia AS
SELECT
    f.id_frecuencia,
    f.descripcion_frecuencia,
    COUNT(p.id_publicacion) AS total_publicaciones
FROM frecuencias f
LEFT JOIN publicaciones p
    ON f.id_frecuencia = p.id_frecuencia
GROUP BY
    f.id_frecuencia,
    f.descripcion_frecuencia;
/* 2026-11-08 22:52:06 [28 ms] */ 
SELECT *
FROM vw_publicaciones_por_frecuencia LIMIT 100;
/* 2026-11-08 22:52:36 [45 ms] */ 
CREATE PROCEDURE sp_consultar_por_dependencia(
    IN p_dependencia_id INT
)
BEGIN
    SELECT
        p.id_publicacion,
        p.titulo,
        d.nombre_dependencia,
        p.fecha_generacion,
        p.ruta_consulta
    FROM publicaciones p
    INNER JOIN dependencias d
        ON p.id_dependencia_actualizacion = d.id_dependencia
    WHERE d.id_dependencia = p_dependencia_id;
END;
/* 2026-11-08 22:52:57 [7 ms] */ 
CALL sp_consultar_por_dependencia(1);
/* 2026-11-08 22:53:44 [3 ms] */ 
SELECT
    id_dependencia_actualizacion,
    COUNT(*) AS total_publicaciones
FROM publicaciones
GROUP BY id_dependencia_actualizacion
ORDER BY id_dependencia_actualizacion LIMIT 100;
/* 2026-11-08 22:54:47 [4 ms] */ 
SELECT
    d.id_dependencia,
    d.nombre_dependencia,
    COUNT(p.id_publicacion) AS total_publicaciones
FROM dependencias d
LEFT JOIN publicaciones p
    ON d.id_dependencia = p.id_dependencia_actualizacion
GROUP BY
    d.id_dependencia,
    d.nombre_dependencia
ORDER BY d.id_dependencia LIMIT 100;
/* 2026-11-08 22:56:19 [2 ms] */ 
SELECT
    id_dependencia_actualizacion,
    COUNT(*) AS total_publicaciones
FROM publicaciones
GROUP BY id_dependencia_actualizacion
ORDER BY id_dependencia_actualizacion LIMIT 100;
/* 2026-11-08 22:59:04 [43 ms] */ 
CREATE FUNCTION fn_total_publicaciones_dependencia(
    p_dependencia_id INT
)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;

    SELECT COUNT(*)
    INTO total
    FROM publicaciones
    WHERE id_dependencia_actualizacion = p_dependencia_id;

    RETURN total;
END;
/* 2026-11-08 22:59:21 [3 ms] */ 
SELECT fn_total_publicaciones_dependencia(1) AS total_publicaciones;
/* 2026-11-08 22:59:44 [63 ms] */ 
CREATE INDEX idx_publicaciones_dependencia
ON publicaciones (id_dependencia_actualizacion);
/* 2026-11-08 22:59:57 [55 ms] */ 
CREATE INDEX idx_publicaciones_fecha
ON publicaciones (fecha_generacion);
/* 2026-11-08 23:00:10 [4 ms] */ 
SHOW INDEX FROM publicaciones;
/* 2026-11-08 23:01:19 [4 ms] */ 
SHOW VARIABLES LIKE 'event_scheduler';
/* 2026-11-08 23:01:56 [2 ms] */ 
SET GLOBAL event_scheduler = ON;
/* 2026-11-08 23:02:04 [3 ms] */ 
SHOW VARIABLES LIKE 'event_scheduler';
/* 2026-11-08 23:02:31 [52 ms] */ 
CREATE TABLE IF NOT EXISTS resumen_publicaciones_diario (
    fecha_resumen DATE PRIMARY KEY,
    total_publicaciones INT NOT NULL
);
/* 2026-11-08 23:03:03 [41 ms] */ 
CREATE EVENT ev_resumen_publicaciones_diario
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
    INSERT INTO resumen_publicaciones_diario
        (fecha_resumen, total_publicaciones)
    VALUES
        (CURDATE(), (SELECT COUNT(*) FROM publicaciones))
    ON DUPLICATE KEY UPDATE
        total_publicaciones = VALUES(total_publicaciones);
/* 2026-11-08 23:03:23 [41 ms] */ 
SHOW EVENTS FROM proyectofinal_entrega2026;
/* 2026-11-08 23:04:22 [41 ms] */ 
SELECT
    EVENT_NAME,
    STATUS,
    EVENT_TYPE,
    INTERVAL_VALUE,
    INTERVAL_FIELD
FROM information_schema.EVENTS
WHERE EVENT_SCHEMA = 'proyectofinal_entrega2026' LIMIT 100;
/* 2026-11-08 23:07:05 [3 ms] */ 
SHOW TABLES;
/* 2026-11-08 23:07:48 [4 ms] */ 
SELECT
    TABLE_NAME,
    TABLE_TYPE
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'proyectofinal_entrega2026'
ORDER BY TABLE_TYPE, TABLE_NAME LIMIT 100;
