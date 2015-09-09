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
			WHERE  name = 'web_spS_ObtenerSucursalesSinProgramaObra' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerSucursalesSinProgramaObra
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miercoles 09 de Septiembre de 2015
-- Description:	Obtener los registros de Sucursales que aun no tengan una obra asignada
-- =============================================
CREATE PROCEDURE web_spS_ObtenerSucursalesSinProgramaObra
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		ID,
		CR,
		DireccionZona,
		Nombre,
		GerenteBBVANombre,
		GerenteBBVAAPaterno,
		GerenteBBVAAMaterno,
		SupervisorNombre,
		SupervisorAPaterno,
		SupervisorAMaterno,
		ProveedorEnergia,
		Superficie,
		CoordinadorNombre,
		CoordinadorAPaterno,
		CoordinadorAMaterno,
		Calle,
		EntreCalles,
		NoExterior,
		NoInterior,
		CodigoPostal,
		Colonia,
		Estado,
		Municipio,
		Contratista,
		InicioObra,
		FinObra,
		SemanasObra,
		TipoConcepto,
		EmpresaSupervisora,
		TipoObra,
		Cliente,
		FechaAlta,
		Estatus
	FROM 
		Sucursales
	WHERE NOT EXISTS(SELECT Id FROM ProgramasObras WHERE Sucursales.ID = ProgramasObras.SucursalId)
	ORDER BY Sucursales.ID ASC
	
	
	
END
GO

