---
-- #%L
-- JSQLParser library
-- %%
-- Copyright (C) 2004 - 2019 JSQLParser
-- %%
-- Dual licensed under GNU LGPL 2.1 or Apache License 2.0
-- #L%
---
select staleness
, osize, obj#
, type#
, case when row_number() over (partition by bo# order by staleness, osize, obj#) = 1 then 64 else 0 end
  +
  case when row_number() over (partition by (select tcp0.bo# from tabcompart$ tcp0 where tcp0.obj#=st0.bo#) order by staleness, osize, obj#) = 1 then 32
  else 0 end aflags
, 0 status
, :b3 sid
, :b2 serial#
, part#, bo#
from st0

--@SUCCESSFULLY_PARSED_AND_DEPARSED first on Aug 3, 2021, 7:20:08 AM
--@FAILURE: Encountered unexpected token: "over" "OVER" recorded first on May 27, 2024, 9:38:28 AM