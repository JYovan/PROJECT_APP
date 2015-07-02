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
			WHERE  name = 'web_spU_ActualizarPreciarioGeneralConceptoAdicional' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarPreciarioGeneralConceptoAdicional
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Lunes 19 de Abril de 2015
-- Description:	Actualiza un registro de Concepto Adicional
-- =============================================
CREATE PROCEDURE web_spU_ActualizarPreciarioGeneralConceptoAdicional
	-- Add the parameters for the stored procedure here
	@ID				CHAR(10),
	@CLAVE			CHAR(30),
	@Preciario		VARCHAR(7),
	@Descripcion	VARCHAR(2000),
	@Categoria		CHAR(10),
	@SubCategoria	CHAR(10),
	@SubSubCategoria CHAR(10),
	@Unidad			VARCHAR(30),
	@Costo			DECIMAL(20,2),
	@Cantidad		DECIMAL(10,2),
	@Usuario		VARCHAR(50),
	@Estatus		VARCHAR(20), 
	@Moneda			VARCHAR(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 
    -- Insert statements for procedure here 
UPDATE [dbo].[PreciariosGeneralesConceptos]
   SET [CLAVE] = @CLAVE
      ,[Preciario] = @Preciario
      ,[Descripcion] = @Descripcion
      ,[Categoria] = @Categoria
      ,[SubCategoria] = @SubCategoria
      ,[SubSubCategoria] = @SubSubCategoria
      ,[Unidad] = @Unidad
      ,[Costo] = @Costo
      ,[Cantidad] = @Cantidad
      ,[Usuario] = @Usuario
      ,[Estatus] = @Estatus 
      ,[MONEDA] = @Moneda
 WHERE [ID] = @ID;

END
GO