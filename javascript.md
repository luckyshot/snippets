# JavaScript

Fetch and insert data

```JS
fetch('/clickedMessage/')
    .then(response => response.text())
    .then(data => {
        document.getElementById('fetch-target-1').innerHTML = data
    })
```

Toggle CSS class

`document.getElementById('toggle-target-1').classList.toggle('red-border')`


## Bookmarklets

`javascript:void( /* code here */ )`

Go to another page

`location.href='https://example.com/add?url='+encodeURIComponent(location.href)+'&text='+encodeURIComponent(document.title)`

Open a popup window

`var bWindow=window.open("https://example.com","Window title","height=300,width=600");setTimeout(function(){ bWindow.close() }, 5000)`
