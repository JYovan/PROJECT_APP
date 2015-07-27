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
			WHERE  name = 'web_spI_InsertarImagenVolumetriaD' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarImagenVolumetriaD
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Jueves 19 de Febrero de 2015
-- Description:	Insertar un registro de ImagenVolumetriaD
-- =============================================
CREATE PROCEDURE web_spI_InsertarImagenVolumetriaD
	-- Add the parameters for the stored procedure here
	@Volumetria			INT,
	@PreciarioConcepto	CHAR(10),
	@Nombre				VARCHAR(500),
	@Direccion			VARCHAR(500),
	@Usuario			VARCHAR(50),
	@FechaAlta			SMALLDATETIME
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    INSERT INTO
		ImagenesVolumetriasD
		(
			Volumetria,
			PreciarioConcepto,
			Nombre,
			Direccion,
			Usuario,
			FechaAlta
		)
	VALUES
		(
			@Volumetria,
			@PreciarioConcepto,
			@Nombre,
			@Direccion,
			@Usuario,
			@FechaAlta
		)
END
GO