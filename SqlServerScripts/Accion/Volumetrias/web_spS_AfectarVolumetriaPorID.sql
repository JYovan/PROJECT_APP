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
			WHERE  name = 'web_spS_AfectarVolumetriaPorID' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_AfectarVolumetriaPorID
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Lunes 02 de Febrero de 2015
-- Description:	Afectar un registro de Revisiones por su ID
-- =============================================
CREATE PROCEDURE web_spS_AfectarVolumetriaPorID
	-- Add the parameters for the stored procedure here
	@ID	INT
AS
BEGIN

DECLARE 
@PRECIARIO CHAR(7),
@MOV VARCHAR(50)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE 
		Volumetrias
    SET
		MovID = 'V' + CAST(ID AS VARCHAR(9)),
		Estatus = 'CONCLUIDO'
	WHERE
		ID = @ID
	
	
		
	-- Asigna el ID del preciario del movimiento de volumetrias
	SELECT 
		@PRECIARIO = Preciario,
		@MOV=Mov
	FROM 
		Volumetrias 
	WHERE ID = @ID	
	
	-- ACTUALIZA EL ESTATUS DEL PRECIARIO SI ES MOV = FIN
	
	IF(@MOV = 'FIN')
	BEGIN
		UPDATE 
			PRECIARIOS
		SET 
			Estatus = 'CONCLUIDO'
		WHERE 
			ID=@PRECIARIO
	END
	
END
GO