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
			WHERE  name = 'web_spS_ObtenerConceptoPorRevisionD' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerConceptoPorRevisionD
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miércoles 15 de Septiembre de 2015
-- Description:	Obtener los registros de Conceptos por RevisionD
-- =============================================
CREATE PROCEDURE web_spS_ObtenerConceptoPorRevisionD
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
				SELECT
					B.Id AS Concepto
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