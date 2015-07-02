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
			WHERE  name = 'web_spU_FacturarMesaDeReporte' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_FacturarMesaDeReporte
GO
-- =============================================
-- Author:		Giovanni Flores
-- Create date: Lunes 01 de Junio de 2015
-- Description:	Facturar un registro de Mesa de Reporte con estatus concluido y MovLinea 1
-- =============================================
CREATE PROCEDURE web_spU_FacturarMesaDeReporte
	-- Add the parameters for the stored procedure here
	@ID				INT, 
	@Facturado			BIT,
	@Revisado			BIT,
	@FacturaMantenimiento VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
    -- Insert statements for procedure here  
	UPDATE OrdenesEstimaciones
	SET Facturado = @Facturado, Revisado = @Revisado, FacturaMantenimiento = @FacturaMantenimiento
	WHERE ID = @ID;
	END 
GO