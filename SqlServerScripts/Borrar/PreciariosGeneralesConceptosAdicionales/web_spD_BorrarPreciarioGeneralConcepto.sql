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
			WHERE  name = 'web_spD_BorrarPreciarioGeneralConceptoAdicional' AND
			TYPE = 'P')
	DROP PROCEDURE web_spD_BorrarPreciarioGeneralConceptoAdicional
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Martes 28 de Abril de 2015
-- Description:	Borrar un registro de Conceptos por su ID
-- =============================================
CREATE PROCEDURE web_spD_BorrarPreciarioGeneralConceptoAdicional
	-- Add the parameters for the stored procedure here
	@ID			CHAR(10),
	@CLAVE		CHAR(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here 
    DELETE FROM
		PreciariosGeneralesConceptos
	WHERE
		ID = @ID AND 
		CLAVE = @CLAVE
END
GO