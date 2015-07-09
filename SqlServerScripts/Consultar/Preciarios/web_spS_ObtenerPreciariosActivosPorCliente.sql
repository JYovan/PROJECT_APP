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
			WHERE  name = 'web_spS_ObtenerPreciariosActivosPorCliente' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerPreciariosActivosPorCliente
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Jueves 09 de Julio de 2015
-- Description:	Obtener todos los preciarios de la sucursal por cliente
-- =============================================
CREATE PROCEDURE web_spS_ObtenerPreciariosActivosPorCliente
	-- Add the parameters for the stored procedure here
	@Cliente CHAR(8)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        dbo.Preciarios.ID, dbo.Preciarios.Descripcion, 
				  dbo.Preciarios.Sucursal, dbo.Preciarios.FechaAlta, 
				  dbo.Preciarios.Archivo, dbo.Preciarios.Usuario, 
                  dbo.Preciarios.Estatus
	FROM          dbo.Preciarios INNER JOIN
                  dbo.Sucursales ON dbo.Preciarios.Sucursal = dbo.Sucursales.ID INNER JOIN
                  dbo.Clientes ON dbo.Sucursales.Cliente = dbo.Clientes.ID
WHERE        (dbo.Preciarios.Estatus = 'ACTIVO') AND (dbo.Clientes.ID = @Cliente);
END
GO