CREATE TABLE GruposMenu(
	ID							CHAR(3)			NOT NULL PRIMARY KEY,
	Descripcion					VARCHAR(50)		NULL
)

CREATE TABLE Menus(
	ID							CHAR(4)			NOT NULL PRIMARY KEY,
	Descripcion					VARCHAR(50)		NULL,
	GrupoMenu					CHAR(3)			NOT NULL FOREIGN KEY REFERENCES GruposMenu(ID),
	ImagenNormal				VARCHAR(100)	NULL,
	ImagenSobre					VARCHAR(100)	NULL,
	ImagenSeleccionar			VARCHAR(100)	NULL,
	ImagenDeshabilitar			VARCHAR(100)	NULL
)

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

CREATE TABLE Categorias(
	ID							CHAR(5)			NOT NULL PRIMARY KEY,
	Orden						TINYINT			NOT NULL,
	Descripcion					VARCHAR(50)		NULL
)

CREATE TABLE SubCategorias(
	ID							CHAR(6)			NOT NULL PRIMARY KEY,
	Orden						TINYINT			NOT NULL,
	Descripcion					VARCHAR(50)		NULL,
	Categoria					CHAR(5)			NOT NULL FOREIGN KEY REFERENCES Categorias(ID)
)

CREATE TABLE Conceptos(
	ID							CHAR(7)			NOT NULL PRIMARY KEY,
	Modulo						VARCHAR(20)		NOT NULL,
	Orden						SMALLINT		NOT NULL,
	Descripcion					VARCHAR(50)		NULL,
	Categoria					CHAR(5)			NULL FOREIGN KEY REFERENCES Categorias(ID),
	SubCategoria				CHAR(6)			NULL FOREIGN KEY REFERENCES SubCategorias(ID),
	TipoMovimiento				VARCHAR(50)		NULL,
	FechaAlta					SMALLDATETIME	NOT NULL,
	Estatus						VARCHAR(50)		NOT NULL
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
	Colonia						CHAR(10)		NULL FOREIGN KEY REFERENCES Colonias(ID),
	Estado						CHAR(2)			NULL FOREIGN KEY REFERENCES Estados(ID),
	Municipio					CHAR(4)			NULL FOREIGN KEY REFERENCES Municipios(ID)
)

CREATE TABLE Sucursales(
	ID							CHAR(10)		NOT NULL PRIMARY KEY,
	CR							SMALLINT		NOT NULL,
	DireccionZona				VARCHAR(50)		NULL,
	Nombre						VARCHAR(100)	NOT NULL,
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
	Colonia						CHAR(10)		NOT NULL	FOREIGN KEY REFERENCES Colonias(ID),
	Estado						CHAR(2)			NOT NULL	FOREIGN KEY REFERENCES Estados(ID),
	Municipio					CHAR(4)			NOT NULL	FOREIGN KEY REFERENCES Municipios(ID),
	Contratista					VARCHAR(100)	NULL,
	InicioObra					DATE			NULL,
	FinObra						DATE			NULL,
	SemanasObra					SMALLINT		NULL,
	FechaAlta					SMALLDATETIME	NULL,
	Estatus						VARCHAR(50)		NULL
)

CREATE TABLE Revisiones(
	ID							INT				IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Mov							VARCHAR(50)		NOT NULL,
	MovID						VARCHAR(10)		NULL,
	Origen						VARCHAR(50)		NULL,
	OrigenID					VARCHAR(10)		NULL,
	Semana						TINYINT			NULL,
	Sucursal					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES Sucursales(ID),
	FechaEmision				SMALLDATETIME	NULL,
	FechaRevision				DATE			NULL,
	Observaciones				VARCHAR(200)	NULL,
	Comentarios					VARCHAR(5000)	NULL,
	Estatus						VARCHAR(20)		NOT NULL
)

CREATE TABLE RevisionesD(
	Revision					INT				NOT NULL FOREIGN KEY REFERENCES Revisiones(ID),
	Renglon						SMALLINT		NOT NULL,
	Concepto					CHAR(7)			NOT NULL FOREIGN KEY REFERENCES Conceptos(ID),
	Proveedor					CHAR(7)			NULL FOREIGN KEY REFERENCES Proveedores(ID),
	Programado					DECIMAL(5, 2)	NULL,
	Real						DECIMAL(5, 2)	NULL
)

