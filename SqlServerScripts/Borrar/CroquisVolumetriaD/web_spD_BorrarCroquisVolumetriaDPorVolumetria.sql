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
			WHERE  name = 'web_spD_BorrarCroquisVolumetriaDPorVolumetria' AND
			TYPE = 'P')
	DROP PROCEDURE web_spD_BorrarCroquisVolumetriaDPorVolumetria
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Jueves 20 de Agosto de 2015
-- Description:	Elimina el croquis por volumetria
-- =============================================
CREATE PROCEDURE web_spD_BorrarCroquisVolumetriaDPorVolumetria
	-- Add the parameters for the stored procedure here
	@ID			INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE
		CroquisVolumetriaD
	WHERE
		MovID = @ID 
END
GO