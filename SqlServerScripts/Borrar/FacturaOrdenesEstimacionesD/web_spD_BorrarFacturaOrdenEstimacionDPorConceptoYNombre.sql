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
			WHERE  name = 'web_spD_BorrarFacturaOrdenEstimacionDPorConceptoYNombre' AND
			TYPE = 'P')
	DROP PROCEDURE web_spD_BorrarFacturaOrdenEstimacionDPorConceptoYNombre
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Jueves 21 de Mayo del 2015
-- Description:	Elimina las facturas por ID, Concepto y Nombre de la factura
-- =============================================
CREATE PROCEDURE web_spD_BorrarFacturaOrdenEstimacionDPorConceptoYNombre
	-- Add the parameters for the stored procedure here
	@ID					INT,
	@Concepto	CHAR(10),
	@NombreIMG VARCHAR(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE
		FacturasOrdenEstimacionD
		WHERE
		MovID = @ID AND Concepto = @Concepto AND Nombre = @NombreIMG
END
GO