# JavaScript

### Utils

```js

formatCurrency = function (number) {
	return new Intl.NumberFormat(APP.params.intl, {
		maximumSignificantDigits: 21,
		style: "currency",
		currency: "EUR",
	}).format(number);
};
formatNumber = function (number, decimals) {
	return parseFloat(number).toFixed(decimals || 0);
};
randomNumber = function (min, max) {
	return Math.floor(Math.random() * max) + min;
}
capitalizeFirstLetter = function (string) {
	return string.charAt(0).toUpperCase() + string.slice(1);
};


```

### Loop QuerySelectorAll

```js
document.querySelectorAll('.classes').forEach(function(item){
	// ...
});
```

### Fetch and insert data

```JS
fetch('/clickedMessage/')
    .then(response => response.text())
    .then(data => {
        document.getElementById('fetch-target-1').innerHTML = data
    })
```

### Toggle CSS class

`document.getElementById('toggle-target-1').classList.toggle('red-border')`



## Vanilla template

```JS
var APP = APP || {};

(function(d){ 'use strict';
	APP = (function ( APP ) {

		APP.params = {
			title: 'My App',
		};
		APP.timers = {};
		APP.db = {
			token: null,
		};
        
        
		APP.init = function(){
			APP.db.token = APP.getToken();
			APP.loadEvents();
			APP.router();
		};


		APP.loadEvents = function(){
			document.addEventListener("keydown", APP.keyDown, false);
		};



		return APP;
	})( APP || {} );
}(document));

APP.init();
```


## Cookie set/get

```JS
let _setCookie = function (name, value, days) {
    var expires = "";
    if (days) {
	var date = new Date();
	date.setTime(date.getTime() + (days*24*60*60*1000));
	expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "")  + expires + "; path=/";
}
let _getCookie = function (name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
	var c = ca[i];
	while (c.charAt(0)==' ') c = c.substring(1,c.length);
	if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}
```


## Events library

```JS
/* gator v1.2.4 craig.is/riding/gators */
(function(){function t(a){return k?k:a.matches?k=a.matches:a.webkitMatchesSelector?k=a.webkitMatchesSelector:a.mozMatchesSelector?k=a.mozMatchesSelector:a.msMatchesSelector?k=a.msMatchesSelector:a.oMatchesSelector?k=a.oMatchesSelector:k=e.matchesSelector}function q(a,b,c){if("_root"==b)return c;if(a!==c){if(t(a).call(a,b))return a;if(a.parentNode)return m++,q(a.parentNode,b,c)}}function u(a,b,c,e){d[a.id]||(d[a.id]={});d[a.id][b]||(d[a.id][b]={});d[a.id][b][c]||(d[a.id][b][c]=[]);d[a.id][b][c].push(e)}
function v(a,b,c,e){if(d[a.id])if(!b)for(var f in d[a.id])d[a.id].hasOwnProperty(f)&&(d[a.id][f]={});else if(!e&&!c)d[a.id][b]={};else if(!e)delete d[a.id][b][c];else if(d[a.id][b][c])for(f=0;f<d[a.id][b][c].length;f++)if(d[a.id][b][c][f]===e){d[a.id][b][c].splice(f,1);break}}function w(a,b,c){if(d[a][c]){var k=b.target||b.srcElement,f,g,h={},n=g=0;m=0;for(f in d[a][c])d[a][c].hasOwnProperty(f)&&(g=q(k,f,l[a].element))&&e.matchesEvent(c,l[a].element,g,"_root"==f,b)&&(m++,d[a][c][f].match=g,h[m]=d[a][c][f]);
b.stopPropagation=function(){b.cancelBubble=!0};for(g=0;g<=m;g++)if(h[g])for(n=0;n<h[g].length;n++){if(!1===h[g][n].call(h[g].match,b)){e.cancel(b);return}if(b.cancelBubble)return}}}function r(a,b,c,k){function f(a){return function(b){w(g,b,a)}}if(this.element){a instanceof Array||(a=[a]);c||"function"!=typeof b||(c=b,b="_root");var g=this.id,h;for(h=0;h<a.length;h++)k?v(this,a[h],b,c):(d[g]&&d[g][a[h]]||e.addEvent(this,a[h],f(a[h])),u(this,a[h],b,c));return this}}function e(a,b){if(!(this instanceof
e)){for(var c in l)if(l[c].element===a)return l[c];p++;l[p]=new e(a,p);return l[p]}this.element=a;this.id=b}var k,m=0,p=0,d={},l={};e.prototype.on=function(a,b,c){return r.call(this,a,b,c)};e.prototype.off=function(a,b,c){return r.call(this,a,b,c,!0)};e.matchesSelector=function(){};e.cancel=function(a){a.preventDefault();a.stopPropagation()};e.addEvent=function(a,b,c){a.element.addEventListener(b,c,"blur"==b||"focus"==b)};e.matchesEvent=function(){return!0};"undefined"!==typeof module&&module.exports&&
(module.exports=e);window.Gator=e})();
```

```JS
Gator(d.querySelector('#app')).on('click', '.order', function(e) {
    console.log( this ); // the listener event (.order)
    console.log( e.target ); // the clicked element (i.e. a paragraph inside .order)
    e.preventDefault();
});

Gator(d.querySelector('#app')).on(['mousedown','touchstart'], '.button', runAction);
```


## Minimal Template engine library

