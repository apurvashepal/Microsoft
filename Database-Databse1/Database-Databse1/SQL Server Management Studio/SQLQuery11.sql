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
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE udstpRefund
	-- Add the parameters for the stored procedure here
	@InvoiceId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @orderstate varchar(50);
	Declare @AccountNo int;
	Declare @OrderID int.;
    -- Insert statements for procedure here
	Select @Orderstate = Iv.OrderStatus from Invoice as Iv;
	Select @AccountNo = AccountNo from Invoice ;
	Select @OrderId = OrderId from Invoice;
	if @OrderState = 'Returned'
	begin
	update  OrderTable set  OrderStatus ='Refunded' where (AccountNo = @AccountNo && OrderId == @OrderId) ;
	End

    Else
		Begin

		Print 'No Returened Orders';
       	End
	

END
GO
