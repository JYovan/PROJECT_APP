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
			WHERE  name = 'web_spS_ObtenerVolumetriasDPorVolumetria' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerVolumetriasDPorVolumetria
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 05 de Diciembre de 2014
-- Description:	Obtener todos los registros de RevisionesD por la relación con Revision
-- =============================================
CREATE PROCEDURE web_spS_ObtenerVolumetriasDPorVolumetria
	-- Add the parameters for the stored procedure here
	@Volumetria	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		vd.Volumetria,
		vd.Renglon,
		vd.ConceptoID,
		vd.Cantidad,
		vd.Utilizada,
		vd.Fotos,
		pc.CLAVE
	FROM
		VolumetriasD vd INNER JOIN dbo.PreciarioConceptos pc
	ON vd.ConceptoID = pc.ID AND vd.Volumetria = @Volumetria
END
GO