CREATE TABLE ImagenesRevisionesD(
	Revision					INT				NOT NULL FOREIGN KEY REFERENCES Revisiones(ID),
	Concepto					CHAR(7)			NOT NULL FOREIGN KEY REFERENCES Conceptos(ID),
	Nombre						VARCHAR(50)		NOT NULL,
	Direccion					VARCHAR(500)	NOT NULL,
	UsuarioAlta					VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE CuentasContables(
	Cuenta						VARCHAR(20)		NOT NULL PRIMARY KEY,
	Descripcion					VARCHAR(100)	NULL,
	Rama						VARCHAR(20)		NULL,
	Tipo						VARCHAR(15)		NULL,
	Estatus						VARCHAR(15)		NULL
)

CREATE TABLE Profesiones(
	ID							CHAR(7)			NOT NULL PRIMARY KEY,
	Descripcion					VARCHAR(100)	NULL
)

CREATE TABLE Finalidades(
	ID							CHAR(6)			NOT NULL PRIMARY KEY,
	Descripcion					VARCHAR(100)	NULL
)

CREATE TABLE Articulos(
	ID							CHAR(2)			NOT NULL PRIMARY KEY,
	Corta						VARCHAR(50)		NULL,
	Descripcion					VARCHAR(100)	NULL
)

CREATE TABLE Clientes(
	ID							CHAR(8)			NOT NULL PRIMARY KEY,
	Nombre						VARCHAR(50)		NULL,
	APaterno					VARCHAR(50)		NULL,
	AMaterno					VARCHAR(50)		NULL,
	RFC							VARCHAR(15)		NULL,
	CURP						VARCHAR(18)		NULL,
	FechaNacimiento				DATE			NULL,
	Edad						TINYINT			NULL,
	Sexo						VARCHAR(9)		NULL,
	EstadoCivil					VARCHAR(10)		NULL,
	Profesion					CHAR(7)			NOT NULL FOREIGN KEY REFERENCES Profesiones(ID),
	Correo						VARCHAR(100)	NULL,
	Telefono					VARCHAR(15)		NULL,
	TelefonoMovil				VARCHAR(19)		NULL,
	Calle						VARCHAR(100)	NULL,
	NoExterior					VARCHAR(10)		NULL,
	NoInterior					VARCHAR(10)		NULL,
	Colonia						CHAR(10)		NULL FOREIGN KEY REFERENCES Colonias(ID),
	CodigoPostal				INT				NULL,
	EntreCalles					VARCHAR(100)	NULL,
	Estado						CHAR(2)			NOT NULL FOREIGN KEY REFERENCES Estados(ID),
	Municipio					CHAR(4)			NOT NULL FOREIGN KEY REFERENCES Municipios(ID),
	Empresa						VARCHAR(50)		NULL,
	EmpresaCalle				VARCHAR(100)	NULL,
	EmpresaNoExterior			VARCHAR(10)		NULL,
	EmpresaNoInterior			VARCHAR(10)		NULL,
	EmpresaColonia				CHAR(10)		NULL FOREIGN KEY REFERENCES Colonias(ID),
	EmpresaCodigoPostal			INT				NULL,
	EmpresaEntreCalles			VARCHAR(100)	NULL,
	EmpresaEstado				CHAR(2)			NULL FOREIGN KEY REFERENCES Estados(ID),
	EmpresaMunicipio			CHAR(4)			NULL FOREIGN KEY REFERENCES Municipios(ID),
	EmpresaTelefono				VARCHAR(15)		NULL,
	EmpresaTelefonoExt			SMALLINT		NULL,
	Puesto						VARCHAR(50)		NULL,
	TipoSocio					VARCHAR(20)		NOT NULL,
	NumeroSocio					VARCHAR(11)		NULL,
	FechaAlta					SMALLDATETIME	NULL,
	Estatus						VARCHAR(20)		NULL,
	Usuario						VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID)
)

CREATE TABLE Ahorros(
	ID							INT				IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Mov							VARCHAR(50)		NOT NULL,
	MovID						VARCHAR(10)		NULL,
	FechaEmision				SMALLDATETIME	NULL,
	Cliente						CHAR(8)			NOT NULL FOREIGN KEY REFERENCES Clientes(ID),
	Importe						MONEY			NOT NULL,
	Saldo						MONEY			NOT NULL,
	Usuario						VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
	Estatus						VARCHAR(20)		NOT NULL
)

