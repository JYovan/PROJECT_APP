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
			WHERE  name = 'web_spD_BorrarImagenPorIDPorConceptoYPorNombre' AND
			TYPE = 'P')
	DROP PROCEDURE web_spD_BorrarImagenPorIDPorConceptoYPorNombre
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Viernes 20 de Febrero de 2014
-- Description:	Borrar imagen por Volumetria, Concepto y Nombre
-- =============================================
CREATE PROCEDURE web_spD_BorrarImagenPorIDPorConceptoYPorNombre
	-- Add the parameters for the stored procedure here
	@Volumetria			INT,
	@PreciarioConcepto CHAR(10),
	@Nombre				VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRANSACTION 
		DELETE ImagenesVolumetriasD
		WHERE Volumetria = @Volumetria AND PreciarioConcepto = @PreciarioConcepto AND Nombre = @Nombre;
	COMMIT;
END
GO