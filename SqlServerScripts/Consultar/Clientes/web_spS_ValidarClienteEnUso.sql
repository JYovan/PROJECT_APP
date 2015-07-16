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
			WHERE  name = 'web_spS_ValidarClienteEnUso' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ValidarClienteEnUso
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Miercoles 15 de Julio de 2015
-- Description:	Obtener un registro de un Cliente por su ID
-- =============================================
CREATE PROCEDURE web_spS_ValidarClienteEnUso
	-- Add the parameters for the stored procedure here
	@ID		VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;  
    -- Insert statements for procedure here
	IF EXISTS(SELECT c.ID FROM Clientes c WHERE c.ID = @ID AND c.Estatus = 'ALTA')  
	OR EXISTS(SELECT c.ID FROM Clientes c WHERE c.ID IN(SELECT s.Cliente FROM Sucursales s WHERE s.Cliente = @ID)) 
	OR EXISTS(SELECT c.ID FROM Clientes c WHERE c.ID IN(SELECT v.Cliente FROM Volumetrias v WHERE v.Cliente = @ID)) 
	OR EXISTS(SELECT c.ID FROM Clientes c WHERE c.ID IN(SELECT oe.Cliente FROM OrdenesEstimaciones oe WHERE oe.Cliente = @ID))
	BEGIN 
		SELECT CAST(0 AS BIT)  
	END
	ELSE
	BEGIN
		SELECT CAST(1 AS BIT) 
	END  
END
GO