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
-- Author:		Christian Medina
-- Create date: 2015-04-16
-- Description:	Obtiene los datos generales por ConceptoID
-- =============================================
-- =============================================
-- Create procedure basic template
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spS_ObtenerRCaratulaOC' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerRCaratulaOC
GO

CREATE PROCEDURE web_spS_ObtenerRCaratulaOC
	-- Add the parameters for the stored procedure here 
	@ID INT 
AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	

	
	SELECT 
		--ID DE MOVIMIENTO Y CONCEPTOS
		OE.ID,OE.Mov,
		OE.Observaciones,
		OE.FechaEmision,
		CONVERT(VARCHAR (4),S.CR)+'-'+OE.NoOrden ORDEN,
		OED.ConceptoID,
		--Datos de la sucursal
		CONVERT(VARCHAR(4),S.CR) CR,S.Nombre Sucursal,S.InicioObra,S.FinObra,
		s.TipoConcepto, s.TipoObra, s.EmpresaSupervisora,
		--Datos del concepto
		PGC.CLAVE,PGC.Descripcion DescripcionPreGenConceptos,OED.Cantidad,OED.Unidad,PGCAT.Descripcion DescripcionPreGenCat,
		--Datos del cliente
		cli.ID ClienteID, cli.RutaLogo, cli.Elaboro, cli.Reviso, cli.Autorizo
		FROM OrdenesEstimaciones OE 
		--Detalle del movimiento
		LEFT JOIN OrdenesEstimacionesD OED
		ON OE.ID = OED.ID
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
		INNER JOIN Clientes cli
		ON OE.Cliente = cli.ID
		WHERE OE.Mov in ('Orden de Cambio')
		AND OE.ID like @ID
		--WHERE OE.ID = @IDMovimiento
END
GO


