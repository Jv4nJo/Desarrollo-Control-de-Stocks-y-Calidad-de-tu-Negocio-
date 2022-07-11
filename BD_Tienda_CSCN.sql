CREATE DATABASE Tienda_CSCN
GO
USE Tienda_CSCN
GO
CREATE TABLE Administrador
(
id_admin TINYINT NOT NULL,
nombre VARCHAR(25) NOT NULL,
contrasenia VARCHAR(50) NOT NULL,

CONSTRAINT pk_idAdmin PRIMARY KEY(id_admin)
)
GO
CREATE TABLE Proveedor
(
id_proveedor TINYINT NOT NULL,
nomProveedor VARCHAR(25) NOT NULL,

CONSTRAINT pk_idProveedor PRIMARY KEY(id_proveedor)
)
GO
CREATE TABLE Producto
(
id_producto TINYINT NOT NULL,
nomProducto VARCHAR(35) NOT NULL,
codigo_barra VARCHAR(14) NOT NULL,
stock_producto FLOAT NOT NULL,
precio_costoProducto FLOAT NOT NULL,
precio_venta FLOAT NOT NULL,
precio_venta2 FLOAT NOT NULL,
id_proveedor TINYINT NOT NULL,

CONSTRAINT pk_idProducto PRIMARY KEY(id_producto),
CONSTRAINT fk_idProveecorP FOREIGN KEY(id_proveedor) REFERENCES Proveedor
)
GO
CREATE TABLE Vendedor
(
id_vendedor TINYINT NOT NULL,
nomUsuario VARCHAR(30) NOT NULL,
nom_vendedor VARCHAR(30) NOT NULL,
permiso_admin BIT NOT NULL,
contrasenia_vendedor VARCHAR(30) NOT NULL,
celular_vendedor TINYINT NULL,

CONSTRAINT pk_idVendedor PRIMARY KEY(id_vendedor)
)
GO
CREATE TABLE Cliente
(
id_cliente TINYINT NOT NULL,
nombre_cliente VARCHAR(30) NOT NULL,
celular_cliente TINYINT NULL,
credito BIT NOT NULL,

CONSTRAINT pk_idCliente PRIMARY KEY(id_cliente)
)
GO
CREATE TABLE Venta
(
id_venta TINYINT NOT NULL,
folio VARCHAR(30) NOT NULL,
id_cliente TINYINT NOT NULL,
id_producto TINYINT NOT NULL,
id_vendedor TINYINT NOT NULL,
total FLOAT NOT NULL,

CONSTRAINT pk_idVenta PRIMARY KEY(id_venta),
CONSTRAINT fk_idClienteV FOREIGN KEY(id_cliente) REFERENCES Cliente,
CONSTRAINT fk_idProductoV FOREIGN KEY(id_producto) REFERENCES Producto,
CONSTRAINT fk_idVendedorV FOREIGN KEY(id_vendedor) REFERENCES Vendedor
)
GO
CREATE TABLE Consulta
(
id_consulta TINYINT NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_cierre DATE NOT NULL,
id_venta TINYINT NOT NULL,

CONSTRAINT pk_idConsulta PRIMARY KEY(id_consulta),
CONSTRAINT fk_idVentaC FOREIGN KEY(id_venta) REFERENCES Venta
)
GO
CREATE TABLE Corte
(
id_corte TINYINT NOT NULL,
ventaTotal FLOAT NOT NULL,
ganancia FLOAT NOT NULL,
id_consulta TINYINT NOT NULL,

CONSTRAINT pk_idCorte PRIMARY KEY(id_corte),
CONSTRAINT fk_idConsulta FOREIGN KEY(id_consulta) REFERENCES Consulta
)
