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
-- Author:		<Giovanni Flores>
-- Create date: <2015-03-29>
-- Description:	<Elimina un codigo postal en base a su ID>
-- =============================================
-- =============================================
-- Create procedure basic template
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spD_BorrarCodigoPostal' AND
			TYPE = 'P')
	DROP PROCEDURE web_spD_BorrarCodigoPostal
GO
CREATE PROCEDURE web_spD_BorrarCodigoPostal
	-- Add the parameters for the stored procedure here
	@ID CHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE CodigosPostales WHERE CodigosPostales.ID = @ID;
END
GO
