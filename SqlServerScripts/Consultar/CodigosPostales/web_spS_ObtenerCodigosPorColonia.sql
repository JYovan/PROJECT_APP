

/****** Object:  StoredProcedure [dbo].[web_spS_ObtenerCodigosPorColonia]    Script Date: 26/03/2015 18:38:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- =============================================
-- Create procedure basic template
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spS_ObtenerCodigosPorColonia' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerCodigosPorColonia
GO
CREATE PROCEDURE [dbo].[web_spS_ObtenerCodigosPorColonia]
	-- Add the parameters for the stored procedure here
	@IdColonia VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here      
SELECT        dbo.CodigosPostales.ID, dbo.Estados.ID AS Estado, dbo.Municipios.ID AS Municipio, dbo.Colonias.ID AS Colonia, 
                         dbo.CodigosPostales.Numero
FROM            dbo.Estados INNER JOIN
                         dbo.Municipios ON dbo.Estados.ID = dbo.Municipios.Estado INNER JOIN
                         dbo.Colonias ON dbo.Estados.ID = dbo.Colonias.Estado AND dbo.Municipios.ID = dbo.Colonias.Municipio INNER JOIN
                         dbo.CodigosPostales ON dbo.Estados.ID = dbo.CodigosPostales.Estado AND dbo.Municipios.ID = dbo.CodigosPostales.Municipio AND 
                         dbo.Colonias.ID = dbo.CodigosPostales.Colonia
WHERE        (dbo.Colonias.ID = @IdColonia);

END

GO