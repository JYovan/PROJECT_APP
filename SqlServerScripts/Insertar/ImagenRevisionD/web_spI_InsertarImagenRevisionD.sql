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
			WHERE  name = 'web_spI_InsertarImagenRevisionD' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarImagenRevisionD
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Lunes 22 de Junio de 2015
-- Description:	Insertar un registro de ImagenRevisionD
-- =============================================
CREATE PROCEDURE web_spI_InsertarImagenRevisionD
	-- Add the parameters for the stored procedure here
	@Revision			INT,
	@Concepto			CHAR(7),
	@Nombre				VARCHAR(50),
	@Direccion			VARCHAR(500),
	@UsuarioAlta		VARCHAR(50),
	@FechaAlta			SMALLDATETIME
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    INSERT INTO
		ImagenesRevisionesD
		(
			Revision,
			Concepto,
			Nombre,
			Direccion,
			UsuarioAlta,
			FechaAlta
		)
	VALUES
		(
			@Revision,
			@Concepto,
			@Nombre,
			@Direccion,
			@UsuarioAlta,
			@FechaAlta
		)
END
GO