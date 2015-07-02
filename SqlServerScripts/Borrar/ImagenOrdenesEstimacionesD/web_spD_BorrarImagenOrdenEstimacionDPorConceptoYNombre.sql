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
			WHERE  name = 'web_spD_BorrarImagenOrdenEstimacionDPorConceptoYNombre' AND
			TYPE = 'P')
	DROP PROCEDURE web_spD_BorrarImagenOrdenEstimacionDPorConceptoYNombre
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Miercoles 20 de Mayo de 2015
-- Description:	Eliminar una imagen por su MovID, ConceptoID y su nombre
-- =============================================
CREATE PROCEDURE web_spD_BorrarImagenOrdenEstimacionDPorConceptoYNombre
	-- Add the parameters for the stored procedure here
	@ID					INT,
	@Concepto	CHAR(10),
	@NombreIMG		VARCHAR(500)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE
		ImagenesOrdenEstimacionD
		WHERE
		MovID = @ID AND Concepto = @Concepto AND Nombre = @NombreIMG;
END
GO