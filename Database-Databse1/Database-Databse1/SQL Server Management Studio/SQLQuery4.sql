USE [E-Com]
GO
/****** Object:  StoredProcedure [dbo].[udstpGetAccountDetails]    Script Date: 7/19/2019 12:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[udstpGetAccountDetails]
	-- Add the parameters for the stored procedure here
@AccountNo int,
	@Name  varchar(50),
	@Email varchar(100),
	@phoneNo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO	Account VALUES (@AccountNo,@Name,@Email,@PhoneNo);
END
GO

EXECUTE udstpInserData


Drop Procedure udstpGetAccountDetails