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
			WHERE  name = 'web_spS_ObtenerOrdenEstimacionDPorOrdenEstimacion' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerOrdenEstimacionDPorOrdenEstimacion
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 05 de Diciembre de 2014
-- Description:	Obtener todos los registros de RevisionesD por la relación con Revision
-- =============================================
CREATE PROCEDURE web_spS_ObtenerOrdenEstimacionDPorOrdenEstimacion
	-- Add the parameters for the stored procedure here
	@ID	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT
	OED.ID,	
	OED.Renglon,
	OED.ConceptoID,		
	OED.Cantidad,
	OED.Unidad,		
	OED.Precio,
	OED.Importe,		
	OED.IntExt,
	OED.Moneda,
	(SELECT COUNT(*) FROM ImagenesOrdenEstimacionD IOED WHERE IOED.MovID = @ID AND IOED.Concepto = OED.ConceptoID) Fotos, 
	(SELECT COUNT(*) FROM CroquisOrdenEstimacionD COED WHERE COED.MovID = @ID AND COED.Concepto = OED.ConceptoID) Croquis, 
	(SELECT COUNT(*) FROM FacturasOrdenEstimacionD FOED WHERE FOED.MovID = @ID AND FOED.Concepto = OED.ConceptoID) Facturas,
	pc.CLAVE Clave
	FROM OrdenesEstimacionesD OED INNER JOIN dbo.PreciariosGeneralesConceptos pc 
	ON OED.ID = @ID AND  OED.ConceptoID = pc.ID 
	GROUP BY 
		OED.ID, oed.Renglon,
		OED.ConceptoID,		
		OED.Cantidad,
		OED.Unidad,		
		OED.Precio,
		OED.Importe,		
		OED.IntExt,
		OED.Moneda,
		pc.CLAVE
	ORDER BY OED.Renglon ASC;

END
GO