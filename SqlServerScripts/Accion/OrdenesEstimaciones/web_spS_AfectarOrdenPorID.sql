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
			WHERE  name = 'web_spS_AfectarOrdenPorID' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_AfectarOrdenPorID
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Lunes 02 de Febrero de 2015
-- Description:	Afectar un registro de Revisiones por su ID
-- =============================================
CREATE PROCEDURE web_spS_AfectarOrdenPorID
	-- Add the parameters for the stored procedure here
	@ID	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE OrdenesEstimaciones
    SET
		MovID = 'O' + CAST(ID AS VARCHAR(9)),
		Estatus = 'CONCLUIDO'
	WHERE
		ID = @ID
END
GO