CREATE TABLE AhorrosD(
	Ahorro						INT				NOT NULL FOREIGN KEY REFERENCES Ahorros(ID),
	Renglon						TINYINT			NOT NULL,
	Articulo					CHAR(2)			NOT NULL FOREIGN KEY REFERENCES Articulos(ID),
	SaldoAnterior				MONEY			NOT NULL,
	Importe						MONEY			NOT NULL,
	Saldo						MONEY			NOT NULL
)

CREATE TABLE SolicitudesPrestamos(
	ID							CHAR(8)			NOT NULL PRIMARY KEY,--P0000001
	Cliente						CHAR(8)			NOT NULL FOREIGN KEY REFERENCES Clientes(ID),
	Nacionalidad				VARCHAR(20)		NULL,
	NumeroDependientes			TINYINT			NULL,
	Edades						VARCHAR(20)		NULL,
	RegistroMatrimonial			VARCHAR(50)		NULL,
	TipoCasa					VARCHAR(50)		NULL,
	AniosDomicilio				TINYINT			NULL,
	CalleAnterior				VARCHAR(100)	NULL,
	NoExteriorAnterior			VARCHAR(10)		NULL,
	NoInteriorAnterior			VARCHAR(10)		NULL,
	ColoniaAnterior				CHAR(10)		NULL FOREIGN KEY REFERENCES Colonias(ID),
	CodigoPostalAnterior		INT				NULL,
	EntreCallesAnterior			VARCHAR(100)	NULL,
	EstadoAnterior				CHAR(2)			NULL FOREIGN KEY REFERENCES Estados(ID),
	MunicipioAnterior			CHAR(4)			NULL FOREIGN KEY REFERENCES Municipios(ID),
	------------ Ocupación Actual del solicitante ------------
	Antiguedad					TINYINT			NULL,
	Ingresos					SMALLINT		NULL,
	OtrosIngresos				SMALLINT		NULL,
	Concepto					VARCHAR(100)	NULL,
	JefeNombre					VARCHAR(50)		NULL,
	JefeAPAterno				VARCHAR(50)		NULL,
	JefeAMaterno				VARCHAR(50)		NULL,
	EmpresaAnterior				VARCHAR(50)		NULL,
	----------- Datos y Ocupación Actual del conyuge -----------
	ConyugeNombre				VARCHAR(50)		NULL,
	ConyugeAPaterno				VARCHAR(50)		NULL,
	ConyugeAMaterno				VARCHAR(50)		NULL,
	ConyugeFechaNacimiento		DATE			NULL,
	ConyugeEdad					TINYINT			NULL,
	ConyugeRFC					VARCHAR(15)		NULL,
	ConyugeTelefono				VARCHAR(15)		NULL,
	ConyugeTelefonoMovil		VARCHAR(19)		NULL,
	ConyugeCalle				VARCHAR(100)	NULL,
	ConyugeEntreCalles			VARCHAR(100)	NULL,
	ConyugeNoExterior			VARCHAR(10)		NULL,
	ConyugeNoInterior			VARCHAR(10)		NULL,
	ConyugeColonia				CHAR(10)		NULL FOREIGN KEY REFERENCES Colonias(ID),
	ConyugeCodigoPostal			INT				NULL,
	ConyugeEstado				CHAR(2)			NULL FOREIGN KEY REFERENCES Estados(ID),
	ConyugeMunicipio			CHAR(4)			NULL FOREIGN KEY REFERENCES Municipios(ID),
	ConyugeAntiguedad			TINYINT			NULL,
	ConyugeIngresos				SMALLINT		NULL,
	ConyugeOtrosIngresos		SMALLINT		NULL,
	ConyugeConcepto				VARCHAR(100)	NULL,
	ConyugeEmpresa				VARCHAR(50)		NULL,
	ConyugePuesto				VARCHAR(50)		NULL,
	ConyugeEmpresaCalle			VARCHAR(100)	NULL,
	ConyugeEmpresaNoExterior	VARCHAR(10)		NULL,
	ConyugeEmpresaNoInterior	VARCHAR(10)		NULL,
	ConyugeEmpresaColonia		CHAR(10)		NULL FOREIGN KEY REFERENCES Colonias(ID),
	ConyugeEmpresaCodigoPostal	INT				NULL,
	ConyugeEmpresaEntreCalles	VARCHAR(100)	NULL,
	ConyugeEmpresaEstado		CHAR(2)			NULL FOREIGN KEY REFERENCES Estados(ID),
	ConyugeEmpresaMunicipio		CHAR(4)			NULL FOREIGN KEY REFERENCES Municipios(ID),
	ConyugeEmpresaJefeNombre	VARCHAR(50)		NULL,
	ConyugeEmpresaJefeAPaterno	VARCHAR(50)		NULL,
	ConyugeEmpresaJefeAMaterno	VARCHAR(50)		NULL,
	----------- Información del Aval -----------
	AvalNombre					VARCHAR(50)		NULL,
	AvalAPaterno				VARCHAR(50)		NULL,
	AvalAMaterno				VARCHAR(50)		NULL,
	AvalSocio					BIT				NULL,
	AvalEstadoCivil				VARCHAR(10)		NULL,
	AvalRegistroMatrimonial		VARCHAR(50)		NULL,
	AvalTelefono				VARCHAR(15)		NULL,
	AvalTelefonoMovil			VARCHAR(19)		NULL,
	AvalCalle					VARCHAR(100)	NULL,
	AvalEntreCalles				VARCHAR(100)	NULL,
	AvalNoExterior				VARCHAR(10)		NULL,
	AvalNoInterior				VARCHAR(10)		NULL,
	AvalColonia					CHAR(10)		NULL FOREIGN KEY REFERENCES Colonias(ID),
	AvalCodigoPostal			INT				NULL,
	AvalEstado					CHAR(2)			NULL FOREIGN KEY REFERENCES Estados(ID),
	AvalMunicipio				CHAR(4)			NULL FOREIGN KEY REFERENCES Municipios(ID),
	AvalTipoCasa				VARCHAR(20)		NULL,
	AvalAntiguedad				TINYINT			NULL,
	----------- Ocupación del Aval -----------
	AvalEmpresa					VARCHAR(50)		NULL,
	AvalEmpresaPuesto			VARCHAR(50)		NULL,
	AvalEmpresaJefeNombre		VARCHAR(50)		NULL,
	AvalEmpresaJefeAPaterno		VARCHAR(50)		NULL,
	AvalEmpresaJefeAMaterno		VARCHAR(50)		NULL,
	AvalEmpresaAntiguedad		TINYINT			NULL,
	AvalEmpresaIngresos			INT				NULL,
	AvalEmpresaOtrosIngresos	INT				NULL,
	AvalEmpresaConcepto			VARCHAR(50)		NULL,
	AvalEmpresaPropietario		BIT				NULL,
	AvalEmpresaTipo				VARCHAR(20)		NULL,
	AvalEmpresaTelefono			VARCHAR(15)		NULL,
	AvalEmpresaTelefonoExt		SMALLINT		NULL,
	AvalEmpresaAnterior			VARCHAR(50)		NULL,
	------------- Datos de la operación -------------
	Cantidad					INT				NULL,
	Plazo						SMALLINT		NULL,
	FormaPago					VARCHAR(20)		NULL,
	DestinoPrestamo				VARCHAR(50)		NOT NULL,
	Tipo						VARCHAR(30)		NULL,
	TablaAmortizacion			VARCHAR(200)	NULL,
	Estatus						VARCHAR(20)		NOT NULL,
	UsuarioAlta					VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
	FechaAlta					SMALLDATETIME	NOT NULL,
	UsuarioModificacion			VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
	FechaModificacion			SMALLDATETIME	NOT NULL
)

