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
			WHERE  name = 'web_spS_ObtenerSolicitudesPrestamos' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerSolicitudesPrestamos
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Domingo 19 de Abril de 2015
-- Description:	Obtener todos los registros de las solicitudes de prestamos
-- =============================================
CREATE PROCEDURE web_spS_ObtenerSolicitudesPrestamos
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		A.ID,
		B.Nombre,
		B.APaterno,
		B.AMaterno,
		A.Cantidad,
		A.Plazo,
		A.FechaAlta AS Inicio,
		DATEADD(DAY,A.Plazo,A.FechaAlta) AS Fin
	FROM
		SolicitudesPrestamos A
	INNER JOIN
		Clientes B
	ON
		A.Cliente = B.ID
END
GO