# Google Sheets

Make sure to use the proper parameter separator (`,` or `;`) in your functions depending on your language settings.


## Cell functions

If there's an error then leave cell empty:

```sql
=IFERROR( formula )
```

If there's an error then set another value:

```sql
=IFERROR( formula, "default value" )
```

### SQL Queries:

```sql
=QUERY(Sheet1!$A$2:$O$256; "SELECT B WHERE O = "&B2&" ORDER BY B DESC LIMIT 1")
```

SQL 'IN'

```sql
=QUERY(Sheet1!$A$2:$O$256; "SELECT SUM(K) WHERE O = "&B2&" AND C MATCHES 'Pending|Waiting|Paid' LABEL SUM(K) ''")
```

### Distance between two coordinates (Lat/Long, returns meters)

```
=2 * 6371000 * ASIN(SQRT((SIN((LAT2*(3.14159/180)-LAT1*(3.14159/180))/2))^2+COS(LAT2*(3.14159/180))*COS(LAT1*(3.14159/180))*SIN(((LONG2*(3.14159/180)-LONG1*(3.14159/180))/2))^2))
```

### Minutes between dates

```sql
=TEXT(END-START,"h:mm:ss")
```

## Conditional format rules: Custom formula

Highlight full row based on one column's data:

```sql
=$C1 = "Waiting payment"
```

Cell D is empty:

```sql
=$D1 <> ""
```

Cell D is empty but B is not:

```sql
=AND($D1 = ""; $B1 <> "")
```



## Add new row via HTTP GET request

1. Create a Google Form
2. _Get prefilled form_
3. Copy URL
4. Change `/viewform` to `/formResponse`
5. Add `&submit=Submit`

