# HTML

Common `<header>` tags:

```HTML
<link rel="icon" href="/favicon.ico">
<link rel="icon" href="/favicon.svg" type="image/svg+xml">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">

<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<meta name="theme-color" content="#000000">

<meta name="apple-mobile-web-app-title" content="App name">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<meta name="mobile-web-app-capable" content="yes">

<link rel="stylesheet" href="/style.css">
<link rel="stylesheet" href="/print.css" media="print">

<meta name="description" content="Description">
<meta property="og:title" content="Title">
<meta property="og:description" content="Description">
<meta property="og:image" content="https://example.com/image.jpg">
<meta property="og:image:alt" content="Image description">
<meta property="og:locale" content="en_US">
<meta property="og:type" content="website">
<meta name="twitter:card" content="summary_large_image">
<meta property="og:url" content="https://example.com/page">
<link rel="canonical" href="https://example.com/page">

<link rel="manifest" href="/my.webmanifest">

```

## Emojis on incompatible devices

```HTML
<style>.emoji { height: 1em; width: 1em; }</style>
<script src="//twemoji.maxcdn.com/2/twemoji.min.js?2.4"></script>
<script>twemoji.parse(document.body);</script>
```

## Sample Chart

```html
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

<div id="chart" class="chart-morris" style="height:360px"></div>

<script>

				new Morris.Line({
			element: 'chart',
			data: [{"price_usd":"33169.451490","date":"2021-06-23 22:00"},{"price_usd":"33521.283679","date":"2021-06-24 01:00"}],
						goals: [],
			goalLineColors: [],
			events: [],
			eventLineColors: [],
			hoverCallback: function (index, options, content, row) {
				for (var i = 0; i < events.length; i++) {
					if ( row.date.indexOf( events[i].date ) === 0 ){
						content += '<div><button class="btn btn-fill btn-xs btn-'+(events[i].price_usd>33500?'info':'warning')+'">'+events[i].action+' $'+events[i].date+' <small>($'+events[i].price_usd+')</small></button></div>';
					}
				}
				return content;
			},
			xkey: 'date',
			ykeys: ['price_usd'],
			labels: ['Price'],
			lineColors: ['#eb5e28'],
			lineWidth: 2,
			goalStrokeWidth: 1,
			pointSize: 0,
			ymin: 'auto',
			ymax: 'auto',
			preUnits: '$',
			resize: true,
			hideHover: true,
			yLabelFormat: function (y) { return Math.round(y * 1000000) / 1000000; }
		});

		var events = [];
	
</script>
```


## WhatsApp send message link shortcut

```html
https://api.whatsapp.com/send?phone=34666505050&text=*Hola*.%20Me%20gustar%C3%ADa%20ampliar%20informaci%C3%B3n%20sobre%20el%20*Carnet%20de%20Manipulador%20de%20Alimentos*%20que%20ofrec%C3%A9is.%20Gracias.
```
