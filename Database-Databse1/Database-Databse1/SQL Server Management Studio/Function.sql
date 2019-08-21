-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION udfCalculateDiscount
(
	-- Add the parameters for the function here

    @quantity INT,
    @list_price DEC(10,2),
    @discount DEC(4,2)

)
RETURNS 	 DEC(10,2)
 
AS
BEGIN
	-- Declare the return variable here


	-- Add the T-SQL statements to compute the return value here
	
	-- Return the result of the function
	RETURN @quantity * @list_price * (1 - @discount);

END
GO

drop Function udfCaculateDiscount
