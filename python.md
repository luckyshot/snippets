# Python

## Initial setup via virtual environment

```sh
python3 -m venv .venv
source .venv/bin/activate
```

## Initial Setup

```sh
python3 --version
sudo apt install python3 python-is-python3 python3-pip
sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED
```

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

