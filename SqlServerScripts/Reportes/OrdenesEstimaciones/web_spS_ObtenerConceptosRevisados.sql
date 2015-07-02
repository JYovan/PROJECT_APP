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
-- Create date: 2015-03-29
-- Description:	Obtiene los datos generales
-- =============================================
-- =============================================
-- Create procedure basic template
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spS_ObtenerConceptosRevisados' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerConceptosRevisados
GO

CREATE PROCEDURE web_spS_ObtenerConceptosRevisados
	-- Add the parameters for the stored procedure here
		@CLASIFICACION VARCHAR(25)
AS
BEGIN

IF (@CLASIFICACION = 'Todos')
BEGIN
SET @CLASIFICACION = ''
END


	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
		
		SELECT 
		--DATOS DEL REPORTE
		OED.ConceptoID,
		PGC.CLAVE, 
		PGC.Descripcion,
		OED.Precio,	
		(SELECT SUM(OEDSQ.Cantidad) FROM OrdenesEstimacionesD OEDSQ 
		JOIN OrdenesEstimaciones SOE
		ON SOE.ID= OEDSQ.ID
		AND OEDSQ.ConceptoID = OED.ConceptoID
		AND SOE.Mov in('Mesa de reporte')  
		AND SOE.MovEnLinea = 1
	 AND SOE.Estatus IN('CONCLUIDO') 
	 AND SOE.Revisado=1
	  AND SOE.Facturado=0
	AND SOE.CLASIFICACION LIKE '%'+@CLASIFICACION+'%'   
		)  Cantidades,
		(SELECT SUM(OEDSQ.Importe) FROM OrdenesEstimacionesD OEDSQ 
		JOIN OrdenesEstimaciones SOE
		ON SOE.ID= OEDSQ.ID
		AND OEDSQ.ConceptoID = OED.ConceptoID
		AND SOE.Mov in('Mesa de reporte')  
		AND SOE.MovEnLinea = 1
	 AND SOE.Estatus IN('CONCLUIDO') 
	 AND SOE.Revisado=1
	  AND SOE.Facturado=0
	AND SOE.CLASIFICACION LIKE '%'+@CLASIFICACION+'%'   )   Importes
		FROM OrdenesEstimaciones OE
		JOIN OrdenesEstimacionesD OED ON OE.ID = OED.ID
		JOIN PreciariosGeneralesConceptos PGC ON PGC.ID = OED.ConceptoID 
		WHERE 
		OE.Mov in('Mesa de reporte')  
		AND OE.MovEnLinea = 1
	 AND OE.Estatus IN('CONCLUIDO') 
	 AND oe.Revisado=1
	  AND oe.Facturado=0
	AND OE.CLASIFICACION LIKE '%'+@CLASIFICACION+'%'   
	GROUP BY OED.ConceptoID,
		PGC.CLAVE, 
		PGC.Descripcion,
		OE.MovEnLinea,
		OE.Mov,
		OE.Estatus,
		OE.Revisado,
		OE.Clasificacion,
		OE.Facturado,
		OED.Precio ORDER BY OED.ConceptoID DESC;
END
GO