CREATE TABLE CapacidadesPagos(
	ID							INT				IDENTITY(1,1) NOT NULL PRIMARY KEY,
	SolicitudPrestamo			CHAR(8)			NOT NULL FOREIGN KEY REFERENCES SolicitudesPrestamos(ID),
	Renglon						INT				NOT NULL,
	Tipo						VARCHAR(20)		NOT NULL,
	Concepto					VARCHAR(30)		NOT NULL,
	Importe						SMALLMONEY		NOT NULL
)

CREATE TABLE ReferenciasPersonasSolicitudesPrestamos(
	ID							INT				IDENTITY(1,1) NOT NULL PRIMARY KEY,
	SolicitudPrestamo			CHAR(8)			NOT NULL FOREIGN KEY REFERENCES SolicitudesPrestamos(ID),
	Nombre						VARCHAR(150)	NULL,
	Domicilio					VARCHAR(200)	NULL,
	Telefono					VARCHAR(20)		NULL,
	Actividad					VARCHAR(100)	NULL
)

CREATE TABLE ReferenciasInstitucionesSolicitudesPrestamos(
	ID							INT				IDENTITY(1,1) NOT NULL PRIMARY KEY,
	SolicitudPrestamo			CHAR(8)			NOT NULL FOREIGN KEY REFERENCES SolicitudesPrestamos(ID),
	Nombre						VARCHAR(100)	NULL,
	TipoCuenta					VARCHAR(50)		NULL,
	NoCuenta					VARCHAR(50)		NULL
)

