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
			WHERE  name = 'web_spS_ObtenerRevisionPorSucursal' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerRevisionPorSucursal
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miércoles 09 de Septiembre de 2015
-- Description:	Obtener un registro de Revisiones por Sucursal
-- =============================================
CREATE PROCEDURE web_spS_ObtenerRevisionPorSucursal
	-- Add the parameters for the stored procedure here
	@Sucursal	CHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		ID,
		Mov,
		MovID,
		Origen,
		OrigenID,
		Semana,
		Sucursal,
		FechaEmision,
		FechaRevision,
		Observaciones,
		Comentarios,
		Estatus
	FROM
		Revisiones
	WHERE
		Sucursal = @Sucursal
END
GO