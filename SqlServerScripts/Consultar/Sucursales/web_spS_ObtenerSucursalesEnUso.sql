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
			WHERE  name = 'web_spS_ObtenerSucursalesEnUsoEnConcluidos' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerSucursalesEnUsoEnConcluidos
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Viernes 15 de Mayo 2015
-- Description:	Obtiene todas las Sucursales en Uso
-- =============================================
CREATE PROCEDURE web_spS_ObtenerSucursalesEnUsoEnConcluidos
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT
		s.ID,
		s.CR,
		s.Nombre,
		s.DireccionZona,
		s.GerenteBBVANombre,
		s.GerenteBBVAAPaterno,
		s.GerenteBBVAAMaterno,
		s.SupervisorNombre,
		s.SupervisorAPaterno,
		s.SupervisorAMaterno,
		s.ProveedorEnergia,
		s.Superficie,
		s.CoordinadorNombre,
		s.CoordinadorAPaterno,
		s.CoordinadorAMaterno,
		s.Calle,
		s.EntreCalles,
		s.NoExterior,
		s.NoInterior,
		s.CodigoPostal,
		s.Colonia,
		s.Estado,
		s.Municipio,
		s.Contratista,
		s.InicioObra,
		s.FinObra,
		s.SemanasObra,
		s.FechaAlta,
		s.Estatus,
		TipoConcepto,
		EmpresaSupervisora,
		TipoObra
	FROM
		Sucursales s 
		WHERE s.ID IN (SELECT oe.Sucursal FROM OrdenesEstimaciones oe 
		WHERE oe.Mov = 'Mesa de reporte' AND oe.Estatus = 'CONCLUIDO' AND MovEnLinea = 1);
END
GO