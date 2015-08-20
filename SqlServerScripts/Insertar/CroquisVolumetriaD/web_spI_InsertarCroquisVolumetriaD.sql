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
			WHERE  name = 'web_spI_InsertarCroquisVolumetriaD' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarCroquisVolumetriaD
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Jueves 20 de Agosto de 2015
-- Description:	Insertar un registro de CroquisVolumetriaD
-- =============================================
CREATE PROCEDURE web_spI_InsertarCroquisVolumetriaD
	-- Add the parameters for the stored procedure here
	@ID					INT,
	@Concepto			CHAR(10),
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
		CroquisVolumetriaD
		(
			MovID,
			Concepto,
			Nombre,
			Direccion,
			Usuario,
			FechaAlta
		)
	VALUES
		(
			@ID,
			@Concepto,
			@Nombre,
			@Direccion,
			@Usuario,
			@FechaAlta
		)
END
GO