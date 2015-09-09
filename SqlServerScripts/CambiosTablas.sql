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

--Cambios Giovanni Flores 26 de Junio 2015
ALTER TABLE OrdenesEstimaciones ADD FacturaMantenimiento VARCHAR(50)NOT NULL DEFAULT('') 

--Cambios Giovanni Flores 30 de Junio 2015
ALTER TABLE Volumetrias ADD Cliente CHAR(8) NULL FOREIGN KEY REFERENCES Clientes(ID)

--Cambios Giovanni Flores 1 de Junio 2015
ALTER TABLE OrdenesEstimaciones ADD Cliente CHAR(8) NULL FOREIGN KEY REFERENCES Clientes(ID)

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


ALTER TABLE OrdenesEstimaciones ALTER COLUMN ImporteTotal DECIMAL (30,6)NULL

--Cambios Christian Medina 17 de Agosto 2015
ALTER TABLE VolumetriasD ALTER COLUMN Utilizada DECIMAL(10,3) NULL
ALTER TABLE VolumetriasD ALTER COLUMN Cantidad DECIMAL(10,3) NULL