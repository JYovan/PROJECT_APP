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
			WHERE  name = 'web_spS_ObtenerRCroquisPorVolumetriaConcepto' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerRCroquisPorVolumetriaConcepto
GO

CREATE PROCEDURE web_spS_ObtenerRCroquisPorVolumetriaConcepto
	-- Add the parameters for the stored procedure here
		@idconcepto CHAR(10),	
	@idpreciario CHAR(7)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT 
		--ID DE MOVIMIENTO Y CONCEPTOS
		V.ID,V.Mov,
		VD.ConceptoID,
		cli.Nombre NombreCliente,
		--Datos de la sucursal
		CONVERT(VARCHAR(4),S.CR) CR,S.Nombre Sucursal,S.Calle,S.NoExterior,S.NoInterior,C.Descripcion Colonia,M.Descripcion Municipio,E.Descripcion Estado,
		--Datos del concepto
		PC.CLAVE,PC.Unidad,PC.Descripcion DescripcionPreGenConceptos,
		VD.Utilizada,PCAT.Descripcion DescripcionPreGenCat,
		--CONCEPTO INFO CROQUIS
		CVD.Direccion RutaCroquis,
		--Encabezado del movimiento(No del reporte)
		cli.ID ClienteID, cli.RutaLogo,
		Pro.Nombre AS Proveedor
		FROM Volumetrias V
		--Detalle del movimiento
		LEFT JOIN VolumetriasD VD
		ON V.ID = VD.Volumetria
		--Generador que pertenece al concepto
		LEFT JOIN CroquisVolumetriaD CVD 
		ON CVD.MovID =  V.ID
		AND CVD.Concepto = vd.ConceptoID
		-- Nos trameos los datos complementarios del concepto
		LEFT JOIN PreciarioConceptos PC 
		ON vd.ConceptoID = PC.ID
		-- Nos trameos los categoria(partida) del concepto
		LEFT JOIN PreciarioCategorias PCAT 
		ON PC.Categoria = PCAT.ID
		-- Nos trameos los datos de la sucursal
		LEFT JOIN Sucursales S
		ON S.ID = V.Sucursal
		LEFT JOIN Municipios M
		ON M.ID =  S.Municipio
		LEFT JOIN Estados E
		ON E.ID =  S.Estado
		LEFT JOIN Colonias C
		ON C.ID = S.Colonia
		INNER JOIN Clientes cli
		ON V.Cliente = cli.ID
		INNER JOIN dbo.Proveedores AS Pro
		ON cli.Proveedor = Pro.ID
		WHERE VD.ConceptoID = @idconcepto
		AND V.Preciario = @idpreciario
END
GO
