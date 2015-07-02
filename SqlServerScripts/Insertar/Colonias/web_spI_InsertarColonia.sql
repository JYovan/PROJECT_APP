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
			WHERE  name = 'web_spI_InsertarColonia' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarColonia
GO
-- =============================================
-- Author:		Christian Medina
-- Create date: Martes 20 de Enero de 2015
-- Description:	Insertar un registro de Colonia
-- =============================================
CREATE PROCEDURE web_spI_InsertarColonia
	-- Add the parameters for the stored procedure here
	@ID				CHAR(10) OUTPUT,
	@Descripcion	VARCHAR(50),
	@Estado			VARCHAR(4),
	@Municipio		VARCHAR(6)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--Formar el ID
	DECLARE
		@ID_TEMP INT,
		@VALOR CHAR(10)
		
		SELECT @ID_TEMP = MAX(CAST(SUBSTRING(ID, 4, LEN(ID)) AS INT)) FROM Colonias WHERE ID LIKE 'COL%'
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
			SET @VALOR = 'COL000000' + CAST(@ID_TEMP AS CHAR(1))
		END
		ELSE IF ((@ID_TEMP / 100) < 1)
		BEGIN
			SET @VALOR = 'COL00000' + CAST(@ID_TEMP AS CHAR(2))
		END
		ELSE IF ((@ID_TEMP / 1000) < 1)
		BEGIN
			SET @VALOR = 'COL0000' + CAST(@ID_TEMP AS CHAR(3))
		END
		ELSE IF ((@ID_TEMP / 10000) < 1)
		BEGIN
			SET @VALOR = 'COL000' + CAST(@ID_TEMP AS CHAR(4))
		END
		ELSE IF ((@ID_TEMP / 100000) < 1)
		BEGIN
			SET @VALOR = 'COL00' + CAST(@ID_TEMP AS CHAR(5))
		END
		ELSE  IF ((@ID_TEMP / 1000000) < 1)
		BEGIN
			SET @VALOR = 'COL0' + CAST(@ID_TEMP AS CHAR(6))
		END
		ELSE
		BEGIN
			SET @VALOR = 'COL' + CAST(@ID_TEMP AS CHAR(7))
		END
		
		SELECT @ID = @VALOR

	
	
    -- Insert statements for procedure here
    INSERT INTO
		Colonias
		(
			ID,
			Descripcion,
			Estado,
			Municipio)
	VALUES (
			@ID,
			@Descripcion,
			@Estado,
			@Municipio
			)
END
GO