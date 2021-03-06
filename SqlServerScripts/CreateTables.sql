CREATE TABLE Estados(
	ID							CHAR(2)			NOT NULL PRIMARY KEY,
	Abreviatura					VARCHAR(6)		NULL,
	Descripcion					VARCHAR(50)		NULL
)

CREATE TABLE Municipios(
	ID							CHAR(4)			NOT NULL PRIMARY KEY,
	Descripcion					VARCHAR(100)	NULL,
	Estado						CHAR(2)			NOT NULL FOREIGN KEY REFERENCES Estados(ID)
)

CREATE TABLE Colonias(
	ID							CHAR(10)		NOT NULL PRIMARY KEY,
	Descripcion					VARCHAR(100)	NULL,
	Estado						CHAR(2)			NOT NULL FOREIGN KEY REFERENCES Estados(ID),
	Municipio					CHAR(4)			NOT NULL FOREIGN KEY REFERENCES Municipios(ID)
)

CREATE TABLE CodigosPostales(
	ID							CHAR(10)		NOT NULL PRIMARY KEY,
	Estado						CHAR(2)			NOT NULL FOREIGN KEY REFERENCES Estados(ID),
	Municipio					CHAR(4)			NOT NULL FOREIGN KEY REFERENCES Municipios(ID),
	Colonia						CHAR(10)		NOT NULL FOREIGN KEY REFERENCES Colonias(ID),
	Numero						INT				NULL
)

CREATE TABLE Usuarios(
	ID							VARCHAR(50)		NOT NULL PRIMARY KEY,
	Correo						VARCHAR(50)		NOT NULL,
	Nombre						VARCHAR(50)		NULL,
	APaterno					VARCHAR(50)		NULL,
	AMaterno					VARCHAR(50)		NULL,
	Contrasena					VARCHAR(200)	NULL,
	Empresa						VARCHAR(200)	NULL,
	Estatus						VARCHAR(50)		NOT NULL,
	Bloqueado					BIT				NOT NULL,
	EnLinea						BIT				NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL,
	FechaBloqueo				SMALLDATETIME	NULL,
	UltimoAcceso				SMALLDATETIME	NULL,
	CambioContrasena			SMALLDATETIME	NULL
)

CREATE TABLE Proveedores(
	ID							CHAR(7)			NOT NULL PRIMARY KEY,
	Nombre						VARCHAR(50)		NOT NULL,
	RutaLogo					VARCHAR(500)	NULL,
	RFC							VARCHAR(15)		NULL,
	ContactoNombre				VARCHAR(50)		NULL,
	ContactoAPaterno			VARCHAR(50)		NULL,
	ContactoAMaterno			VARCHAR(50)		NULL,
	Correo						VARCHAR(100)	NULL,
	Calle						VARCHAR(100)	NULL,
	EntreCalles					VARCHAR(100)	NULL,
	NoExterior					VARCHAR(10)		NULL,
	NoInterior					VARCHAR(10)		NULL,
	CodigoPostal				INT				NULL,
	Colonia						VARCHAR(50)		NULL,
	Estado						CHAR(2)			NULL FOREIGN KEY REFERENCES Estados(ID),
	Municipio					CHAR(4)			NULL FOREIGN KEY REFERENCES Municipios(ID)
)

CREATE TABLE Clientes(
	ID							CHAR(8)			NOT NULL PRIMARY KEY,
	Nombre						VARCHAR(50)		NULL,
	APaterno					VARCHAR(50)		NULL,
	AMaterno					VARCHAR(50)		NULL,
	RutaLogo					VARCHAR(500)	NOT NULL DEFAULT(''),
	Correo						VARCHAR(100)	NULL,
	Telefono					VARCHAR(15)		NULL,
	TelefonoMovil				VARCHAR(19)		NULL,
	Calle						VARCHAR(100)	NULL,
	NoExterior					VARCHAR(10)		NULL,
	NoInterior					VARCHAR(10)		NULL,
	Colonia						VARCHAR(50)		NULL,
	CodigoPostal				CHAR(10)		NULL FOREIGN KEY REFERENCES CodigosPostales(ID),
	EntreCalles					VARCHAR(100)	NULL,
	Elaboro						VARCHAR(100)	NULL,
	Reviso						VARCHAR(100)	NULL,
	Autorizo					VARCHAR(100)	NULL,
	Proveedor					CHAR(7)			NULL FOREIGN KEY REFERENCES Proveedores(ID),
	FechaAlta					SMALLDATETIME	NULL,
	Estatus						VARCHAR(20)		NULL,
	Usuario						VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID)
)

