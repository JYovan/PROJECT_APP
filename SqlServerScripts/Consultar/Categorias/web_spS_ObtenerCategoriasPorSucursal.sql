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
			WHERE  name = 'web_spS_ObtenerCategoriasPorSucursal' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerCategoriasPorSucursal
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Jueves 09 de Septiembre de 2015
-- Description:	Obtener los registro de Categorias por Sucursal en Tareas (Programa Obra)
-- =============================================
CREATE PROCEDURE web_spS_ObtenerCategoriasPorSucursal
	-- Add the parameters for the stored procedure here
	@Sucursal	CHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		Id,
		Orden,
		Descripcion
	FROM
		Categorias
	WHERE
		Id IN (
			SELECT CategoriaIdRaw FROM Tasks WHERE SucursalIdRaw = @Sucursal
		)
END
GO