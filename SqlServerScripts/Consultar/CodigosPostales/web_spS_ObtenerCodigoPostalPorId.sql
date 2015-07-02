

/****** Object:  StoredProcedure [dbo].[web_spS_ObtenerCodigoPostalPorId]    Script Date: 26/03/2015 18:37:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Giovanni Flores
-- Create date: 04-04-2015
-- Description:	Obtiene codigos postales por su ID
-- =============================================
-- =============================================
-- Create procedure basic template
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spS_ObtenerCodigoPostalPorId' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerCodigoPostalPorId
GO
CREATE PROCEDURE [dbo].[web_spS_ObtenerCodigoPostalPorId]
	-- Add the parameters for the stored procedure here
	@ID char(10)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        
	ID, 
	Estado, 
	Municipio, 
	Colonia, 
	Numero
	FROM            dbo.CodigosPostales
	WHERE        (ID = @ID);

END

GO