CREATE TABLE Sucursales(
	ID							CHAR(10)		NOT NULL PRIMARY KEY,
	CR							SMALLINT		NOT NULL,
	DireccionZona				VARCHAR(50)		NULL,
	Nombre						VARCHAR(100)	NULL,
	GerenteBBVANombre			VARCHAR(50)		NULL,
	GerenteBBVAAPaterno			VARCHAR(50)		NULL,
	GerenteBBVAAMaterno			VARCHAR(50)		NULL,
	SupervisorNombre			VARCHAR(50)		NULL,
	SupervisorAPaterno			VARCHAR(50)		NULL,
	SupervisorAMaterno			VARCHAR(50)		NULL,
	ProveedorEnergia			VARCHAR(100)	NULL,
	Superficie					INT				NULL,
	CoordinadorNombre			VARCHAR(50)		NULL,
	CoordinadorAPaterno			VARCHAR(50)		NULL,
	CoordinadorAMaterno			VARCHAR(50)		NULL,
	Calle						VARCHAR(100)	NULL,
	EntreCalles					VARCHAR(100)	NULL,
	NoExterior					VARCHAR(10)		NULL,
	NoInterior					VARCHAR(10)		NULL,
	CodigoPostal				CHAR(10)		NULL		FOREIGN KEY REFERENCES CodigosPostales(ID),
	Colonia						VARCHAR(50)		NULL,
	Estado						CHAR(2)			NULL	FOREIGN KEY REFERENCES Estados(ID),
	Municipio					CHAR(4)			NULL	FOREIGN KEY REFERENCES Municipios(ID),
	Contratista					VARCHAR(100)	NULL,
	InicioObra					DATE			NULL,
	FinObra						DATE			NULL,
	SemanasObra					SMALLINT		NULL,
	TipoConcepto				VARCHAR(50)		NULL,
	EmpresaSupervisora			VARCHAR(50)		NULL,
	TipoObra					VARCHAR(50)		NULL,
	Cliente						CHAR(8)			NULL		FOREIGN KEY REFERENCES Clientes(ID),
	FechaAlta					SMALLDATETIME	NULL,
	Estatus						VARCHAR(50)		NULL
)