CREATE TABLE BienesInmueblesSolicitudesPrestamos(
	ID							INT				IDENTITY(1,1) NOT NULL PRIMARY KEY,
	SolicitudPrestamo			CHAR(8)			NOT NULL FOREIGN KEY REFERENCES SolicitudesPrestamos(ID),
	Tipo						VARCHAR(50)		NULL,
	NoSerie						VARCHAR(50)		NULL,
	Valor						MONEY			NULL
)

CREATE TABLE BienesMueblesSolicitudesPrestamos(
	ID							INT				IDENTITY(1,1) NOT NULL PRIMARY KEY,
	SolicitudPrestamo			CHAR(8)			NOT NULL FOREIGN KEY REFERENCES SolicitudesPrestamos(ID),
	Ubicacion					VARCHAR(200)	NULL,
	Tipo						VARCHAR(50)		NULL,
	Inscripcion					VARCHAR(50)		NULL,
	Valor						MONEY			NULL
)

CREATE TABLE CertificadosInversiones(
	ID							CHAR(8)			NOT NULL PRIMARY KEY,--I0000001
	Cliente						CHAR(8)			NOT NULL FOREIGN KEY REFERENCES Clientes(ID),
	TipoInversion				VARCHAR(20)		NULL,
	UnidadCalculo				TINYINT			NULL,
	TasaInteres					DECIMAL(3,2)	NULL,
	FechaVencimiento			DATE			NULL,
	ValorInversion				DECIMAL(9,2)	NULL,
	InstruccionesCapital		VARCHAR(50)		NULL,
	InstruccionesInteres		VARCHAR(50)		NULL,
	Estatus						VARCHAR(20)		NOT NULL,
	UsuarioAlta					VARCHAR(50)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL,
	UsuarioModificacion			VARCHAR(50)		NOT NULL,
	FechaModificacion			SMALLDATETIME	NOT NULL
)

CREATE TABLE Beneficiarios(
	ID							CHAR(7)			NOT NULL PRIMARY KEY,
	Cliente						CHAR(8)			NULL FOREIGN KEY REFERENCES Clientes(ID),
	CertificadoInversion		CHAR(8)			NULL FOREIGN KEY REFERENCES CertificadosInversiones(ID),
	Nombre						VARCHAR(50)		NULL,
	APaterno					VARCHAR(50)		NULL,
	AMaterno					VARCHAR(50)		NULL,
	Telefono					VARCHAR(15)		NULL,
	TelefonoMovil				VARCHAR(15)		NULL,
	Parentesco					VARCHAR(20)		NULL
)

CREATE TABLE Saldos(
	ID							INT				IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Modulo						CHAR(4)			NOT NULL,
	Cliente						CHAR(8)			NOT NULL FOREIGN KEY REFERENCES Clientes(ID),
	Prestamo					CHAR(8)			NULL FOREIGN KEY REFERENCES SolicitudesPrestamos(ID),
	Inversion					CHAR(8)			NULL FOREIGN KEY REFERENCES CertificadosInversiones(ID),
	Saldo						MONEY			NOT NULL
)

