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
			WHERE  name = 'web_spS_ObtenerPreciarioGeneralMnto' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerPreciarioGeneralMnto
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Viernes 17 de Junio de 2015
-- Description:	Obtener todos los registros de Articulos
-- =============================================
CREATE PROCEDURE web_spS_ObtenerPreciarioGeneralMnto
	-- Add the parameters for the stored procedure here
	@Cliente CHAR(8)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		ID,
		Descripcion,
		FechaAlta,
		Archivo,
		TipoObra,
		TipoMantenimiento,
		Usuario,
		Estatus,
		Cliente
	FROM
		PreciariosGenerales
	WHERE  
		Cliente=@Cliente
	AND
		TipoMantenimiento=1 
	AND 
		Estatus='ACTIVO';
END
GO