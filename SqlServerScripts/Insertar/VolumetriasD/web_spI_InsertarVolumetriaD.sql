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
			WHERE  name = 'web_spI_InsertarVolumetriaD' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarVolumetriaD
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 05 de Diciembre de 2014
-- Description:	Insertar un registro de RevisionesD
-- =============================================
CREATE PROCEDURE web_spI_InsertarVolumetriaD
	-- Add the parameters for the stored procedure here
	@Volumetria	INT,
	@Renglon	SMALLINT,
	@ConceptoID	CHAR(10),
	@Cantidad	DECIMAL(10, 3),
	@Utilizada	DECIMAL(10, 3),
	@Fotos		VARCHAR(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @Utilizada = (SELECT SUM(gdv.Total) FROM GeneradorVolumetriaD gdv WHERE gdv.MovID = @Volumetria AND gdv.ConceptoID = @ConceptoID);
		-- Insert statements for procedure here
		INSERT INTO
			VolumetriasD
			(
				Volumetria,
				Renglon,
				ConceptoID,
				Cantidad,
				Utilizada,
				Fotos
			)
		VALUES
			(
				@Volumetria,
				@Renglon,
				@ConceptoID,
				@Cantidad,
				@Utilizada,
				@Fotos
			)
END
GO