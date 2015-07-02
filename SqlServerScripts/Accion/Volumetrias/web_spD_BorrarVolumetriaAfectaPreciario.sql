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
			WHERE  name = 'web_spD_BorrarVolumetriaAfectaPreciario' AND
			TYPE = 'P')
	DROP PROCEDURE web_spD_BorrarVolumetriaAfectaPreciario
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Martes 03 de Febrero de 2015
-- Description:	Avanzar un registro de Revisiones por su ID
-- =============================================
CREATE PROCEDURE web_spD_BorrarVolumetriaAfectaPreciario
	-- Add the parameters for the stored procedure here
	@ID			INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
	UPDATE PreciarioConceptos
	SET 
		Utilizada = PreciarioConceptos.Cantidad,
		ImporteFinal = PreciarioConceptos.Importe
	FROM 
		PreciarioConceptos
	INNER JOIN 
		VolumetriasD VD
	ON
		PreciarioConceptos.ID =VD.ConceptoID
	WHERE VD.Volumetria= @ID
	
	

    
END
GO


