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
-- =============================================-- =============================================
-- Create procedure basic template
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spS_ObtenerImagenesPorMovimientoID' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerImagenesPorMovimientoID
GO
CREATE PROCEDURE web_spS_ObtenerImagenesPorMovimientoID
	-- Add the parameters for the stored procedure here
	@IDMovimiento int, @IDConcepto char(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT 
		--ID DE MOVIMIENTO Y CONCEPTOS
		IOD.MovID,
		IOD.Concepto,
		IOD.Nombre,
		IOD.Direccion,
		IOD.Usuario,
		IOD.FechaAlta
		FROM OrdenesEstimaciones OE
		--Detalle del movimiento
		LEFT JOIN OrdenesEstimacionesD OED
		ON OE.ID = OED.ID
		--Generador que pertenece al concepto
		LEFT JOIN ImagenesOrdenEstimacionD IOD 
		ON IOD.MovID =  OE.ID
		AND IOD.Concepto = OED.ConceptoID
		-- Nos trameos los datos complementarios del concepto
		LEFT JOIN PreciariosGeneralesConceptos PGC 
		ON OED.ConceptoID = PGC.ID
		-- Nos trameos los categoria(partida) del concepto
		LEFT JOIN PreciariosGeneralesCategorias PGCAT 
		ON PGC.Categoria = PGCAT.ID
		-- Nos trameos los datos de la sucursal
		LEFT JOIN Sucursales S
		ON S.ID = OE.Sucursal
		LEFT JOIN Municipios M
		ON M.ID =  S.Municipio
		LEFT JOIN Estados E
		ON E.ID =  S.Estado
		LEFT JOIN Colonias C
		ON C.ID = S.Colonia
		WHERE OE.ID = @IDMovimiento
		AND IOD.Concepto = @IDConcepto;
END
GO
