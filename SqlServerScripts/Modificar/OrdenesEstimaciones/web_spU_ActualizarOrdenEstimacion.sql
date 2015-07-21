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
			WHERE  name = 'web_spU_ActualizarOrdenEstimacion' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarOrdenEstimacion
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 05 de Diciembre de 2014
-- Description:	Actualizar un registro de Revision por su ID
-- =============================================
CREATE PROCEDURE web_spU_ActualizarOrdenEstimacion
	-- Add the parameters for the stored procedure here
	@ID				INT,
	@Mov			CHAR(50),
	@MovID			CHAR(10),
	@Sucursal		CHAR(10),
	@Observaciones	VARCHAR(800),
	@Estatus		VARCHAR(10),
	@Origen			VARCHAR(30),
	@OrigenID		VARCHAR(30),
	@Reporte		VARCHAR(50),
	@Division		VARCHAR(30),
	@FechaOrigen	SMALLDATETIME,
	@FechaMaximaAtencion SMALLDATETIME,
	@DiasAtencion	DECIMAL(5,0),
	@Reporto		VARCHAR(100),
	@TrabajoRequerido VARCHAR(850),
	@TrabajoRealizado VARCHAR(500),
	@CodigoFalla	VARCHAR(30),
	@FechaLlegada	SMALLDATETIME,
	@HoraLlegada	DATETIME,
	@FechaFinActividad SMALLDATETIME,
	@HoraFinActividad DATETIME,
	@Cuadrilla		CHAR(10) ,
	@ImporteTotal	DECIMAL(20,6),
	@HoraOrigen		DATETIME,
	@RutaImagen		VARCHAR(500),
	@Atendido		VARCHAR(5),
	@ReferenciaOrden	VARCHAR(90),
	@Clasificacion			VARCHAR(25),
	@Cliente				CHAR(8)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @SucBefore CHAR(10); 
	SET @SucBefore = (SELECT TOP(1) oe.Sucursal FROM OrdenesEstimaciones oe WHERE oe.ID = @ID);

	DECLARE @NoOrden CHAR(3);
DECLARE @CR SMALLINT;
SET @CR = (SELECT TOP(1) s.CR FROM Sucursales s WHERE s.ID = LTRIM(@Sucursal));
SET @NoOrden = (SELECT TOP(1) oe.NoOrden +1 FROM OrdenesEstimaciones oe INNER JOIN Sucursales s 
				ON oe.Sucursal = s.ID AND oe.Mov IN ('Orden de Cambio','Orden de Compra')
				AND s.CR = @CR AND s.ID = @Sucursal ORDER BY oe.NoOrden DESC);
SET @NoOrden = (SELECT CASE
	WHEN @NoOrden IS NULL THEN '001'
	WHEN @NoOrden > 0 AND @NoOrden < 10 THEN '00'+@NoOrden
	WHEN @NoOrden > 10 AND @NoOrden < 99 THEN '0'+@NoOrden 
	WHEN @NoOrden > 99 AND @NoOrden < 999 THEN  @NoOrden 
END NoOrden);

    -- Insert statements for procedure here
    UPDATE
		OrdenesEstimaciones
	SET
		Mov = @Mov,
		MovID = @MovID,
		Sucursal = @Sucursal,
		Observaciones = @Observaciones,
		Estatus = @Estatus,
		Origen = @Origen,
		OrigenID = @OrigenID,
		Reporte = @Reporte,
		Division = @Division,
		FechaOrigen =  @FechaOrigen,
		FechaMaximaAtencion = @FechaMaximaAtencion,
		DiasAtencion = @DiasAtencion,
		Reporto = @Reporto,
		TrabajoRequerido = @TrabajoRequerido,
		TrabajoRealizado = @TrabajoRealizado,
		CodigoFalla = @CodigoFalla,
		FechaLlegada = @FechaLlegada,
		HoraLlegada = @HoraLlegada,
		FechaFinActividad = @FechaFinActividad,
		HoraFinActividad = @HoraFinActividad,
		Cuadrilla = @Cuadrilla,
		ImporteTotal = @ImporteTotal,
		HoraOrigen = @HoraOrigen,
		RutaImagen = @RutaImagen,
		Atendido = @Atendido,
		ReferenciaOrden = @ReferenciaOrden,
		Clasificacion = @Clasificacion,
		Cliente = @Cliente
	WHERE
		ID = @ID
END
GO