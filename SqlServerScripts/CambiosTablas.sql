-- Cambio 25 de Enero 2015
-- Cambio 3 de Febreo 2015
ALTER TABLE Revisiones ADD Origen VARCHAR(50) NULL
ALTER TABLE Revisiones ADD OrigenID VARCHAR(50) NULL


--Cambio 16 de Febrero 2015
ALTER TABLE Clientes ALTER COLUMN TelefonoMovil VARCHAR(19) NULL

--Cambio 18 de Febrero 2015
ALTER TABLE Volumetrias ADD Origen VARCHAR(50) NULL
ALTER TABLE Volumetrias ADD OrigenID VARCHAR(50) NULL

--Cambio 18 de Febrero 2015
ALTER TABLE PreciarioConceptos ADD Utilizada DECIMAL(10,2) NULL

--Cambio 21 de Febrero 2015
ALTER TABLE Volumetrias ADD Usuario VARCHAR(50)NOT NULL FOREIGN KEY REFERENCES Usuarios(ID)

--Cambio 21 de Febrero 2015
ALTER TABLE Preciarios ADD Usuario VARCHAR(50)NOT NULL FOREIGN KEY REFERENCES Usuarios(ID)

--Cambio 3 de Marzo 2015
ALTER TABLE PreciarioConceptos ADD ImporteFinal DECIMAL(20,2) NULL 

--Cambio 5 de Marzo 2015
ALTER TABLE PreciarioConceptos ADD Usuario VARCHAR(50)NOT NULL FOREIGN KEY REFERENCES Usuarios(ID)
ALTER TABLE PreciarioCategorias ADD Usuario VARCHAR(50)NOT NULL FOREIGN KEY REFERENCES Usuarios(ID)
ALTER TABLE PreciarioSubCategorias ADD Usuario VARCHAR(50)NOT NULL FOREIGN KEY REFERENCES Usuarios(ID)
ALTER TABLE PreciarioSubSubCategorias ADD Usuario VARCHAR(50)NOT NULL FOREIGN KEY REFERENCES Usuarios(ID)

--Cambio 9 de Marzo 2015
ALTER TABLE SUCURSALES ADD  DireccionZona VARCHAR(50)
ALTER TABLE SUCURSALES DROP COLUMN TerminoContrato

-- Cambios 30 de Marzo 
ALTER TABLE PreciariosGeneralesConceptos ALTER COLUMN CLAVE CHAR(30) NULL
ALTER TABLE PreciariosGeneralesConceptos ADD  MONEDA VARCHAR(30) NULL

--Cambios 31 de Marzo
ALTER TABLE OrdenesEstimaciones ADD  Reporte VARCHAR(30) NULL
ALTER TABLE OrdenesEstimaciones ADD  Division VARCHAR(30) NULL
ALTER TABLE OrdenesEstimaciones ADD  FechaOrigen SMALLDATETIME NULL
ALTER TABLE OrdenesEstimaciones ADD  FechaMaximaAtencion SMALLDATETIME NULL
ALTER TABLE OrdenesEstimaciones ADD  DiasAtencion DECIMAL(5,0) NULL 
ALTER TABLE OrdenesEstimaciones ADD  Reporto VARCHAR(100) NULL
ALTER TABLE OrdenesEstimaciones ADD  TrabajoRequerido VARCHAR(850) NULL
ALTER TABLE OrdenesEstimaciones ADD  Atiende VARCHAR(100) NULL

--Cambios 6 de abril
ALTER TABLE OrdenesEstimacionesD ADD IntExt VARCHAR(30) NULL

