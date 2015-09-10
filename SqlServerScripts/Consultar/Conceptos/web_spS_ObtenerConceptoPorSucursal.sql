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
			WHERE  name = 'web_spS_ObtenerConceptoPorSucursal' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerConceptoPorSucursal
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 10 de Septiembre de 2015
-- Description:	Obtener los registros de Conceptos por Sucursal en Tasks (Programa de Obra)
-- =============================================
CREATE PROCEDURE web_spS_ObtenerConceptoPorSucursal
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
		Modulo,
		Orden,
		Descripcion,
		CategoriaIdRaw,
		SubCategoriaIdRaw,
		FechaAlta,
		Estatus
	FROM
		Conceptos
	WHERE
		Id IN (
			SELECT ConceptoIdRaw FROM Tasks WHERE SucursalIdRaw = @Sucursal
		)
END
GO