```JS
// Template Engine
// https://github.com/blueimp/JavaScript-Templates/blob/master/js/tmpl.min.js
!function(e){"use strict";var r=function(e,n){var t=/[^\w\-.:]/.test(e)?new Function(r.arg+",tmpl","var _e=tmpl.encode"+r.helper+",_s='"+e.replace(r.regexp,r.func)+"';return _s;"):r.cache[e]=r.cache[e]||r(r.load(e));return n?t(n,r):function(e){return t(e,r)}};r.cache={},r.load=function(e){return document.getElementById(e).innerHTML},r.regexp=/([\s'\\])(?!(?:[^{]|\{(?!%))*%\})|(?:\{%(=|#)([\s\S]+?)%\})|(\{%)|(%\})/g,r.func=function(e,n,t,r,c,u){return n?{"\n":"\\n","\r":"\\r","\t":"\\t"," ":" "}[n]||"\\"+n:t?"="===t?"'+_e("+r+")+'":"'+("+r+"==null?'':"+r+")+'":c?"';":u?"_s+='":void 0},r.encReg=/[<>&"'\x00]/g,r.encMap={"<":"&lt;",">":"&gt;","&":"&amp;",'"':"&quot;","'":"&#39;"},r.encode=function(e){return(null==e?"":""+e).replace(r.encReg,function(e){return r.encMap[e]||""})},r.arg="o",r.helper=",print=function(s,e){_s+=e?(s==null?'':s):_e(s);},include=function(s,d){_s+=tmpl(s,d);}","function"==typeof define&&define.amd?define(function(){return r}):"object"==typeof module&&module.exports?module.exports=r:e.tmpl=r}(this);
```

```JS
document.getElementById('app').innerHTML = tmpl('template-dashboard', data);
```

Insert partial (use `{%#` instead of `{%=` to avoid escaping HTML):

```JS
{%#tmpl('template-partial-stats', data)%}
```

```HTML
<script type="text/template" id="template-dashboard">
	<div class="grid-container">
		<h2 class="heading"> {%=o.orders.length%} </h2>
		<div class="numbers">
			{% if (!!o.orders.length){ %}
				{% for (var i=0; i < o.orders.length; i++) {
				var order = o.orders[i]; %}
					{%=order.code%}
				{% } %}
			{% } %}
	     </div>
	</div>
</script>
```




## Color scale

```JS
colorScale = function(pct, min, max) {
    if (pct > max){ pct = max; }
    pct = max - pct;
    var base = (max - min);

    if (base == 0) { pct = 100; }
    else {
	pct = (pct - min) / base * 100;
    }
    var r, g, b = 0;
    if (pct < 50) {
	r = 255;
	g = Math.round(5.1 * pct);
    }
    else {
	g = 255;
	r = Math.round(510 - 5.10 * pct);
    }
    var h = r * 0x10000 + g * 0x100 + b * 0x1;
    return '#' + ('000000' + h.toString(16)).slice(-6) + '45';
};
```

## String to unique color

```js
var stringToColour = function(str) {
  var hash = 0;
  for (var i = 0; i < str.length; i++) {
    hash = str.charCodeAt(i) + ((hash << 5) - hash);
  }
  var colour = '#';
  for (var i = 0; i < 3; i++) {
    var value = (hash >> (i * 8)) & 0xFF;
    colour += ('00' + value.toString(16)).substr(-2);
  }
  return colour;
}
```


## Alert system

```html
<div id="alerts"></div>
```

```JS
APP.showAlert = function( message, css ){

    var _notificationTime = 3; // seconds

    var alertElement = document.createElement('div');
    alertElement.id = 'msg-' + (+ new Date());
    alertElement.classList = [css];
    alertElement.innerHTML = message;

    document.querySelector('#alerts').append( alertElement );

    APP.timers[ alertElement.id ] = setTimeout( function(){
	APP.hideAlert( alertElement.id );
	delete APP.timers[ alertElement.id ];
    }, _notificationTime * 1000 );


    return alertElement.id;
};


APP.hideAlert = function( e ){
    const elem = document.querySelector('#'+e);
    elem.parentNode.removeChild(elem);
};


APP.hideAllAlerts = function(){
    document.querySelector('#alerts').innerHTML = '';
};
```


## Is a number?

```JS
isNumeric = function(n){
    return !isNaN(parseFloat(n)) && isFinite(n);
};
```



## Text to Speech

```js
    APP = APP || {};
    APP.config = {
        speechRate: "1.4",
        speechPitch: "0.9",
    };
    APP.cache = {};
    APP.cache.speech = {};
    
    APP.initSpeech = function(){
        var voices = window.speechSynthesis.getVoices();
        APP.cache.speech.voice = voices[0];
        APP.cache.speech.rate = APP.config.speechRate;
        APP.cache.speech.pitch = APP.config.speechPitch;
        // APP.cache.speech.lang = "en-US";
    };
    APP.speak = function(text, callback){
        APP.cache.speech.text = text;
        console.log('callback before', callback);
        APP.cache.speech.onend = function (e, callback) {
            console.log('callback after', callback);
            if (callback) { callback(e); }
        };
        console.log(APP.cache.speech);
        speechSynthesis.speak(APP.cache.speech);
    };


APP.initSpeech();
APP.speak("Hello world!");
```


## Bookmarklets

`javascript:void( /* code here */ )`

#### Go to another page

`location.href='https://example.com/add?url='+encodeURIComponent(location.href)+'&text='+encodeURIComponent(document.title)`

#### Open a popup window

`var bWindow=window.open("https://example.com","Window title","height=300,width=600");setTimeout(function(){ bWindow.close() }, 5000)`

#### Convert imperial to metric

```JS
document.body.innerHTML = document.body.innerHTML
.replace(/([0-9\.]{1,10}) ?º/g, function(match, contents, offset, input_string){console.log(match, contents, offset, input_string);return Math.round((5/9) * (contents - 32), 1)+'º'})
.replace(/([0-9\.]{1,10}) ?(feet|ft|square feet)/g, function(match, contents, offset, input_string){return Math.round(contents * 30.48)/100+'m'})
```
