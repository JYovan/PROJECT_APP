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
			WHERE  name = 'web_spU_ActualizarOrdenEstimacionD' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarOrdenEstimacionD
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 05 de Diciembre de 2014
-- Description:	Actualizar un registro de RevisionesD por su ID
-- =============================================
CREATE PROCEDURE web_spU_ActualizarOrdenEstimacionD
	-- Add the parameters for the stored procedure here
	@ID			INT,
	@Renglon	SMALLINT,
	@ConceptoID	CHAR(10),
	@Cantidad	DECIMAL(10,2),
	@Unidad		VARCHAR(30),
	@Precio		DECIMAL(20, 2),
	@Importe	DECIMAL(20, 2),
	@Moneda		VARCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE
		OrdenesEstimacionesD
	SET
		ConceptoID = @ConceptoID,
		Cantidad = @Cantidad,
		Unidad = @Unidad,
		Precio = @Precio,
		Importe= @Importe,
		Moneda = @Moneda
	WHERE
		ID = @ID AND
		Renglon = @Renglon
END
GO