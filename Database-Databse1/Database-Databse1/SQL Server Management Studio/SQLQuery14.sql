USE [ECommerce]
GO
/****** Object:  UserDefinedFunction [dbo].[udfCalculateDiscount]    Script Date: 7/24/2019 1:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
ALTER FUNCTION [dbo].[udfCalculateDiscount]
(
	-- Add the parameters for the function here

    @quantity INT,
    @price float,
    @discount Float

)
RETURNS 	 float
 
AS
BEGIN
	-- Declare the return variable here


	-- Add the T-SQL statements to compute the return value here
	
	-- Return the result of the function
	RETURN @quantity * @price * (1 -  @discount*100)/100;

END
