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
-- Author:		Giovanni Flores
-- Create date: 2015-04-16
-- Description:	Obtiene los datos generales por ConceptoID
-- =============================================
-- =============================================
-- Create procedure basic template
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spS_ObtenerRCaratulaDeEstimacionDeCostos' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerRCaratulaDeEstimacionDeCostos
GO

CREATE PROCEDURE web_spS_ObtenerRCaratulaDeEstimacionDeCostos
	-- Add the parameters for the stored procedure here  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT oed.ID, oed.ConceptoID, oed.Cantidad, oed.Unidad, oed.Precio, 
	oed.Importe, oed.IntExt, oed.Moneda, pgc.CLAVE, pgc.Preciario, 
	pgc.Descripcion, pgc.Categoria, pgc.SubCategoria, pgc.SubSubCategoria
	FROM OrdenesEstimacionesD oed INNER JOIN PreciariosGeneralesConceptos pgc
	ON oed.ConceptoID = pgc.ID AND oed.ID IN(SELECT oe.ID FROM OrdenesEstimaciones oe 
	WHERE oe.Revisado = 1 AND oe.Facturado = 0);

END
GO
