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
			WHERE  name = 'web_spI_InsertarOrdenEstimacionD' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarOrdenEstimacionD
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 05 de Diciembre de 2014
-- Description:	Insertar un registro de RevisionesD
-- =============================================
CREATE PROCEDURE web_spI_InsertarOrdenEstimacionD
	-- Add the parameters for the stored procedure here
	@ID			INT,
	@Renglon	SMALLINT,
	@ConceptoID	CHAR(10),
	@Cantidad	DECIMAL(10, 6),
	@Unidad		VARCHAR(30),
	@Precio		DECIMAL(20, 6),
	@Importe	DECIMAL(20, 6),
	@IntExt		VARCHAR(30),
	@Moneda		VARCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @Cantidad = (SELECT god.Total FROM GeneradorOrdenEstimacionD god WHERE god.MovID = @ID AND god.ConceptoID = @ConceptoID);
		SET @Importe = (@Cantidad * @Precio);
		-- Insert statements for procedure here
		INSERT INTO
			OrdenesEstimacionesD
			(
				ID,
				Renglon,
				ConceptoID,
				Cantidad,
				Unidad,
				Precio,
				Importe,
				IntExt,
				Moneda
			)
		VALUES
			(
				@ID,
				@Renglon,
				@ConceptoID,
				@Cantidad,
				@Unidad,
				@Precio,
				@Importe,
				@IntExt,
				@Moneda
			)
END
GO