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
			WHERE  name = 'web_spI_InsertarCliente' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarCliente
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miercoles 07 de Enero de 2015
-- Description:	Insertar un registro de Cliente
-- =============================================
CREATE PROCEDURE web_spI_InsertarCliente
	-- Add the parameters for the stored procedure here
	@ID						CHAR(8) OUTPUT,
	@Nombre					VARCHAR(50),
	@APaterno				VARCHAR(50),
	@AMaterno				VARCHAR(50),
	@Correo					VARCHAR(100),
	@Telefono				VARCHAR(15),
	@TelefonoMovil			VARCHAR(19),
	@Calle					VARCHAR(100),
	@NoExterior				VARCHAR(10),
	@NoInterior				VARCHAR(10), 
	@CodigoPostal			CHAR(10),
	@EntreCalles			VARCHAR(100), 
	@FechaAlta				SMALLDATETIME,
	@Estatus				VARCHAR(20),
	@Usuario				VARCHAR(50),
	@RutaLogo				VARCHAR(500),
	@Elaboro				VARCHAR(100),
	@Reviso					VARCHAR(100),
	@Autorizo				VARCHAR(100),
	@Proveedor				CHAR(7)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	--Formar el ID
	DECLARE
		@ID_TEMP INT,
		@VALOR CHAR(8)
		
		SELECT @ID_TEMP = MAX(CAST(SUBSTRING(ID, 4, LEN(ID)) AS INT)) FROM Clientes WHERE ID LIKE 'SOC%'
		IF (@ID_TEMP IS NOT NULL)
		BEGIN
			SET @ID_TEMP = @ID_TEMP + 1
		END
		ELSE
		BEGIN
			SET @ID_TEMP = 1
		END

		--DECIMAL
		IF ((@ID_TEMP / 10) < 1)
		BEGIN
			SET @VALOR = 'SOC0000' + CAST(@ID_TEMP AS CHAR(1))
		END
		ELSE IF ((@ID_TEMP / 100) < 1)
		BEGIN
			SET @VALOR = 'SOC000' + CAST(@ID_TEMP AS CHAR(2))
		END
		ELSE IF ((@ID_TEMP / 1000) < 1)
		BEGIN
			SET @VALOR = 'SOC00' + CAST(@ID_TEMP AS CHAR(3))
		END
		ELSE IF ((@ID_TEMP / 10000) < 1)
		BEGIN
			SET @VALOR = 'SOC0' + CAST(@ID_TEMP AS CHAR(4))
		END
		ELSE
		BEGIN
			SET @VALOR = 'SOC' + CAST(@ID_TEMP AS CHAR(5))
		END
		
		SELECT @ID = @VALOR

		-- Insert statements for procedure here
		INSERT INTO
			Clientes
			(
				ID,
				Nombre,
				APaterno,
				AMaterno, 
				Correo,
				Telefono,
				TelefonoMovil,
				Calle,
				NoExterior,
				NoInterior, 
				EntreCalles, 
				FechaAlta,
				Estatus,
				Usuario,
				RutaLogo,
				CodigoPostal,
				Elaboro,
				Reviso,
				Autorizo,
				Proveedor
			)
		VALUES 
			(
				@ID,
				@Nombre,
				@APaterno,
				@AMaterno, 
				@Correo,
				@Telefono,
				@TelefonoMovil,
				@Calle,
				@NoExterior,
				@NoInterior, 
				@EntreCalles, 
				@FechaAlta,
				@Estatus,
				@Usuario,
				@RutaLogo,
				@CodigoPostal,
				@Elaboro,
				@Reviso,
				@Autorizo,
				@Proveedor
			)
END
GO