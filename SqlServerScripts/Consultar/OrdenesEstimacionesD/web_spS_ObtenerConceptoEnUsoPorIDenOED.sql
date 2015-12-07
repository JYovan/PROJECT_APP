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
-- Author:		<Giovanni Flores>
-- Create date: <2015-11-17>
-- Description:	<Obtiene un concepto OED en base a su ID>
-- =============================================
-- =============================================
-- Create procedure basic template
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spS_ObtenerConceptoEnUsoPorIDenOED' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerConceptoEnUsoPorIDenOED
GO
CREATE PROCEDURE web_spS_ObtenerConceptoEnUsoPorIDenOED
	-- Add the parameters for the stored procedure here
	@ID INT,
	@CONCEPTOID CHAR(10) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS(SELECT OED.ConceptoID  FROM OrdenesEstimaciones OE INNER JOIN OrdenesEstimacionesD OED ON OE.ID = OED.ID WHERE OE.ID = @ID AND OED.ConceptoID = @CONCEPTOID)
	BEGIN
		SELECT CAST(1 AS BIT)
	END
	ELSE
	BEGIN
		SELECT CAST(0 AS BIT)
	END 

	END 