--Cambios 10 de Abril
ALTER TABLE OrdenesEstimaciones ADD  TrabajoRealizado VARCHAR(500) NULL
ALTER TABLE OrdenesEstimaciones ADD  CodigoFalla VARCHAR(30) NULL
ALTER TABLE OrdenesEstimaciones ADD  TieneFotos VARCHAR(10) NULL
ALTER TABLE OrdenesEstimaciones ADD  TieneReporte VARCHAR(10) NULL
ALTER TABLE OrdenesEstimaciones ADD  FechaLlegada SMALLDATETIME NULL
ALTER TABLE OrdenesEstimaciones ADD  HoraLlegada datetime NULL
ALTER TABLE OrdenesEstimaciones ADD  FechaFinActividad SMALLDATETIME NULL
ALTER TABLE OrdenesEstimaciones ADD  HoraFinActividad datetime NULL
ALTER TABLE OrdenesEstimaciones ADD  Zona VARCHAR(80) NULL
ALTER TABLE OrdenesEstimaciones ADD  Cuadrilla VARCHAR(200) NULL

--Cambios Giovanni 12 de abril
alter table sucursales drop column codigoPostal

ALTER TABLE Sucursales 
ADD CodigoPostal char(10) NULL 
FOREIGN KEY REFERENCES CodigosPostales(ID)

--Cambios Christian 14 de abril
ALTER TABLE Usuarios ADD  Empresa VARCHAR(200) NULL

--Cambios Giovanni 15 de abril
ALTER TABLE OrdenesEstimaciones DROP COLUMN Cuadrilla
ALTER TABLE OrdenesEstimaciones ADD Cuadrilla CHAR(10) NULL FOREIGN KEY REFERENCES Cuadrillas(ID)

ALTER TABLE dbo.OrdenesEstimaciones
ADD CONSTRAINT fk_OrdenesEstimacionesID
FOREIGN KEY (Cuadrilla) 
REFERENCES dbo.Cuadrillas(ID)

--Cambios Christian 17 de abril
ALTER TABLE OrdenesEstimaciones ADD ImporteTotal DECIMAL (20,2)
ALTER TABLE OrdenesEstimacionesD ADD Moneda VARCHAR(10)

--Cambios Christian 21 de Abril
ALTER TABLE OrdenesEstimaciones DROP COLUMN Zona 

--Cambios Christian 04 de Mayo
ALTER TABLE OrdenesEstimaciones DROP COLUMN Atiende 
ALTER TABLE GeneradorOrdenEstimacionD DROP COLUMN Numero 
ALTER TABLE GeneradorVolumetriaD DROP COLUMN Numero 
--Cambios Giovanni Flores 06 de Mayo
ALTER TABLE OrdenesEstimaciones ADD HoraOrigen DATETIME NULL
--Cambios Giovanni Flores 07 de Mayo
ALTER TABLE OrdenesEstimaciones ADD RutaImagen VARCHAR(500) NULL

--Cambios Christian 15 de Mayo 2015
ALTER TABLE OrdenesEstimaciones DROP COLUMN TieneFotos 
ALTER TABLE OrdenesEstimaciones DROP COLUMN TieneReporte 

--Cambios Giovanni Flores 18 de Mayo 2015
ALTER TABLE OrdenesEstimaciones ADD Atendido VARCHAR(5) NULL

--Cambios Giovanni Flores 18 de Mayo 2015
ALTER TABLE OrdenesEstimaciones ADD MovEnLinea BIT NULL

--Cambios Giovanni Flores 21 de Mayo 2015
ALTER TABLE ImagenesOrdenEstimacionD ALTER COLUMN Nombre VARCHAR(500) NOT NULL
ALTER TABLE FacturasOrdenEstimacionD ALTER COLUMN Nombre VARCHAR(500) NOT NULL
ALTER TABLE CroquisOrdenEstimacionD ALTER COLUMN Nombre VARCHAR(500) NOT NULL

--Cambios Giovanni Flores 26 de Mayo 2015
ALTER TABLE GeneradorOrdenEstimacionD ADD Plano CHAR(20) NULL

--Cambios Giovanni Flores 27 de Mayo 2015
ALTER TABLE OrdenesEstimaciones ADD NoOrden CHAR(3) NULL

--Cambios Giovanni Flores 29 de Mayo 2015
ALTER TABLE OrdenesEstimaciones ADD ReferenciaOrden VARCHAR(90) NULL

