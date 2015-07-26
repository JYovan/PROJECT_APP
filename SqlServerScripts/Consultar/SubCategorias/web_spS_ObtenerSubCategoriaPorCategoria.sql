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
			WHERE  name = 'web_spS_ObtenerSubCategoriaPorCategoria' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerSubCategoriaPorCategoria
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Jueves 27 de Noviembre de 2014
-- Description:	Obtener los registros de SubCategorias por su Categoria
-- =============================================
CREATE PROCEDURE web_spS_ObtenerSubCategoriaPorCategoria
	-- Add the parameters for the stored procedure here
	@Categoria	CHAR(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		Id,
		Orden,
		Descripcion,
		CategoriaIdRaw as Categoria
	FROM
		SubCategorias
	WHERE
		CategoriaIdRaw = @Categoria
END
GO