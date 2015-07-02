

/****** Object:  StoredProcedure [dbo].[web_spS_ObtenerCodigoPostalPorId]    Script Date: 26/03/2015 18:37:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Giovanni Flores
-- Create date: 11-04-2015
-- Description:	Búsqueda de codigos por numero
-- =============================================
-- =============================================
-- Create procedure basic template
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spS_ObtenerCodigoPostalPorNumero' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerCodigoPostalPorNumero
GO
CREATE PROCEDURE [dbo].[web_spS_ObtenerCodigoPostalPorNumero]
	-- Add the parameters for the stored procedure here
	@Numero INT
	
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
	WHERE        (Numero = @Numero);

END

GO