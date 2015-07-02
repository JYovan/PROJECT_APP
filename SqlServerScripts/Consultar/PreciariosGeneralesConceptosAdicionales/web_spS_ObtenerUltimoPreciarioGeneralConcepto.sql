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
			WHERE  name = 'web_spS_ObtenerUltimoPreciarioGeneralConcepto' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerUltimoPreciarioGeneralConcepto
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Martes 25 de Abril de 2015
-- Description:	Obtiene el ultimo concepto adicional
-- =============================================
CREATE PROCEDURE web_spS_ObtenerUltimoPreciarioGeneralConcepto
	-- Add the parameters for the stored procedure here
	
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	DECLARE @ADICIONAL CHAR(30);

	SET @ADICIONAL = (SELECT TOP(1) 'ADC-' + 
	CASE 
	WHEN pgc.CLAVE = null THEN '001'
	WHEN (LEN(CAST(SUBSTRING(pgc.CLAVE,5,3) as int) + 1)) = 1 THEN '00' + CAST(CAST(SUBSTRING(pgc.CLAVE,5,3) as int) + 1 as CHAR(30))
	WHEN (LEN(CAST(SUBSTRING(pgc.CLAVE,5,3) as int) + 1)) = 2 THEN '0' + CAST(CAST(SUBSTRING(pgc.CLAVE,5,3) as int) + 1 as CHAR(30))
	WHEN (LEN(CAST(SUBSTRING(pgc.CLAVE,5,3) as int) + 1)) = 3 THEN CAST(CAST(SUBSTRING(pgc.CLAVE,5,3) as int) + 1 as CHAR(30))
	END
	FROM [PreciariosGeneralesConceptos] pgc 
	WHERE pgc.CLAVE LIKE 'ADC-%' 
	ORDER BY pgc.ID DESC);  
	IF(@ADICIONAL IS NULL)
		SET @ADICIONAL = 'ADC-001'; 
	SELECT @ADICIONAL ;
	
END
GO