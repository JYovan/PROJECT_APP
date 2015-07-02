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
			WHERE  name = 'web_spS_ObtenerTodosRespuestas' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerTodosRespuestas
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miercoles 06 de Agosto de 2014
-- Description:	Obtener todas las respuestas
-- =============================================
CREATE PROCEDURE web_spS_ObtenerTodosRespuestas
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		ID,
		Participante,
		Respuesta01,
		Respuesta02,
		Respuesta03,
		Respuesta04,
		Respuesta05
	FROM
		Respuestas
END
GO