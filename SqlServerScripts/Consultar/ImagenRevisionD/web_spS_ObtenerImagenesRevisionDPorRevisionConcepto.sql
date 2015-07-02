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
			WHERE  name = 'web_spS_ObtenerImagenesRevisionDPorRevisionConcepto' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerImagenesRevisionDPorRevisionConcepto
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Lunes 22 de Junio de 2015
-- Description:	Obtener los registros de Imagenes Revisiones por su Revision y Concepto
-- =============================================
CREATE PROCEDURE web_spS_ObtenerImagenesRevisionDPorRevisionConcepto
	-- Add the parameters for the stored procedure here
	@Revision	INT,
	@Concepto	CHAR(7)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		Revision,
		Concepto,
		Nombre,
		Direccion,
		UsuarioAlta,
		FechaAlta
	FROM
		ImagenesRevisionesD
	WHERE
		Revision = @Revision AND
		Concepto = @Concepto
END
GO