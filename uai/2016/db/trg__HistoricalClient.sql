-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Marco Puccio>
-- Create date: <19/04/2016>
-- Description:	<Historic update of client trigger>
-- =============================================
CREATE TRIGGER [dbo].[HistoricalClientEmail]
   ON  [dbo].[Cliente]
   AFTER  UPDATE
AS

IF( UPDATE(email) ) 
BEGIN
	SET NOCOUNT ON;
	INSERT INTO [dbo].[HistoricoCliente]
	SELECT i.id_cliente,d.email, i.email  FROM inserted I
	JOIN deleted d 
	ON I.id_cliente = D.id_cliente
END
GO