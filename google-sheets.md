# Google Sheets

Make sure to use the proper parameter separator (`,` or `;`) in your functions depending on your language settings.


## Cell functions

If there's an error then leave cell empty:

`IFERROR( formula )`

If there's an error then set another value:

`IFERROR( formula, "default value" )`

### SQL Queries:

`query(Sheet1!$A$2:$O$256; "SELECT B WHERE O = "&B2&" ORDER BY B DESC LIMIT 1")`

SQL 'IN'

`query(Sheet1!$A$2:$O$256; "SELECT SUM(K) WHERE O = "&B2&" AND C MATCHES 'Pending|Waiting|Paid' LABEL SUM(K) ''")`



## Conditional format rules: Custom formula

Highlight full row based on one column's data:

`=$C1 = "Waiting payment"`

Cell D is empty:

`=$D1 <> ""`

Cell D is empty but B is not:

`=AND($D1 = ""; $B1 <> "")`