CREATE TABLE Preciarios(
	ID							CHAR(7)			NOT NULL	PRIMARY KEY,
	Descripcion					VARCHAR(50)		NOT NULL,
	Sucursal					CHAR(10)		NOT NULL	FOREIGN KEY REFERENCES Sucursales(ID),
	Archivo						VARCHAR(200)	NOT NULL,
	Cliente						CHAR(8)			NULL		FOREIGN KEY REFERENCES Clientes(ID),
	Usuario						VARCHAR(50)		NOT NULL	FOREIGN KEY REFERENCES Usuarios(ID),
	Estatus						VARCHAR(20)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE PreciarioCategorias(
	ID							CHAR(10)		NOT NULL PRIMARY KEY,
	CLAVE						CHAR(7)			NULL,
	Preciario					CHAR(7)			NOT NULL FOREIGN KEY REFERENCES Preciarios(ID),
	Descripcion					VARCHAR(500)	NOT NULL,
	Usuario						VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
	Estatus						VARCHAR(20)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE PreciarioSubCategorias(
	ID							CHAR(10)		NOT NULL PRIMARY KEY,
	CLAVE						CHAR(7)			NULL,
	Preciario					CHAR(7)			NOT NULL FOREIGN KEY REFERENCES Preciarios(ID),
	Descripcion					VARCHAR(500)	NOT NULL,
	Categoria					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciarioCategorias(ID),
	Usuario						VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
	Estatus						VARCHAR(20)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE PreciarioSubSubCategorias(
	ID							CHAR(10)		NOT NULL PRIMARY KEY,
	CLAVE						CHAR(7)			NULL,
	Preciario					CHAR(7)			NOT NULL FOREIGN KEY REFERENCES Preciarios(ID),
	Descripcion					VARCHAR(500)	NOT NULL,
	Categoria					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciarioCategorias(ID),
	SubCategoria				CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciarioSubCategorias(ID),
	Usuario						VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
	Estatus						VARCHAR(20)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE PreciarioConceptos(
	ID							CHAR(10)		NOT NULL PRIMARY KEY,
	CLAVE						CHAR(7)			NULL,
	Preciario					CHAR(7)			NOT NULL FOREIGN KEY REFERENCES Preciarios(ID),
	Descripcion					VARCHAR(2000)	NOT NULL,
	Categoria					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciarioCategorias(ID),
	SubCategoria				CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciarioSubCategorias(ID),
	SubSubCategoria				CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciarioSubSubCategorias(ID),
	Unidad						VARCHAR(30)		NULL,
	Costo						DECIMAL(20,2)	NULL,
	Cantidad					DECIMAL(10,2)	NULL,
	Utilizada					DECIMAL(10,2)	NULL,
	Importe						DECIMAL(20,2)	NULL,
	ImporteFinal				DECIMAL(20,2)	NULL,
	Usuario						VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
	Estatus						VARCHAR(20)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE PreciariosGenerales(
	ID							CHAR(7)			NOT NULL	PRIMARY KEY,
	Descripcion					VARCHAR(50)		NOT NULL,
	TipoObra					BIT,
	TipoMantenimiento			BIT,
	Archivo						VARCHAR(200)	NOT NULL,
	Cliente						CHAR(8)			NULL		FOREIGN KEY REFERENCES Clientes(ID),
	Usuario						VARCHAR(50)		NOT NULL	FOREIGN KEY REFERENCES Usuarios(ID),
	Estatus						VARCHAR(20)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE PreciariosGeneralesCategorias(
	ID							CHAR(10)		NOT NULL PRIMARY KEY,
	Clave						VARCHAR(7)		NULL,
	Preciario					CHAR(7)			NOT NULL FOREIGN KEY REFERENCES PreciariosGenerales(ID),
	Descripcion					VARCHAR(500)	NOT NULL,
	Usuario						VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
	Estatus						VARCHAR(20)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE PreciariosGeneralesSubCategorias(
	ID							CHAR(10)		NOT NULL PRIMARY KEY,
	CLAVE						CHAR(7)			NULL,
	Preciario					CHAR(7)			NOT NULL FOREIGN KEY REFERENCES PreciariosGenerales(ID),
	Descripcion					VARCHAR(500)	NOT NULL,
	Categoria					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesCategorias(ID),
	Usuario						VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
	Estatus						VARCHAR(20)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE PreciariosGeneralesSubSubCategorias(
	ID							CHAR(10)		NOT NULL PRIMARY KEY,
	CLAVE						CHAR(7)			NULL,
	Preciario					CHAR(7)			NOT NULL FOREIGN KEY REFERENCES PreciariosGenerales(ID),
	Descripcion					VARCHAR(500)	NOT NULL,
	Categoria					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesCategorias(ID),
	SubCategoria				CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesSubCategorias(ID),
	Usuario						VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
	Estatus						VARCHAR(20)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE PreciariosGeneralesConceptos(
	ID							CHAR(10)		NOT NULL PRIMARY KEY,
	CLAVE						CHAR(50)		NULL,
	Preciario					CHAR(7)			NOT NULL FOREIGN KEY REFERENCES PreciariosGenerales(ID),
	Descripcion					VARCHAR(2000)	NOT NULL,
	Categoria					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesCategorias(ID),
	SubCategoria				CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesSubCategorias(ID),
	SubSubCategoria				CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesSubSubCategorias(ID),
	MONEDA						VARCHAR(30)		NULL,
	Unidad						VARCHAR(30)		NULL,
	Costo						DECIMAL(20,2)	NULL,
	Cantidad					DECIMAL(10,2)	NULL,
	Usuario						VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
	Estatus						VARCHAR(20)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE Volumetrias(
	ID							INT				IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Mov							VARCHAR(50)		NOT NULL,
	MovID						VARCHAR(10)		NULL,
	Sucursal					CHAR(10)		NOT NULL	FOREIGN KEY REFERENCES Sucursales(ID),
	FechaEmision				SMALLDATETIME	NULL,
	Observaciones				VARCHAR(200)	NULL,
	Estatus						VARCHAR(20)		NOT NULL,
	Preciario					CHAR(7)			NOT NULL	FOREIGN KEY REFERENCES Preciarios(ID),
	Origen						VARCHAR(50)		NULL,
	OrigenID					VARCHAR(50)		NULL,
	Usuario						VARCHAR(50)		NOT NULL	FOREIGN KEY REFERENCES Usuarios(ID),
	Cliente						CHAR(8)			NULL		FOREIGN KEY REFERENCES Clientes(ID)
)

CREATE TABLE VolumetriasD(
	Volumetria					INT				NOT NULL FOREIGN KEY REFERENCES Volumetrias(ID),
	Renglon						SMALLINT		NOT NULL,
	ConceptoID					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciarioConceptos(ID),
	Cantidad					DECIMAL(10,3)	NULL,
	Utilizada					DECIMAL(10,3)	NULL,
	Fotos						VARCHAR(200)	NULL
)

CREATE TABLE ImagenesVolumetriasD(
	Volumetria					INT				NOT NULL FOREIGN KEY REFERENCES Volumetrias(ID),
	PreciarioConcepto			CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciarioConceptos(ID),
	Nombre						VARCHAR(500)	NOT NULL,
	Direccion					VARCHAR(500)	NOT NULL,
	Usuario						VARCHAR(50)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE GeneradorVolumetriaD(
	MovID						INT				NOT NULL FOREIGN KEY REFERENCES Volumetrias(ID),
	ConceptoID					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciarioConceptos(ID),
	Descripcion					VARCHAR(500)	NULL,
	Eje							VARCHAR(50)		NULL,
	EntreEje1					VARCHAR(50)		NULL,
	EntreEje2					VARCHAR(50)		NULL,
	Area						VARCHAR(500)	NULL,
	Largo						DECIMAL(10,3)	NOT NULL,
	Ancho						DECIMAL(10,3)	NOT NULL,
	Alto						DECIMAL(10,3)	NOT NULL,
	Cantidad					DECIMAL(10,3)	NOT NULL,
	Total						DECIMAL(10,3)	NOT NULL
)

CREATE TABLE CroquisVolumetriaD(
	MovID						INT				NOT NULL FOREIGN KEY REFERENCES Volumetrias(ID),
	Concepto					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesConceptos(ID),
	Nombre						VARCHAR(500)	NOT NULL,
	Direccion					VARCHAR(500)	NOT NULL,
	Usuario						VARCHAR(50)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE Cuadrillas(
	ID							CHAR(10)		NOT NULL PRIMARY KEY,
	Nombre						VARCHAR(100)	NOT NULL,
	Descripcion					VARCHAR(1000)	NULL
)

CREATE TABLE OrdenesEstimaciones(
	ID							INT				IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Mov							VARCHAR(50)		NOT NULL,
	MovID						VARCHAR(10)		NULL,
	Sucursal					CHAR(10)		NOT NULL	FOREIGN KEY REFERENCES Sucursales(ID),
	FechaEmision				SMALLDATETIME	NULL,
	Observaciones				VARCHAR(800)	NULL,
	Estatus						VARCHAR(20)		NOT NULL,
	Origen						VARCHAR(50)		NULL,
	OrigenID					VARCHAR(50)		NULL,
	Usuario						VARCHAR(50)		NOT NULL	FOREIGN KEY REFERENCES Usuarios(ID),
	Reporte						VARCHAR(30)		NULL,
	Division					VARCHAR(30)		NULL,
	FechaOrigen					SMALLDATETIME	NULL,
	FechaMaximaAtencion			SMALLDATETIME	NULL,
	DiasAtencion				DECIMAL(5,0)	NULL,
	Reporto						VARCHAR(100)	NULL,
	TrabajoRequerido			VARCHAR(850)	NULL,
	TrabajoRealizado			VARCHAR(500)	NULL,
	CodigoFalla					VARCHAR(30)		NULL,
	FechaLlegada				SMALLDATETIME	NULL,
	HoraLlegada					DATETIME		NULL,
	FechaFinActividad			SMALLDATETIME	NULL,
	HoraFinActividad			DATETIME		NULL,
	ImporteTotal				DECIMAL (30,6)	NULL,
	Cuadrilla					CHAR(10)		NULL		FOREIGN KEY REFERENCES Cuadrillas(ID),
	HoraOrigen					DATETIME		NULL,
	RutaImagen					VARCHAR(500)	NULL,
	Atendido					VARCHAR(5)		NULL,
	MovEnLinea					BIT				NULL,
	NoOrden						CHAR(3)			NULL,
	ReferenciaOrden				VARCHAR(90)		NULL,
	Facturado					BIT				NULL		DEFAULT (0),
	Clasificacion				VARCHAR(25)		NOT NULL	DEFAULT(''),
	Revisado					BIT				NOT NULL	DEFAULT (0),
	FacturaMantenimiento		VARCHAR(50)		NOT NULL	DEFAULT(''),
	Cliente						CHAR(8)			NULL		FOREIGN KEY REFERENCES Clientes(ID)
)

CREATE TABLE OrdenesEstimacionesD(
	ID							INT				NOT NULL FOREIGN KEY REFERENCES OrdenesEstimaciones(ID),
	Renglon						SMALLINT		NOT NULL,
	ConceptoID					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesConceptos(ID),
	Cantidad					DECIMAL(20, 6)	NULL,
	Unidad						VARCHAR(30)		NOT NULL,
	Precio						DECIMAL(30, 6)	NOT NULL,
	Importe						DECIMAL(30, 6)	NULL,
	IntExt						VARCHAR(30)		NULL,
	Moneda						VARCHAR(10)		NULL
)

CREATE TABLE ImagenesOrdenEstimacionD(
	MovID						INT				NOT NULL FOREIGN KEY REFERENCES OrdenesEstimaciones(ID),
	Concepto					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesConceptos(ID),
	Nombre						VARCHAR(500)	NOT NULL,
	Direccion					VARCHAR(500)	NOT NULL,
	Usuario						VARCHAR(50)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE CroquisOrdenEstimacionD(
	MovID						INT				NOT NULL FOREIGN KEY REFERENCES OrdenesEstimaciones(ID),
	Concepto					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesConceptos(ID),
	Nombre						VARCHAR(500)	NOT NULL,
	Direccion					VARCHAR(500)	NOT NULL,
	Usuario						VARCHAR(50)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE FacturasOrdenEstimacionD(
	MovID						INT				NOT NULL FOREIGN KEY REFERENCES OrdenesEstimaciones(ID),
	Concepto					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesConceptos(ID),
	Nombre						VARCHAR(500)	NOT NULL,
	Direccion					VARCHAR(500)	NOT NULL,
	Usuario						VARCHAR(50)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE GeneradorOrdenEstimacionD(
	MovID						INT				NOT NULL FOREIGN KEY REFERENCES OrdenesEstimaciones(ID),
	ConceptoID					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesConceptos(ID),
	Descripcion					VARCHAR(500)	NULL,
	Eje							VARCHAR(50)		NULL,
	EntreEje1					VARCHAR(50)		NULL,
	EntreEje2					VARCHAR(50)		NULL,
	Area						VARCHAR(500)	NULL,
	Largo						DECIMAL(10,6)	NOT NULL,
	Ancho						DECIMAL(10,6)	NOT NULL,
	Alto						DECIMAL(10,6)	NOT NULL,
	Cantidad					DECIMAL(10,6)	NOT NULL,
	Total						DECIMAL(10,6)	NOT NULL,
	Plano						CHAR(20)		NULL
)

CREATE TABLE CodigoPPTA(
	CodigoMainSaver				CHAR(50)		NOT NULL PRIMARY KEY,
	Dias						CHAR(5)			NULL
)

CREATE TABLE FirmasReportes(
	FirmaReviso					VARCHAR(100)	NOT NULL,
	FirmaAutorizo				VARCHAR(100)	NOT NULL,
	Modulo						VARCHAR(100)	NULL,
)

CREATE TABLE Modulos(
	ID							VARCHAR(50)		NOT NULL PRIMARY KEY,
	Nombre						VARCHAR(50)		NOT NULL
) 

CREATE TABLE UsuarioXModulo(
	ID							INT				NOT NULL,
	UsuarioID					VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
	ModuloID					VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Modulos(ID),
	Permiso						BIT
)

CREATE TABLE Revisiones(
	ID							INT				IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Mov							VARCHAR(50)		NOT NULL,
	MovID						VARCHAR(10)		NULL,
	Origen						VARCHAR(50)		NULL,
	OrigenID					VARCHAR(10)		NULL,
	Semana						TINYINT			NULL,
	SucursalId					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES Sucursales(ID),
	FechaEmision				SMALLDATETIME	NULL,
	FechaRevision				DATE			NULL,
	Observaciones				VARCHAR(200)	NULL,
	Comentarios					VARCHAR(5000)	NULL,
	Estatus						VARCHAR(20)		NOT NULL,
	UsuarioAlta					VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID)
)

CREATE TABLE RevisionesD(
	Revision					INT				NOT NULL	FOREIGN KEY REFERENCES Revisiones(ID),
	Renglon						SMALLINT		NOT NULL,
	Categoria					CHAR(5)			NULL		FOREIGN KEY REFERENCES Categorias(Id),
	SubCategoria				CHAR(6)			NULL		FOREIGN KEY REFERENCES SubCategorias(Id),
	Concepto					CHAR(7)			NOT NULL	FOREIGN KEY REFERENCES Conceptos(Id),
	Proveedor					CHAR(7)			NULL		FOREIGN KEY REFERENCES Proveedores(ID),
	Programado					DECIMAL(5, 2)	NULL,
	[Real]						DECIMAL(5, 2)	NULL
)

CREATE TABLE ImagenesRevisionesD(
	Revision					INT				NOT NULL FOREIGN KEY REFERENCES Revisiones(ID),
	Concepto					CHAR(7)			NOT NULL FOREIGN KEY REFERENCES Conceptos(Id),
	Nombre						VARCHAR(50)		NOT NULL,
	Direccion					VARCHAR(500)	NOT NULL,
	UsuarioAlta					VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
	FechaAlta					SMALLDATETIME	NOT NULL
)

--DROP TABLE Clientes
--DROP TABLE RevisionesD
--DROP TABLE Revisiones
--DROP TABLE Proveedores
--DROP TABLE Conceptos
--DROP TABLE SubCategorias
--DROP TABLE Categorias
--DROP TABLE VolumetriasD
--DROP TABLE ImagenesVolumetriasD
--DROP TABLE Volumetrias
--DROP TABLE PreciarioConceptos
--DROP TABLE PreciarioSubSubCategorias
--DROP TABLE PreciarioSubCategorias
--DROP TABLE PreciarioCategorias
--DROP TABLE Preciarios
--DROP TABLE Sucursales
--DROP TABLE CodigosPostales
--DROP TABLE Colonias
--DROP TABLE Municipios
--DROP TABLE Estados
--DROP TABLE PreciariosGeneralesConceptos
--DROP TABLE PreciariosGeneralesSubSubCategorias
--DROP TABLE PreciariosGeneralesSubCategorias
--DROP TABLE PreciariosGeneralesCategorias
--DROP TABLE PreciariosGenerales
--DROP TABLE Usuarios
--DROP TABLE OrdenesEstimaciones
--DROP TABLE OrdenesEstimacionesD
--DROP TABLE CodigoPPTA