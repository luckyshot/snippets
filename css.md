# CSS

[TailWindCSS Color Palette as CSS native variables](https://gist.github.com/luckyshot/9605314b6f32304ea3d44381ad6788af)

## Variables

```css
filter: brightness(1.2);
```

```css
html {
  --colorIndigo50: #EEF2FF;
  color: var(--colorIndigo50);
}
```

## Box-sizing

```css
/* apply a natural box layout model to all elements, but allowing components to change */
html {
  box-sizing: border-box;
}
*, *:before, *:after {
  box-sizing: inherit;
}
```

## Tiny Minimal Flexbox Grid

```css
/*
Tiny Minimal Flexbox Grid
Credits, gutters, margins and more: https://css-tricks.com/dont-overthink-flexbox-grids/
*/
.flex-grid {
  display: flex;
}
.col {
  flex: 1;
}

/* Break on mobile? */
@media (max-width: 400px) {
  .flex-grid {
    display: block;
  }
}
```

## Webfont

_(Compatible from IE9+)_

```css
@font-face {
  font-family: 'MyWebFont';
  font-weight: 400;
  src:  url('myfont.woff2') format('woff2'),
        url('myfont.woff') format('woff');
}

/*
100	Thin (Hairline)
200	Extra Light (Ultra Light)
300	Light
400	**Normal** (Regular)
500	Medium
600	Semi Bold (Demi Bold)
700	**Bold**
800	Extra Bold (Ultra Bold)
900	Black (Heavy)
950	Extra Black (Ultra Black)
*/
```

## Animation

```css
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

```css
@media only screen and (min-width: 600px) { }
```

Targets iPad 1: 

```css
@media only screen and (device-width: 768px) and (device-height: 1024px) { }
```

