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
			WHERE  name = 'web_spD_BorrarPorRevisionConceptoNombre' AND
			TYPE = 'P')
	DROP PROCEDURE web_spD_BorrarPorRevisionConceptoNombre
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Martes 23 de Junio de 2015
-- Description:	Eliminar una imagen por su Revision, Concepto y su Nombre
-- =============================================
CREATE PROCEDURE web_spD_BorrarPorRevisionConceptoNombre
	-- Add the parameters for the stored procedure here
	@Revision	INT,
	@Concepto	CHAR(7),
	@Nombre		VARCHAR(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE
		ImagenesRevisionesD
	WHERE
		Revision = @Revision AND
		Concepto = @Concepto AND
		Nombre = @Nombre
END
GO