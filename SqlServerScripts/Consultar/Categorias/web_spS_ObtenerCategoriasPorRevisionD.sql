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
			WHERE  name = 'web_spS_ObtenerCategoriasPorRevisionD' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerCategoriasPorRevisionD
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Jueves 16 de Septiembre de 2015
-- Description:	Obtener los registro de Categorias por RevisionD
-- =============================================
CREATE PROCEDURE web_spS_ObtenerCategoriasPorRevisionD
	-- Add the parameters for the stored procedure here
	@Revision	INT
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
				SELECT
					D.Id AS Categoria
				FROM
					RevisionesD A
				INNER JOIN
					Conceptos B ON A.Concepto = B.ID
				LEFT JOIN
					SubCategorias C ON B.SubCategoriaIdRaw = C.ID
				INNER JOIN
					Categorias D ON B.CategoriaIdRaw = D.ID		
				WHERE
					Revision = @Revision
		)
END
GO