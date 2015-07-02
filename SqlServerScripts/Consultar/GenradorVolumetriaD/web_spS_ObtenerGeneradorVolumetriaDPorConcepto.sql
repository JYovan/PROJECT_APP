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
			WHERE  name = 'web_spS_ObtenerGeneradorVolumetriaDPorConcepto' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerGeneradorVolumetriaDPorConcepto
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 20 de Febrero de 2014
-- Description:	Obtener los registros de Imagenes Volumetrias por su Volumetria y PreciarioConcepto
-- =============================================
CREATE PROCEDURE web_spS_ObtenerGeneradorVolumetriaDPorConcepto
	-- Add the parameters for the stored procedure here
	@ID			INT,
	@Concepto	CHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		MovID,
		ConceptoID,
		Descripcion,
		Eje,
		EntreEje1,
		EntreEje2,
		Area,
		Largo,
		Ancho,
		Alto,
		Cantidad,
		Total
	FROM
		GeneradorVolumetriaD
	WHERE
		MovID = @ID AND ConceptoID = @Concepto
END
GO