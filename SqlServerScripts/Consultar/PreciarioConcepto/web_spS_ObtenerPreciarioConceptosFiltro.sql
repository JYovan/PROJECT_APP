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
			WHERE  name = 'web_spS_ObtenerPreciarioConceptosFiltro' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerPreciarioConceptosFiltro
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Jueves 05 de Marzo de 2015
-- Description:	Obtener todos los conceptos de acuerdo a Categoria, SubCategoria y SubSubCategoria
-- =============================================
CREATE PROCEDURE web_spS_ObtenerPreciarioConceptosFiltro
	-- Add the parameters for the stored procedure here
	@Preciario			CHAR(7),
	@Categoria			CHAR(10),
	@SubCategoria		CHAR(10),
	@SubSubCategoria	CHAR(10)
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SET @Categoria = CASE WHEN LEN(LTRIM(@Categoria)) = 0 THEN NULL ELSE LTRIM(@Categoria) END
	SET @SubCategoria = CASE WHEN LEN(LTRIM(@SubCategoria)) = 0 THEN NULL ELSE LTRIM(@SubCategoria) END
	SET @SubSubCategoria = CASE WHEN LEN(LTRIM(@SubSubCategoria)) = 0 THEN NULL ELSE LTRIM(@SubSubCategoria) END

    -- Insert statements for procedure here
	SELECT
		pc.ID,
		pc.CLAVE,
		pc.Preciario,
		pc.Descripcion,
		pc.Categoria,
		pc.SubCategoria,
		pc.SubSubCategoria,
		pc.Unidad,
		pc.Costo,
		pc.Cantidad,
		pc.Utilizada,
		pc.Importe,
		pc.ImporteFinal,
		pc.Usuario,
		pc.Estatus,
		pc.FechaAlta,
		cl.Nombre Cliente
	FROM dbo.Clientes cl INNER JOIN dbo.Preciarios p 
	ON cl.ID = p.Cliente INNER JOIN dbo.PreciarioConceptos pc 
	ON p.ID = pc.Preciario AND pc.Preciario = @Preciario
		AND pc.Categoria = ISNULL(@Categoria, pc.Categoria)
		AND pc.SubCategoria = ISNULL(@SubCategoria, pc.SubCategoria)
		AND pc.SubSubCategoria = ISNULL(@SubSubCategoria, pc.SubSubCategoria)	
END
GO