--Cambios Giovanni Flores 01 de Junio 2015
ALTER TABLE OrdenesEstimaciones ADD Facturado BIT NOT NULL DEFAULT (0)

--Cambios Giovanni Flores 03 de Junio 2015
ALTER TABLE OrdenesEstimaciones ADD Clasificacion VARCHAR(25) NOT NULL DEFAULT('')

--Cambios Giovanni Flores 03 de Junio 2015
ALTER TABLE OrdenesEstimaciones ADD Revisado BIT NOT  NULL DEFAULT (0)

--Cambios Giovanni Flores 25 de Junio 2015
ALTER TABLE Clientes ADD RutaLogo VARCHAR(500) NOT NULL DEFAULT('')

--Cambios Giovanni Flores 26 de Junio 2015
ALTER TABLE OrdenesEstimaciones ADD FacturaMantenimiento VARCHAR(50)NOT NULL DEFAULT('') 

--Cambios Giovanni Flores 30 de Junio 2015
ALTER TABLE Volumetrias ADD Cliente CHAR(8) NULL FOREIGN KEY REFERENCES Clientes(ID)

--Cambios Giovanni Flores 1 de Junio 2015
ALTER TABLE OrdenesEstimaciones ADD Cliente CHAR(8) NULL FOREIGN KEY REFERENCES Clientes(ID)

--Cambios Giovanni Flores 2 de Junio 2015
ALTER TABLE Sucursales ADD TipoConcepto VARCHAR(50) NULL
ALTER TABLE Sucursales ADD EmpresaSupervisora VARCHAR(50) NULL
ALTER TABLE Sucursales ADD TipoObra VARCHAR(50) NULL
 
--Cambios Giovanni Flores 3 de Junio 2015
ALTER TABLE dbo.Clientes DROP COLUMN Empresa ;
ALTER TABLE dbo.Clientes DROP COLUMN EmpresaCalle ;
ALTER TABLE dbo.Clientes DROP COLUMN EmpresaNoExterior ;
ALTER TABLE dbo.Clientes DROP COLUMN EmpresaNoInterior ;
ALTER TABLE dbo.Clientes DROP COLUMN EmpresaColonia ;
ALTER TABLE dbo.Clientes DROP CONSTRAINT FK__Clientes__Empres__4DE98D56; 
ALTER TABLE dbo.Clientes DROP COLUMN EmpresaEstado ; 
ALTER TABLE dbo.Clientes DROP CONSTRAINT FK__Clientes__Empres__4EDDB18F; 
ALTER TABLE dbo.Clientes DROP COLUMN EmpresaMunicipio ;
ALTER TABLE dbo.Clientes DROP COLUMN EmpresaCodigoPostal ;
ALTER TABLE dbo.Clientes DROP COLUMN EmpresaEntreCalles ;
ALTER TABLE dbo.Clientes DROP COLUMN EmpresaTelefonoExt ;
ALTER TABLE dbo.Clientes DROP COLUMN EmpresaTelefono ;
ALTER TABLE dbo.Clientes DROP COLUMN Puesto ;
ALTER TABLE dbo.Clientes DROP COLUMN TipoSocio ;
ALTER TABLE dbo.Clientes DROP COLUMN NumeroSocio ;
--Cambios Giovanni Flores 7 de Junio 2015
ALTER TABLE dbo.Clientes DROP COLUMN RFC;
ALTER TABLE dbo.Clientes DROP COLUMN CURP;
ALTER TABLE dbo.Clientes DROP COLUMN FechaNacimiento;
ALTER TABLE dbo.Clientes DROP COLUMN Sexo;
ALTER TABLE dbo.Clientes DROP COLUMN EstadoCivil;
ALTER TABLE dbo.Clientes DROP CONSTRAINT FK__Clientes__Profes__51BA1E3A; 
ALTER TABLE dbo.Clientes DROP COLUMN Profesion;
ALTER TABLE dbo.Clientes DROP COLUMN Edad;
ALTER TABLE dbo.Clientes DROP COLUMN CodigoPostal; 
ALTER TABLE dbo.Clientes ADD CodigoPostal CHAR(10) NULL FOREIGN KEY REFERENCES dbo.CodigosPostales(ID)
ALTER TABLE dbo.Clientes DROP CONSTRAINT FK__Clientes__Estado__4FD1D5C8; 
ALTER TABLE dbo.Clientes DROP COLUMN Estado; 
ALTER TABLE dbo.Clientes DROP CONSTRAINT FK__Clientes__Munici__50C5FA01; 
ALTER TABLE dbo.Clientes DROP COLUMN Municipio; 


