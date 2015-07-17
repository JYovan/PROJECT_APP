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
			WHERE  name = 'web_spS_ObtenerPreciarios' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerPreciarios
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Viernes 17 de Julio de 2015
-- Description:	Obtener todos los registros de Preciarios
-- =============================================
CREATE PROCEDURE web_spS_ObtenerPreciarios
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		ID,
		Descripcion,
		Sucursal,
		FechaAlta,
		Archivo,
		Usuario,
		Estatus,
		Cliente
	FROM
		Preciarios
END
GO