CREATE TABLE Preciarios(
	ID							CHAR(7)			NOT NULL PRIMARY KEY,
	Descripcion					VARCHAR(50)		NOT NULL,
	Sucursal					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES Sucursales(ID),
	Archivo						VARCHAR(200)	NOT NULL,
	Usuario						VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
	Estatus						VARCHAR(20)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE PreciarioCategorias(
	ID							CHAR(10)		NOT NULL PRIMARY KEY,
	Clave						VARCHAR(7)		NULL,
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
	Costo						DECIMAL(20,2),
	Cantidad					DECIMAL(10,2),
	Utilizada					DECIMAL(10,2)	NULL,
	Importe						DECIMAL(20,2),
	ImporteFinal				DECIMAL(20,2)	NULL,
	Usuario						VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
	Estatus						VARCHAR(20)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE Volumetrias(
	ID							INT				IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Mov							VARCHAR(50)		NOT NULL,
	MovID						VARCHAR(10)		NULL,
	Sucursal					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES Sucursales(ID),
	FechaEmision				SMALLDATETIME	NULL,
	Observaciones				VARCHAR(200)	NULL,
	Estatus						VARCHAR(20)		NOT NULL,
	Preciario					CHAR(7)			NOT NULL FOREIGN KEY REFERENCES Preciarios(ID),
	Origen						VARCHAR(50)		NULL,
	OrigenID					VARCHAR(50)		NULL,
	Usuario						VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID)
)

CREATE TABLE VolumetriasD(
	Volumetria					INT				NOT NULL FOREIGN KEY REFERENCES Volumetrias(ID),
	Renglon						SMALLINT		NOT NULL,
	ConceptoID					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciarioConceptos(ID),
	Cantidad					DECIMAL(10, 2)	NOT NULL,
	Utilizada					DECIMAL(10, 2)	NOT NULL,
	Fotos						VARCHAR(200)	NULL
)

CREATE TABLE ImagenesVolumetriasD(
	Volumetria					INT				NOT NULL FOREIGN KEY REFERENCES Volumetrias(ID),
	PreciarioConcepto			CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciarioConceptos(ID),
	Nombre						VARCHAR(50)		NOT NULL,
	Direccion					VARCHAR(500)	NOT NULL,
	Usuario						VARCHAR(50)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE PreciariosGenerales(
	ID							CHAR(7)			NOT NULL PRIMARY KEY,
	Descripcion					VARCHAR(50)		NOT NULL,
	TipoObra					BIT,
	TipoMantenimiento			BIT,
	Archivo						VARCHAR(200)	NOT NULL,
	Usuario						VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
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
	CLAVE						CHAR(30)		NULL,
	Preciario					CHAR(7)			NOT NULL FOREIGN KEY REFERENCES PreciariosGenerales(ID),
	Descripcion					VARCHAR(2000)	NOT NULL,
	Categoria					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesCategorias(ID),
	SubCategoria				CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesSubCategorias(ID),
	SubSubCategoria				CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesSubSubCategorias(ID),
	MONEDA						VARCHAR(30)		NULL,
	Unidad						VARCHAR(30)		NULL,
	Costo						DECIMAL(20,2),
	Cantidad					DECIMAL(10,2)	NULL,
	Usuario						VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID),
	Estatus						VARCHAR(20)		NOT NULL,
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
	Observaciones				VARCHAR(200)	NULL,
	Estatus						VARCHAR(20)		NOT NULL,
	Origen						VARCHAR(50)		NULL,
	OrigenID					VARCHAR(50)		NULL,
	Reporte						VARCHAR(30)		NULL,
	Division					VARCHAR(30)		NULL,
	FechaOrigen					SMALLDATETIME	NULL,
	FechaMaximaAtencion			SMALLDATETIME	NULL,
	DiasAtencion				DECIMAL(5,0)	NULL,
	Reporto						VARCHAR(100)	NULL,
	TrabajoRequerido			VARCHAR(850)	NULL,
	Atiende						VARCHAR(100)	NULL,
	IntExt						VARCHAR(30)		NULL,
	TrabajoRealizado			VARCHAR(500)	NULL,
	CodigoFalla					VARCHAR(30)		NULL,
	TieneFotos					VARCHAR(10)		NULL,
	TieneReporte				VARCHAR(10)		NULL,
	FechaLlegada				SMALLDATETIME	NULL,
	HoraLlegada					datetime		NULL,
	FechaFinActividad			SMALLDATETIME	NULL,
	HoraFinActividad			datetime		NULL,
	Zona						VARCHAR(80)		NULL,
	Cuadrilla					CHAR(10)		NULL		FOREIGN KEY REFERENCES Cuadrillas(ID),
	ImporteTotal				DECIMAL (20,2),
	Moneda						VARCHAR(10),
	Usuario						VARCHAR(50)		NOT NULL	FOREIGN KEY REFERENCES Usuarios(ID)
)

CREATE TABLE OrdenesEstimacionesD(
	ID							INT				NOT NULL FOREIGN KEY REFERENCES OrdenesEstimaciones(ID),
	Renglon						SMALLINT		NOT NULL,
	ConceptoID					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesConceptos(ID),
	Cantidad					DECIMAL(10, 2)	NOT NULL,
	Unidad						VARCHAR(30)		NOT NULL,
	Precio						DECIMAL(20, 2)	NOT NULL,
	Importe						DECIMAL(20, 2)	NOT NULL
)

CREATE TABLE ImagenesOrdenEstimacionD(
	MovID						INT				NOT NULL FOREIGN KEY REFERENCES OrdenesEstimaciones(ID),
	Concepto					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesConceptos(ID),
	Nombre						VARCHAR(50)		NOT NULL,
	Direccion					VARCHAR(500)	NOT NULL,
	Usuario						VARCHAR(50)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE CroquisOrdenEstimacionD(
	MovID						INT				NOT NULL FOREIGN KEY REFERENCES OrdenesEstimaciones(ID),
	Concepto					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesConceptos(ID),
	Nombre						VARCHAR(50)		NOT NULL,
	Direccion					VARCHAR(500)	NOT NULL,
	Usuario						VARCHAR(50)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE FacturasOrdenEstimacionD(
	MovID						INT				NOT NULL FOREIGN KEY REFERENCES OrdenesEstimaciones(ID),
	Concepto					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesConceptos(ID),
	Nombre						VARCHAR(50)		NOT NULL,
	Direccion					VARCHAR(500)	NOT NULL,
	Usuario						VARCHAR(50)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE GeneradorOrdenEstimacionD(
	MovID						INT				NOT NULL FOREIGN KEY REFERENCES OrdenesEstimaciones(ID),
	ConceptoID					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciariosGeneralesConceptos(ID),
	Numero						VARCHAR(50)		NULL,
	Descripcion					VARCHAR(500)	NULL,
	Eje							VARCHAR(50)		NULL,
	EntreEje1					VARCHAR(50)		NULL,
	EntreEje2					VARCHAR(50)		NULL,
	Area						VARCHAR(500)	NULL,
	Largo						DECIMAL(10,2)	NULL,
	Ancho						DECIMAL(10,2)	NULL,
	Alto						DECIMAL(10,2)	NULL,
	Cantidad					DECIMAL(10,2)	NOT NULL,
	Total						DECIMAL(10,2)	NOT NULL
)

CREATE TABLE GeneradorVolumetriaD(
	MovID						INT				NOT NULL FOREIGN KEY REFERENCES Volumetrias(ID),
	ConceptoID					CHAR(10)		NOT NULL FOREIGN KEY REFERENCES PreciarioConceptos(ID),
	Numero						VARCHAR(50)		NULL,
	Descripcion					VARCHAR(500)	NULL,
	Eje							VARCHAR(50)		NULL,
	EntreEje1					VARCHAR(50)		NULL,
	EntreEje2					VARCHAR(50)		NULL,
	Area						VARCHAR(500)	NULL,
	Largo						DECIMAL(10,2)	NULL,
	Ancho						DECIMAL(10,2)	NULL,
	Alto						DECIMAL(10,2)	NULL,
	Cantidad					DECIMAL(10,2)	NOT NULL,
	Total						DECIMAL(10,2)	NOT NULL
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


--DROP TABLE Menus
--DROP TABLE GruposMenu
--DROP TABLE Beneficiarios
--DROP TABLE CertificadosInversiones
--DROP TABLE ReferenciasPersonasSolicitudesPrestamos
--DROP TABLE ReferenciasInstitucionesSolicitudesPrestamos
--DROP TABLE BienesInmueblesSolicitudesPrestamos
--DROP TABLE BienesMueblesSolicitudesPrestamos
--DROP TABLE SolicitudesPrestamos
--DROP TABLE Articulos
--DROP TABLE Finalidades
--DROP TABLE CuentasContables
--DROP TABLE Clientes
--DROP TABLE Profesiones
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