--Cambios Giovanni Flores 8 de Junio 2015
ALTER TABLE dbo.Sucursales ADD Cliente CHAR(8) NULL FOREIGN KEY REFERENCES dbo.Clientes(ID)

--Cambios Giovanni Flores 9 de Junio 2015
ALTER TABLE PreciariosGeneralesConceptos ALTER COLUMN CLAVE VARCHAR(50) NULL
  
--Cambios Christian Medina 17/07/2015
ALTER TABLE OrdenesEstimaciones ALTER COLUMN Observaciones VARCHAR(800) NULL	 

--Cambios Giovanni Flores 17 de Junio 2015
ALTER TABLE PreciariosGenerales ADD Cliente CHAR(8) NULL FOREIGN KEY REFERENCES dbo.Clientes(ID)

--Cambios Giovanni Flores 17 de Junio 2015
ALTER TABLE Preciarios ADD Cliente CHAR(8) NULL FOREIGN KEY REFERENCES dbo.Clientes(ID)
ALTER TABLE OrdenesEstimacionesD ALTER COLUMN Cantidad DECIMAL(10,6) NOT NULL
ALTER TABLE OrdenesEstimacionesD ALTER COLUMN Precio DECIMAL(30,6) NOT NULL
ALTER TABLE OrdenesEstimacionesD ALTER COLUMN Importe DECIMAL(30,6) NOT NULL

ALTER TABLE GeneradorOrdenEstimacionD ALTER COLUMN Cantidad DECIMAL(10,6) NOT NULL
ALTER TABLE GeneradorOrdenEstimacionD ALTER COLUMN Total DECIMAL(10,6) NOT NULL 


--Cambios Christian Medina 20 de Julio 2015
ALTER TABLE GeneradorOrdenEstimacionD ALTER COLUMN Largo DECIMAL(10,6) NOT NULL
ALTER TABLE GeneradorOrdenEstimacionD ALTER COLUMN Ancho DECIMAL(10,6) NOT NULL 
ALTER TABLE GeneradorOrdenEstimacionD ALTER COLUMN Alto DECIMAL(10,6) NOT NULL 

--Cambios Christian Medina 23 de Julio 2015
ALTER TABLE VolumetriasD ALTER COLUMN Cantidad DECIMAL(10,3) NOT NULL
ALTER TABLE VolumetriasD ALTER COLUMN Utilizada DECIMAL(10,3) NOT NULL 

ALTER TABLE GeneradorVolumetriaD ALTER COLUMN Largo DECIMAL(10,3) NOT NULL
ALTER TABLE GeneradorVolumetriaD ALTER COLUMN Ancho DECIMAL(10,3) NOT NULL 
ALTER TABLE GeneradorVolumetriaD ALTER COLUMN Alto DECIMAL(10,3) NOT NULL 

ALTER TABLE GeneradorVolumetriaD ALTER COLUMN Cantidad DECIMAL(10,3) NOT NULL
ALTER TABLE GeneradorVolumetriaD ALTER COLUMN Total DECIMAL(10,3) NOT NULL 

--Cambios Giovanni Flores 27 de Julio 2015
ALTER TABLE ImagenesVolumetriasD ALTER COLUMN Nombre VARCHAR(500) NOT NULL


--Cambios Christian Medina 30 de Julio 2015

ALTER TABLE OrdenesEstimacionesD ALTER COLUMN Cantidad DECIMAL(20,6) NULL
ALTER TABLE OrdenesEstimacionesD ALTER COLUMN Importe DECIMAL (30,6)NULL