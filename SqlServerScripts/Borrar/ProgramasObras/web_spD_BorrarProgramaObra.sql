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
			WHERE  name = 'web_spD_BorrarProgramaObra' AND
			TYPE = 'P')
	DROP PROCEDURE web_spD_BorrarProgramaObra
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miercoles 9 de Septiembre de 2015
-- Description:	Borrar un registro de Programa de Obra por su ID
-- =============================================
CREATE PROCEDURE web_spD_BorrarProgramaObra
	-- Add the parameters for the stored procedure here
	@Id	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
    DECLARE @Sucursal CHAR(10)
    
    SELECT @Sucursal=SucursalId FROM ProgramasObras WHERE Id = @Id
    
    DELETE FROM
		Tasks
	WHERE
		SucursalIdRaw = @Sucursal
    
    DELETE FROM
		ProgramasObras
	WHERE
		Id = @Id
END
GO