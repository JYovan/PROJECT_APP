-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create procedure basic template
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spS_AvanzarMesaReportePorID' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_AvanzarMesaReportePorID
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Martes 03 de Febrero de 2015
-- Description:	Avanzar un registro de Revisiones por su ID
-- =============================================
CREATE PROCEDURE web_spS_AvanzarMesaReportePorID
	-- Add the parameters for the stored procedure here
	@ID			INT,
	@Mov		VARCHAR(50),
	@IDNuevo	INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE
		@MovA					VARCHAR(50),
		@MovID					VARCHAR(10),
		@Origen					VARCHAR(50),
		@OrigenID				VARCHAR(10),
		@Sucursal				CHAR(10),
		@FechaEmision			SMALLDATETIME,
		@Observaciones			VARCHAR(800),
		@Estatus				VARCHAR(20),
		@Usuario				VARCHAR(50),
		@Reporte				VARCHAR(50),
		@Division				VARCHAR(30),
		@FechaOrigen			SMALLDATETIME,
		@FechaMaximaAtencion	SMALLDATETIME,
		@DiasAtencion			DECIMAL(5,0),
		@Reporto				VARCHAR(100),
		@TrabajoRequerido		VARCHAR(850),
		@TrabajoRealizado		VARCHAR(500),
		@CodigoFalla			VARCHAR(30),
		@FechaLlegada			SMALLDATETIME,
		@HoraLlegada			DATETIME,
		@FechaFinActividad		SMALLDATETIME,
		@HoraFinActividad		DATETIME,
		@Cuadrilla				VARCHAR(200),
		@ImporteTotal			DECIMAL (30,6),
		@HoraOrigen				DATETIME,
		@RutaImagen				VARCHAR(500),
		@Atendido				VARCHAR(5),
		@RefenciaOrden			VARCHAR(90),
		@NoOrden				CHAR(3),
		@Facturado				BIT,
		@Cliente				CHAR(8);

		
	SELECT
		@MovA = @Mov,
		@Origen = Mov,
		@OrigenID = MovID,
		@Sucursal = Sucursal,
		@FechaEmision = FechaEmision,
		@Observaciones = Observaciones,
		--@Estatus = Estatus,
		@Usuario = Usuario,
		@Reporte = Reporte,
		@Division = Division,
		@FechaOrigen =  FechaOrigen,
		@FechaMaximaAtencion = FechaMaximaAtencion,
		@DiasAtencion = DiasAtencion,
		@Reporto = Reporto,
		@TrabajoRequerido = TrabajoRequerido,
		@TrabajoRealizado = TrabajoRealizado,
		@CodigoFalla = CodigoFalla,
		@FechaLlegada = FechaLlegada,
		@HoraLlegada = HoraLlegada,
		@FechaFinActividad = FechaFinActividad,
		@HoraFinActividad = HoraFinActividad,
		@Cuadrilla = Cuadrilla,
		@ImporteTotal = ImporteTotal,
		@HoraOrigen = HoraOrigen,
		@RutaImagen = RutaImagen,
		@Atendido = Atendido,
		@RefenciaOrden = ReferenciaOrden,
		@NoOrden = NoOrden,
		@Facturado = Facturado,
		@Cliente = Cliente
	FROM
		OrdenesEstimaciones
	WHERE
		ID = @ID
		
	UPDATE OrdenesEstimaciones SET MovEnLinea = 0 WHERE ID = @ID;

	IF (@Mov = 'Mesa de reporte')
	BEGIN
		SET @Estatus = 'BORRADOR'
	END
	ELSE
	BEGIN
		SET @Estatus = 'PENDIENTE'
	END
		
	INSERT INTO
		OrdenesEstimaciones
		(
			Mov,
			Origen,
			OrigenID,
			Sucursal,
			FechaEmision,
			Observaciones,
			Estatus,
			Usuario,
			Reporte,
			Division,
			FechaOrigen,
			FechaMaximaAtencion,
			DiasAtencion,
			Reporto,
			TrabajoRequerido,
			TrabajoRealizado,
			CodigoFalla ,
			FechaLlegada ,
			HoraLlegada ,
			FechaFinActividad ,
			HoraFinActividad ,
			Cuadrilla,
			ImporteTotal,
			HoraOrigen,
			RutaImagen,
			Atendido,
			MovEnLinea,
			NoOrden,
			ReferenciaOrden,
			Facturado,
			Cliente
		)
	VALUES
		(
			@MovA,
			@Origen,
			@OrigenID,
			@Sucursal,
			GETDATE(),
			@Observaciones,
			@Estatus,
			@Usuario,
			@Reporte,
			@Division,
			@FechaOrigen,
			@FechaMaximaAtencion,
			@DiasAtencion,
			@Reporto,
			@TrabajoRequerido,
			@TrabajoRealizado,
			@CodigoFalla ,
			@FechaLlegada ,
			@HoraLlegada ,
			@FechaFinActividad ,
			@HoraFinActividad ,
			@Cuadrilla,
			@ImporteTotal,
			@HoraOrigen,
			@RutaImagen,
			@Atendido,
			1,
			@NoOrden,
			@RefenciaOrden,
			@Facturado,
			@Cliente
		)
	
	SELECT @IDNuevo = SCOPE_IDENTITY()
	
	--INSERTAR EL DETALLE
	INSERT INTO
		OrdenesEstimacionesD
		(
			ID,
			Renglon,
			ConceptoID,
			Cantidad,
			Unidad,
			Precio,
			Importe,
			IntExt
		)
	SELECT
		@IDNuevo,
		Renglon,
		ConceptoID,
		Cantidad,
		Unidad,
		Precio,
		Importe,
		IntExt
	FROM
		OrdenesEstimacionesD
	WHERE
		ID = @ID
		
	--INSERTAR GENERADOR SI LO HAY
	IF EXISTS(SELECT MovID FROM GeneradorOrdenEstimacionD WHERE MovID = @ID)
	BEGIN
		INSERT INTO
			GeneradorOrdenEstimacionD
			(
				MovID,
				ConceptoID,
				Descripcion,
				Eje,
				EntreEje1,
				EntreEje2,
				Area,
				Largo,
				Ancho,
				Alto,
				Cantidad,
				Total,
				Plano
			)
		SELECT
			@IDNuevo,
			ConceptoID,
			Descripcion,
			Eje,
			EntreEje1,
			EntreEje2,
			Area,
			Largo,
			Ancho,
			Alto,
			Cantidad,
			Total,
			Plano
		FROM
			GeneradorOrdenEstimacionD
		WHERE
			MovID = @ID
	END
	
	--INSERTAR FOTOS SI LAS HAY
	IF EXISTS(SELECT MovID FROM ImagenesOrdenEstimacionD WHERE MovID = @ID)
	BEGIN
		INSERT INTO
			ImagenesOrdenEstimacionD
			(
				MovID,
				Concepto,
				Nombre,
				Direccion,
				Usuario,
				FechaAlta
			)
		SELECT
			@IDNuevo,
			Concepto,
			Nombre,
			Direccion,
			Usuario,
			FechaAlta
		FROM
			ImagenesOrdenEstimacionD
		WHERE
			MovID = @ID
	END
	
	--INSERTAR CROQUIS SI LO HAY
	IF EXISTS(SELECT MovID FROM CroquisOrdenEstimacionD WHERE MovID = @ID)
	BEGIN
		INSERT INTO
			CroquisOrdenEstimacionD
			(
				MovID,
				Concepto,
				Nombre,
				Direccion,
				Usuario,
				FechaAlta
			)
		SELECT
			@IDNuevo,
			Concepto,
			Nombre,
			Direccion,
			Usuario,
			FechaAlta
		FROM
			CroquisOrdenEstimacionD
		WHERE
			MovID = @ID
	END
	
	--INSERTAR FACTURA SI LA HAY
	IF EXISTS(SELECT MovID FROM FacturasOrdenEstimacionD WHERE MovID = @ID)
	BEGIN
		INSERT INTO
			FacturasOrdenEstimacionD
			(
				MovID,
				Concepto,
				Nombre,
				Direccion,
				Usuario,
				FechaAlta
			)
		SELECT
			@IDNuevo,
			Concepto,
			Nombre,
			Direccion,
			Usuario,
			FechaAlta
		FROM
			FacturasOrdenEstimacionD
		WHERE
			MovID = @ID
	END
    
END
GO