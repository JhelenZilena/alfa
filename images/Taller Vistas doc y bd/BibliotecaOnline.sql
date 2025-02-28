CREATE TABLE Usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Libros (
    id_libro SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE Prestamos (
    id_prestamo SERIAL PRIMARY KEY,
    id_usuario INT REFERENCES Usuarios(id_usuario),
    id_libro INT REFERENCES Libros(id_libro),
    fecha_prestamo DATE NOT NULL
);


INSERT INTO Usuarios (nombre, correo) VALUES
('Juan Pérez', 'juan.perez@email.com'),
('Ana Gómez', 'ana.gomez@email.com'),
('Carlos López', 'carlos.lopez@email.com'),
('Sofía Ramírez', 'sofia.ramirez@email.com'),
('Diego Torres', 'diego.torres@email.com'),
('Laura Medina', 'laura.medina@email.com'),
('Fernando Castro', 'fernando.castro@email.com'),
('Marta Jiménez', 'marta.jimenez@email.com'),
('Ricardo Sánchez', 'ricardo.sanchez@email.com'),
('Camila Herrera', 'camila.herrera@email.com');


INSERT INTO Libros (titulo, autor, categoria, precio) VALUES
('Cien Años de Soledad', 'Gabriel García Márquez', 'Novela', 25.99),
('El Quijote', 'Miguel de Cervantes', 'Ficción', 19.99),
('1984', 'George Orwell', 'Ciencia Ficción', 15.50),
('Crónica de una Muerte Anunciada', 'Gabriel García Márquez', 'Novela', 18.75),
('Los Juegos del Hambre', 'Suzanne Collins', 'Juvenil', 12.99),
('El Principito', 'Antoine de Saint-Exupéry', 'Fábula', 10.00),
('Orgullo y Prejuicio', 'Jane Austen', 'Romance', 22.00),
('El Hobbit', 'J.R.R. Tolkien', 'Fantasía', 30.50),
('Donde los Árboles Cantan', 'Laura Gallego', 'Juvenil', 17.25),
('Dune', 'Frank Herbert', 'Ciencia Ficción', 28.90);

INSERT INTO Prestamos (id_usuario, id_libro, fecha_prestamo) VALUES
(1, 3, '2024-02-01'),
(2, 1, '2024-02-02'),
(3, 5, '2024-02-03'),
(4, 2, '2024-02-04'),
(5, 7, '2024-02-05'),
(6, 4, '2024-02-06'),
(7, 9, '2024-02-07'),
(8, 6, '2024-02-08'),
(9, 8, '2024-02-09'),
(10, 10, '2024-02-10');


CREATE VIEW Vista_Usuarios AS
SELECT nombre, correo FROM Usuarios;

CREATE VIEW Vista_Libros AS
SELECT titulo, autor, categoria FROM Libros;

CREATE VIEW Vista_Prestamos AS
SELECT u.nombre AS usuario, l.titulo AS libro, p.fecha_prestamo 
FROM Prestamos p
JOIN Usuarios u ON p.id_usuario = u.id_usuario
JOIN Libros l ON p.id_libro = l.id_libro;


DROP VIEW Vista_Usuarios;
CREATE VIEW Vista_Usuarios AS
SELECT id_usuario, nombre, correo FROM Usuarios;

DROP VIEW Vista_Usuarios;


SELECT * FROM Vista_Libros;
SELECT * FROM Vista_Prestamos;
