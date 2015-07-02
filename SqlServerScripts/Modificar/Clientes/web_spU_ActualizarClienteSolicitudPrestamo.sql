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
			WHERE  name = 'web_spU_ActualizarClienteSolicitudPrestamo' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarClienteSolicitudPrestamo
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Martes 21 de Abril de 2015
-- Description:	Actualizar un registro de Clientes por su ID para la Solicitud de Préstamo
-- =============================================
CREATE PROCEDURE web_spU_ActualizarClienteSolicitudPrestamo
	-- Add the parameters for the stored procedure here
	@ID						CHAR(8),
	@RFC					VARCHAR(15),
	@EstadoCivil			VARCHAR(10),
	@Correo					VARCHAR(100),
	@Telefono				VARCHAR(15),
	@TelefonoMovil			VARCHAR(19),
	@Calle					VARCHAR(100),
	@NoExterior				VARCHAR(10),
	@NoInterior				VARCHAR(10),
	@Colonia				CHAR(10),
	@CodigoPostal			INT,
	@EntreCalles			VARCHAR(100),
	@Estado					CHAR(2),
	@Municipio				CHAR(4),
	@Empresa				VARCHAR(50),
	@EmpresaCalle			VARCHAR(100),
	@EmpresaNoExterior		VARCHAR(10),
	@EmpresaNoInterior		VARCHAR(10),
	@EmpresaColonia			CHAR(10),
	@EmpresaCodigoPostal	INT,
	@EmpresaEntreCalles		VARCHAR(100),
	@EmpresaEstado			CHAR(2),
	@EmpresaMunicipio		CHAR(4),
	@EmpresaTelefono		VARCHAR(15),
	@EmpresaTelefonoExt		INT,
	@Puesto					VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE
		Clientes
	SET
		RFC = @RFC,
		EstadoCivil = @EstadoCivil,
		Correo = @Correo,
		Telefono = @Telefono,
		TelefonoMovil = @TelefonoMovil,
		Calle = @Calle,
		NoExterior = @NoExterior,
		NoInterior = @NoInterior,
		Colonia = @Colonia,
		CodigoPostal = @CodigoPostal,
		EntreCalles = @EntreCalles,
		Estado = @Estado,
		Municipio = @Municipio,
		Empresa = @Empresa,
		EmpresaCalle = @EmpresaCalle,
		EmpresaNoExterior = @EmpresaNoExterior,
		EmpresaNoInterior = @EmpresaNoInterior,
		EmpresaColonia = @EmpresaColonia,
		EmpresaCodigoPostal = @EmpresaCodigoPostal,
		EmpresaEntreCalles = @EmpresaEntreCalles,
		EmpresaEstado = @EmpresaEstado,
		EmpresaMunicipio = @EmpresaMunicipio,
		EmpresaTelefono = @EmpresaTelefono,
		EmpresaTelefonoExt = @EmpresaTelefonoExt,
		Puesto = @Puesto
	WHERE
		ID = @ID
END
GO