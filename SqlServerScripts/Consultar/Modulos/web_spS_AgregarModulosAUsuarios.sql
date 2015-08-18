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
-- Author:		Giovanni Flores
-- Create date: 01 Agosto 2015
-- Description:	Cursor para agregarle registros a cada usuario con permisos nulos
-- =============================================
CREATE PROCEDURE web_spS_AgregarModulosAUsuarios
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @mID VARCHAR(50)
	DECLARE @uID VARCHAR(50)
	DECLARE @ID INT;

	DECLARE cUXM CURSOR LOCAL STATIC READ_ONLY FORWARD_ONLY
	FOR SELECT m.ID mID, u.ID uID FROM Modulos m, Usuarios u;

	OPEN cUXM
	FETCH NEXT FROM cUXM INTO @mID, @uID
	WHILE @@FETCH_STATUS = 0
	BEGIN 
		--Do something with Id here
		IF @ID IS NULL BEGIN
			SET @ID = 1;
		END
		ELSE 
			SET @ID += 1;
	
		INSERT INTO [dbo].[UsuarioXModulo] ([ID],[UsuarioID],[ModuloID],[Permiso])
		 VALUES (@ID, @uID,@mID,0);
		   
		FETCH NEXT FROM cUXM INTO @mID, @uID
	END
	CLOSE cUXM
	DEALLOCATE cUXM
END
GO
