# CSS

`filter:brightness(1.2);`

```
html {
  --colorIndigo50: #EEF2FF;
  color: var(--colorIndigo50);
}
```

## Webfont

_(Compatible from IE9+)_

```css
@font-face {
  font-family: 'MyWebFont';
  src:  url('myfont.woff2') format('woff2'),
        url('myfont.woff') format('woff');
}
```

## Animation

```CSS
.fire {
    animation: pulse 2s infinite;
    display: inline-block;
    transform-origin: 50% 100%;
}
@keyframes pulse {
    0% {opacity: 0.66;transform: rotate(-10deg);}
    50% {opacity: 1;transform: rotate(10deg) scale(1.1)}
    100% {opacity: 0.66;transform: rotate(-10deg);}
}
```

## Media queries

`@media only screen and (min-width: 600px) { }`

Targets iPad 1: 

`@media only screen and (device-width: 768px) and (device-height: 1024px) { }`

