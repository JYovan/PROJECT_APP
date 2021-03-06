
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
			WHERE  name = 'web_spS_ObtenerMainSaverEnCodigoPPTA' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerMainSaverEnCodigoPPTA
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Lunes 04 de Mayo de 2015
-- Description:	Obtener los registros de CodigoPPTA por su Codigo Main Saver
-- =============================================
CREATE PROCEDURE web_spS_ObtenerMainSaverEnCodigoPPTA
	-- Add the parameters for the stored procedure here
@CodigoMainSaver CHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    	IF EXISTS(SELECT A.CodigoMainSaver FROM CodigoPPTA A  WHERE A.CodigoMainSaver = @CodigoMainSaver)
	BEGIN
		SELECT CAST(1 AS BIT)
	END
	ELSE
	BEGIN
		SELECT CAST(0 AS BIT)
	END 
END
GO
