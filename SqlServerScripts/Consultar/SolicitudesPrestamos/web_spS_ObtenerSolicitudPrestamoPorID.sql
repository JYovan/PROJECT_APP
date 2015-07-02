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
			WHERE  name = 'web_spS_ObtenerSolicitudPrestamoPorID' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerSolicitudPrestamoPorID
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Domingo 19 de Abril de 2015
-- Description:	Obtener un registro de Solicitud de préstamo por su ID
-- =============================================
CREATE PROCEDURE web_spS_ObtenerSolicitudPrestamoPorID
	-- Add the parameters for the stored procedure here
	@ID	CHAR(8)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		ID,
		Cliente,
		Nacionalidad,
		NumeroDependientes,
		Edades,
		RegistroMatrimonial,
		TipoCasa,
		AniosDomicilio,
		CalleAnterior,
		NoExteriorAnterior,
		NoInteriorAnterior,
		ColoniaAnterior,
		CodigoPostalAnterior,
		EntreCallesAnterior,
		EstadoAnterior,
		MunicipioAnterior,
		Antiguedad,
		Ingresos,
		OtrosIngresos,
		Concepto,
		JefeNombre,
		JefeAPAterno,
		JefeAMaterno,
		EmpresaAnterior,
		ConyugeNombre,
		ConyugeAPaterno,
		ConyugeAMaterno,
		ConyugeFechaNacimiento,
		ConyugeEdad,
		ConyugeRFC,
		ConyugeTelefono,
		ConyugeTelefonoMovil,
		ConyugeCalle,
		ConyugeEntreCalles,
		ConyugeNoExterior,
		ConyugeNoInterior,
		ConyugeColonia,
		ConyugeCodigoPostal,
		ConyugeEstado,
		ConyugeMunicipio,
		ConyugeAntiguedad,
		ConyugeIngresos,
		ConyugeOtrosIngresos,
		ConyugeConcepto,
		ConyugeEmpresa,
		ConyugePuesto,
		ConyugeEmpresaCalle,
		ConyugeEmpresaNoExterior,
		ConyugeEmpresaNoInterior,
		ConyugeEmpresaColonia,
		ConyugeEmpresaCodigoPostal,
		ConyugeEmpresaEntreCalles,
		ConyugeEmpresaEstado,
		ConyugeEmpresaMunicipio,
		ConyugeEmpresaJefeNombre,
		ConyugeEmpresaJefeAPaterno,
		ConyugeEmpresaJefeAMaterno,
		AvalNombre,
		AvalAPaterno,
		AvalAMaterno,
		AvalSocio,
		AvalEstadoCivil,
		AvalRegistroMatrimonial,
		AvalTelefono,
		AvalTelefonoMovil,
		AvalCalle,
		AvalEntreCalles,
		AvalNoExterior,
		AvalNoInterior,
		AvalColonia,
		AvalCodigoPostal,
		AvalEstado,
		AvalMunicipio,
		AvalTipoCasa,
		AvalAntiguedad,
		AvalEmpresa,
		AvalEmpresaPuesto,
		AvalEmpresaJefeNombre,
		AvalEmpresaJefeAPaterno,
		AvalEmpresaJefeAMaterno,
		AvalEmpresaAntiguedad,
		AvalEmpresaIngresos,
		AvalEmpresaOtrosIngresos,
		AvalEmpresaConcepto,
		AvalEmpresaPropietario,
		AvalEmpresaTipo,
		AvalEmpresaTelefono,
		AvalEmpresaTelefonoExt,
		AvalEmpresaAnterior,
		Cantidad,
		Plazo,
		FormaPago,
		DestinoPrestamo,
		Tipo,
		TablaAmortizacion,
		Estatus,
		UsuarioAlta,
		FechaAlta,
		UsuarioModificacion,
		FechaModificacion
	FROM
		SolicitudesPrestamos
	WHERE
		ID = @ID
END
GO