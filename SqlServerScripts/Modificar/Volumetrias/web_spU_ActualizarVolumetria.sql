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
			WHERE  name = 'web_spU_ActualizarVolumetria' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarVolumetria
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 05 de Diciembre de 2014
-- Description:	Actualizar un registro de Revision por su ID
-- =============================================
CREATE PROCEDURE web_spU_ActualizarVolumetria
	-- Add the parameters for the stored procedure here
	@ID				INT,
	@Mov			CHAR(50),
	@MovID			CHAR(10),
	@Sucursal		CHAR(10),
	@Observaciones	VARCHAR(200),
	@Estatus		VARCHAR(10),
	@Preciario		CHAR(7),
	@Cliente		CHAR(8)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE
		Volumetrias
	SET
		Mov = @Mov,
		MovID = @MovID,
		Sucursal = @Sucursal,
		Observaciones = @Observaciones,
		Estatus = @Estatus,
		Preciario= @Preciario,
		Cliente = @Cliente
	WHERE
		ID = @ID
END
GO