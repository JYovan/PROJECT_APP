
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
			WHERE  name = 'web_spS_ObtenerSucursalesDisponibles' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerSucursalesDisponibles
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miercoles 14 de Enero de 2015
-- Description:	Obtener los registros de Sucursales por su Revisión
-- =============================================
CREATE PROCEDURE web_spS_ObtenerSucursalesDisponibles
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT  

		A.ID,
		A.CR,
		A.Nombre,
		A.DireccionZona,
		A.GerenteBBVANombre,
		A.GerenteBBVAAPaterno,
		A.GerenteBBVAAMaterno,
		A.SupervisorNombre,
		A.SupervisorAPaterno,
		A.SupervisorAMaterno,
		A.ProveedorEnergia,
		A.Superficie,
		A.CoordinadorNombre,
		A.CoordinadorAPaterno,
		A.CoordinadorAMaterno,
		A.Calle,
		A.EntreCalles,
		A.NoExterior,
		A.NoInterior,
		A.CodigoPostal,
		A.Colonia,
		A.Estado,
		A.Municipio,
		A.Contratista,
		A.InicioObra,
		A.FinObra,
		A.SemanasObra,
		A.FechaAlta,
		A.Estatus ,
		A.TipoConcepto,
		A.EmpresaSupervisora,
		A.TipoObra,
		A.Cliente
	FROM 
		Sucursales A 
	WHERE NOT EXISTS(SELECT B.ID FROM Preciarios B  WHERE A.ID = B.Sucursal)
	ORDER BY A.ID ASC
	
	
	
END
GO

