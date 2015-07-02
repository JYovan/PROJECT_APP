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
			WHERE  name = 'web_spS_CancelarVolumetriaPorID' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_CancelarVolumetriaPorID
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Martes 03 de Febrero de 2015
-- Description:	Avanzar un registro de Revisiones por su ID
-- =============================================
CREATE PROCEDURE web_spS_CancelarVolumetriaPorID
	-- Add the parameters for the stored procedure here
	@ID			INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	
	--declaramos una variable que guarde el movimiento
	 DECLARE @MOV VARCHAR(50),
	 @PRECIARIO CHAR(7)
	--asiganmos valor del movimeinto a la variable
	SELECT 
		@MOV = MOV ,
		@PRECIARIO = Preciario
	FROM 
		Volumetrias 
	WHERE 
		ID=@ID
	-- SI MOVIMIENTO ES--------------------------------FIN
	IF(@MOV LIKE 'Fin')
		BEGIN 
			UPDATE 
				Preciarios
			SET
				Estatus ='ACTIVO'
				WHERE 
				ID=@PRECIARIO
			
			 UPDATE 
				Volumetrias
			SET
				Estatus = 'CANCELADO'
			WHERE
				ID = @ID	
				
		END
	--- MOVIMIENTO ES--------------------------------CAPTURA
	ELSE

		UPDATE 
			Volumetrias
		SET
			Estatus = 'CANCELADO'
		WHERE
			ID = @ID

		
		--ACTUALIZAMOS CAMPOS DE PRECIARIO CONCEPTO
		
		UPDATE PreciarioConceptos
		SET 
			Utilizada =(PreciarioConceptos.Utilizada- VD.Utilizada)
		FROM 
			PreciarioConceptos
		INNER JOIN 
			VolumetriasD VD
		ON
			PreciarioConceptos.ID =VD.ConceptoID
		WHERE VD.Volumetria= @ID
		
		
		UPDATE PreciarioConceptos
		SET 
			ImporteFinal = (PreciarioConceptos.Costo*PreciarioConceptos.Utilizada)
		FROM 
			PreciarioConceptos
		INNER JOIN 
			VolumetriasD VD
		ON
			PreciarioConceptos.ID =VD.ConceptoID
		WHERE VD.Volumetria= @ID
		

END
GO


