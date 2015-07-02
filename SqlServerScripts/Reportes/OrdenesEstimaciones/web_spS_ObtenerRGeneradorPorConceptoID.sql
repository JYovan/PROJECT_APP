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
			WHERE  name = 'web_spS_ObtenerRGeneradorPorConceptoID' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerRGeneradorPorConceptoID
GO

CREATE PROCEDURE web_spS_ObtenerRGeneradorPorConceptoID
	-- Add the parameters for the stored procedure here 
	@ConceptoID CHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT 
		--ID DE MOVIMIENTO Y CONCEPTOS
		OE.ID,
		OED.ConceptoID,
		--Datos de la sucursal
		S.CR,S.Nombre Sucursal,S.Calle,S.NoExterior,S.NoInterior,C.Descripcion Colonia,M.Descripcion Municipio,E.Descripcion Estado,
		--Datos del concepto
		PGC.CLAVE,PGC.Descripcion DescripcionPreGenConceptos,OED.Cantidad,OED.Unidad,PGCAT.Descripcion DescripcionPreGenCat,
		--CONCEPTO INFO GENERADOR
		GOD.Eje,GOD.EntreEje1,GOD.EntreEje2,GOD.Area,GOD.Ancho,GOD.Largo,GOD.Alto,GOD.Total,GOD.Cantidad CANT_GEN,GOD.Descripcion, GOD.Plano

		--Encabezado del movimiento(No del reporte)
		FROM OrdenesEstimaciones OE
		--Detalle del movimiento
		LEFT JOIN OrdenesEstimacionesD OED
		ON OE.ID = OED.ID
		--Generador que pertenece al concepto
		LEFT JOIN GeneradorOrdenEstimacionD GOD 
		ON GOD.MovID =  OE.ID
		AND GOD.ConceptoID = OED.ConceptoID
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
		WHERE OED.ConceptoID =@ConceptoID;
END
GO
