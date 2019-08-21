CREATE TRIGGER [dbo] InstedExample
ON {DailyReport}
INSTEAD OF {INSERT }
AS
BEGIN
SET NOCOUNT ON 
insert into OrderTable values (OrderId,Amount,111,AccountNo,10,convert(varchar, getdate(), 6));
from inserted i
where i.OrderId NOT IN(SELECT OrderId from OrderTable);

END


insert into DailyReport values(8003,'Apurva',10000);
drop table ReportTable;
Create table ReportTable(id int primary key IDENTITY(1,1),orderdate Date ,Amount float );
Declare @Amount int;
Declare @Date date;
Create Trigger TR_Daily_records
on ReportTable
for insert as
select @Amount= Amount from ECommerce.OrderTable;
select @Date= OrderDate from ECommerce.OrderTable;
if @Date =convert(varchar, getdate(), 6)
Begin
update ReportTable
set Amount= Amount+@Amount
where @Date=convert(varchar, getdate(), 6);
End
Else
insert into ReportTable values( convert(varchar, getdate(), 6),@Amount);

End















