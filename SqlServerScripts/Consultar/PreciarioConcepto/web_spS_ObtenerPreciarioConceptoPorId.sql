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
			WHERE  name = 'web_spS_ObtenerPreciarioConceptoPorId' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerPreciarioConceptoPorId
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Martes 16 de Diciembre de 2014
-- Description:	Obtener un registro de Articulos por su ID
-- =============================================
CREATE PROCEDURE web_spS_ObtenerPreciarioConceptoPorId
	-- Add the parameters for the stored procedure here
	@ID		CHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

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
	ON p.ID = pc.Preciario AND pc.Preciario = @ID
END
GO