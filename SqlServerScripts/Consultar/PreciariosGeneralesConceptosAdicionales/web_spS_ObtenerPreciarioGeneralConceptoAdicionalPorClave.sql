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
			WHERE  name = 'web_spS_ObtenerPreciarioGeneralConceptoAdicionalPorClave' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerPreciarioGeneralConceptoAdicionalPorClave
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Lunes 20 de Abril de 2015
-- Description:	Obtener un registro de Concepto Adicional por su clave
-- =============================================
CREATE PROCEDURE web_spS_ObtenerPreciarioGeneralConceptoAdicionalPorClave
	-- Add the parameters for the stored procedure here
	@CLAVE		CHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	IF EXISTS(SELECT A.ID FROM PreciariosGeneralesConceptos A WHERE A.CLAVE = @CLAVE)
	BEGIN
		SELECT CAST(1 AS BIT)
	END
	ELSE
	BEGIN
		SELECT CAST(0 AS BIT)
	END  
END
GO