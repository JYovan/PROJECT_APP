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
			WHERE  name = 'web_spS_ObtenerEstimacionDPorMesaReporte' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerEstimacionDPorMesaReporte
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 05 de Diciembre de 2014
-- Description:	Obtener todos los registros de RevisionesD por la relación con Revision
-- =============================================
CREATE PROCEDURE web_spS_ObtenerEstimacionDPorMesaReporte
	-- Add the parameters for the stored procedure here
	@MOVID	VARCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Nos traemos el detalle del movimiento Mesa de reporte para no tener que volverlo a insertar en estimacion
    
		SELECT 
			D.ID,
			D.Renglon,
			D.ConceptoID,
			D.Cantidad,
			D.Unidad,
			D.Precio,
			D.Importe,
			D.IntExt,
			D.Moneda
		FROM 
				OrdenesEstimaciones
		INNER JOIN 
				OrdenesEstimaciones C 
		ON 
				OrdenesEstimaciones.Origen = C.Mov 
		AND 
				OrdenesEstimaciones.OrigenID = C.MovID
		LEFT JOIN 
				OrdenesEstimacionesD D 
		ON 
				C.ID = D.ID 
		WHERE C.Mov IN ('Mesa de Reporte')
		AND C.MovID = @MOVID
END
GO