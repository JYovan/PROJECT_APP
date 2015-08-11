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
			WHERE  name = 'web_spS_ObtenerCambiosPreciarios' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerCambiosPreciarios
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Sabado 08 de Agosto de 2015
-- Description:	Obtener los datos para el reporte de Volumetria Concepto
-- =============================================
CREATE PROCEDURE web_spS_ObtenerCambiosPreciarios
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT        V.Sucursal, V.Observaciones, V.Preciario, P.Descripcion, S.Nombre, S.CR, S.Calle, S.NoExterior, S.NoInterior, S.CodigoPostal, S.Colonia, S.Estado, S.Municipio, 
                         VD.ConceptoID, PC.Descripcion AS DESC_CONCEPTO, PC.Utilizada, PC.Cantidad, V.FechaEmision, IVD.Nombre AS Expr1, IVD.Direccion, PC.Categoria, 
                         PC.SubCategoria, PC.SubSubCategoria, PC.Unidad, PC.ImporteFinal, PC.Importe, PC.CLAVE, PC.Costo, M.Descripcion AS DESC_MUNICIPIO, 
                         E.Descripcion AS EDO_DESCRIPCION, C.Descripcion AS COL_DESCRIPCION, dbo.Clientes.ID ClienteID, dbo.Clientes.RutaLogo
FROM            dbo.Volumetrias AS V INNER JOIN
                         dbo.Clientes ON V.Cliente = dbo.Clientes.ID LEFT OUTER JOIN
                         dbo.Sucursales AS S ON dbo.Clientes.ID = S.Cliente AND S.ID = V.Sucursal LEFT OUTER JOIN
                         dbo.Preciarios AS P ON dbo.Clientes.ID = P.Cliente AND P.ID = V.Preciario LEFT OUTER JOIN
                         dbo.VolumetriasD AS VD ON V.ID = VD.Volumetria LEFT OUTER JOIN
                         dbo.ImagenesVolumetriasD AS IVD ON IVD.Volumetria = V.ID AND IVD.PreciarioConcepto = VD.ConceptoID LEFT OUTER JOIN
                         dbo.PreciarioConceptos AS PC ON PC.Preciario = P.ID AND VD.ConceptoID = PC.ID LEFT OUTER JOIN
                         dbo.Municipios AS M ON M.ID = S.Municipio LEFT OUTER JOIN
                         dbo.Estados AS E ON E.ID = S.Estado LEFT OUTER JOIN
                         dbo.Colonias AS C ON C.ID = S.Colonia
END
GO