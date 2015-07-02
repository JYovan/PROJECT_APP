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
-- Author:		<Giovanni,Name>
-- Create date: <Create Date,>
-- Description:	<Description,,>
-- =============================================
-- =============================================
-- Create procedure basic template
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spI_InsertarCodigoPostal' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarCodigoPostal
GO
CREATE PROCEDURE web_spI_InsertarCodigoPostal
	-- Add the parameters for the stored procedure here
	@ID						CHAR(10) OUTPUT,
	@Estado					CHAR(2),
	@Municipio				CHAR(4),
	@Colonia				CHAR(10),
	@Numero					INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE
		@ID_TEMP INT,
		@VALOR CHAR(10)
		
		SELECT @ID_TEMP = MAX(CAST(SUBSTRING(ID, 3, LEN(ID)) AS INT)) FROM CodigosPostales WHERE ID LIKE 'CP%'
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
			SET @VALOR = 'CP0000000' + CAST(@ID_TEMP AS CHAR(1))
		END
		ELSE IF ((@ID_TEMP / 100) < 1)
		BEGIN
			SET @VALOR = 'CP000000' + CAST(@ID_TEMP AS CHAR(2))
		END
		ELSE IF ((@ID_TEMP / 1000) < 1)
		BEGIN
			SET @VALOR = 'CP00000' + CAST(@ID_TEMP AS CHAR(3))
		END
		ELSE IF ((@ID_TEMP / 10000) < 1)
		BEGIN
			SET @VALOR = 'CP0000' + CAST(@ID_TEMP AS CHAR(4))
		END
		ELSE IF ((@ID_TEMP / 100000) < 1)
		BEGIN
			SET @VALOR = 'CP000' + CAST(@ID_TEMP AS CHAR(5))
		END
		ELSE  IF ((@ID_TEMP / 1000000) < 1)
		BEGIN
			SET @VALOR = 'CP00' + CAST(@ID_TEMP AS CHAR(6))
		END
		ELSE IF ((@ID_TEMP / 10000000) < 1)
		BEGIN
			SET @VALOR = 'CP0' + CAST(@ID_TEMP AS CHAR(7))
		END
		ELSE 
		BEGIN
			SET @VALOR ='CP'+CAST(@ID_TEMP AS CHAR(8))
		END
		
		SELECT @ID = @VALOR

    -- Insert statements for procedure here
	INSERT INTO [dbo].[CodigosPostales]
           ([ID]
           ,[Estado]
           ,[Municipio]
           ,[Colonia]
           ,[Numero])
     VALUES
           (@ID
           ,@Estado
           ,@Municipio
           ,@Colonia
           ,@Numero);

END
GO
