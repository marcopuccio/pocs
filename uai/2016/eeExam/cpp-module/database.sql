/* Check for schema, delete and create new one*/
DROP DATABASE IF EXISTS `UAI`;
CREATE SCHEMA UAI ;


/* Create Table */
CREATE  TABLE UAI.Alumno (
  legajo_alumno INT NOT NULL,
  nombre_alumno NVARCHAR(50) NOT NULL,
  apellido_alumno NVARCHAR(50) NOT NULL,
  documento_alumno INT NOT NULL
);


/* INIT DATA */
INSERT INTO UAI.Alumno
(
    legajo_alumno,
    nombre_alumno,
    apellido_alumno,
    documento_alumno
)
VALUES 
(
    1,
    'John',
    'Doe',
    35111111
);

INSERT INTO UAI.Alumno
(
    legajo_alumno,
    nombre_alumno,
    apellido_alumno,
    documento_alumno
)
VALUES 
(
    1,
    'Foo',
    'Bar',
    35222222
);

INSERT INTO UAI.Alumno
(
    legajo_alumno,
    nombre_alumno,
    apellido_alumno,
    documento_alumno
)
VALUES 
(
    1,
    'Darth',
    'Vader',
    35333333
);

