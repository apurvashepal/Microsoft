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
CREATE PROCEDURE udspCallFunction

	
	@ItemId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
 declare @quantity INT;
    Declare @price DEC(10,2);
    Declare @discount DEC(4,2);
	Declare @discountedPrice DEC(10,2);
	Declare @ID int;
	SET NOCOUNT ON;

select @quantity  = quantity from Inventory;
select @price =  Price  from Inventory;
select @discount = DiscountPercentage from DiscountCoupon;
select @Id =  ItemId from Inventory;

    -- Insert statements for procedure here
select	@discountedPrice =  dbo.udfCalculateDiscount(@quantity,@price,@discount);
update Inventory set Price = @price where @Id = @ItemId;
END
GO
