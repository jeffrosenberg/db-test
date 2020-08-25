create view dbo.CombinedTables
as
select p.id, p.secondId, p.baseId
, b.otherField as baseField
, s.otherField as secondField
, p.otherField as plusField
from dbo.PlusTable p
inner join dbo.BaseTable b
  on b.id = p.baseId
inner join dbo.SecondTable s
  on s.id = p.secondId

go