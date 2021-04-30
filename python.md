# Python

```py
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
```

## Sleep

```py
import time

# sleep 5 seconds
time.sleep(5)
```

## HTTP request

```py
import requests

url = "https://www.google.com"
headers = {'user-agent': 'Mozilla/5.0'}

try:
    r = requests.get(url, headers=headers)
  except Exception:
    pass

print(r.content)
print(r.text)
print(r.json)

r.close()
```

## Save file

```py
with open('/tmp/file.py', 'wb') as f:
  f.write(r.content)
```

