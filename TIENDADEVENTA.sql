
CREATE DATABASE TIENDADEVENTA


CREATE TABLE PERSONA (
    idpersona INT PRIMARY KEY,
    nombre VARCHAR(255),
    apellidos VARCHAR(255)
);



CREATE TABLE CLIENTE (
    idcliente INT PRIMARY KEY,
    idpersona INT,
    ci VARCHAR(255),
    telefono VARCHAR(255),
    correo VARCHAR(255),
    estado VARCHAR(255),
    tipocliente VARCHAR(255),
    FOREIGN KEY (idpersona) REFERENCES PERSONA(idpersona)
);



CREATE TABLE DETALLEVENT (
    eventoiddetallevent INT PRIMARY KEY,
    ci VARCHAR(255),
    telefono VARCHAR(255),
    correo VARCHAR(255),
    estado VARCHAR(255),
    tipocliente VARCHAR(255),
    idventa INT,
    codigoclie INT,
    idproducto INT,
    cantidad INT,
    FOREIGN KEY (idventa) REFERENCES VENTA(idventa),
    FOREIGN KEY (idproducto) REFERENCES PRODUCTO(idproducto)
);



CREATE TABLE PRODUCTO (
    idproducto INT PRIMARY KEY,
    idtipoprod INT,
    nombre VARCHAR(255),
    estado VARCHAR(255),
    precioventa DECIMAL(10, 2),
    FOREIGN KEY (idtipoprod) REFERENCES TIPOPROD(idtipoprod)
);



CREATE TABLE TIPOPROD (
    idtipoprod INT PRIMARY KEY,
    nombre VARCHAR(255),
    estado VARCHAR(255)
);



CREATE TABLE MARCA (
    idmarca INT PRIMARY KEY,
    nombre VARCHAR(255),
    estado VARCHAR(255)
);



CREATE TABLE VENTA (
    codigobarra INT PRIMARY KEY,
    idmarca INT,
    idusuario INT,
    idcliente INT,
    unidad VARCHAR(255),
    estado VARCHAR(255),
    fecha DATE,
    FOREIGN KEY (idmarca) REFERENCES MARCA(idmarca),
    FOREIGN KEY (idusuario) REFERENCES USUARIO(idusuario),
    FOREIGN KEY (idcliente) REFERENCES CLIENTE(idcliente)
);



CREATE TABLE USUARIO (
    idusuario INT PRIMARY KEY,
    idcliente INT,
    nombre VARCHAR(255),
    vendedor VARCHAR(255),
    FOREIGN KEY (idcliente) REFERENCES CLIENTE(idcliente)
);



CREATE TABLE DETALLE (
    iddetalle INT PRIMARY KEY,
    descripcion VARCHAR(255),
    nombreusuario VARCHAR(255),
    fecha DATE,
    iddetallando INT,
    estado VARCHAR(255),
    FOREIGN KEY (iddetallando) REFERENCES DETALLEVENT(eventoiddetallevent)
);



CREATE TABLE PROVEE (
    cantidad INT,
    IDPROBAR INT,
    FOREIGN KEY (IDPROBAR) REFERENCES PROVEEDOR(idproveedor)
);



CREATE TABLE USUARIOROL (
    idusuariorol INT PRIMARY KEY,
    idusuario INT,
    idrol INT,
    FOREIGN KEY (idusuario) REFERENCES USUARIO(idusuario),
    FOREIGN KEY (idrol) REFERENCES ROL(idrol)
);



CREATE TABLE INGRESO (
    idingreso INT PRIMARY KEY,
    fecha DATE,
    fechavenc DATE,
    estado VARCHAR(255)
);



CREATE TABLE PROVEEDOR (
    idproveedor INT PRIMARY KEY,
    nombre VARCHAR(255),
    fechaingreso DATE,
    telefono VARCHAR(255),
    total DECIMAL(10, 2),
    estado VARCHAR(255),
    direccion VARCHAR(255)
);



CREATE TABLE ROL (
    idrol INT PRIMARY KEY,
    nombre VARCHAR(255),
    estado VARCHAR(255)
);
