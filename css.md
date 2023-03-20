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

### Animation examples

- Wiggle: https://jsfiddle.net/75qvjy4s/

```css
.flash {
	animation: flash 2s infinite steps(4);
}
@keyframes flash {
	0% {
		opacity: .66;
	}

	100% {
		opacity: 1;
	}
}
```

```css
@keyframes fade-in {
	0% {
		opacity: 0;
		transform: scale(2);
	}

	100% {
		opacity: 1;
	}
}
```

```css
@keyframes pulse {
	0% {
		opacity: 100%;
	}

	100% {
		opacity: 0;
	}
}
```


### Clock animation

For refreshing dashboards, inspired by Metabase:

```html
<div class="clock">
  <div class="clock-hand"></div>
</div>
```

```css
.clock {
  position: relative;
  width: 1em;
  height: 1em;
  border-radius: 50%;
  background: rgba(0, 255, 0, 0.2);
}

.clock > .clock-hand {
  position: absolute;
  width: 0px;
  height: 50%;
  top: 0%;
  left: 50%;
  box-sizing: border-box;
  border: 1px solid green;
  transform-origin: bottom;
  animation: clockHandAnimation 15s infinite linear;
}

@keyframes clockHandAnimation {
  0% {transform: rotate(0deg);}
  100% {transform: rotate(360deg);}
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

## Change color of a SVG

```css
.logo svg {
	fill: var(--colorBluePrimary);
}
```

## CSS-based hamburger menu

```css
#sidebar-menu-toggle {
	opacity: 0;
	display: none;
}
.sidebar-menu-label {
	position: absolute;
	top: 20px;
	left: 20px;
	cursor: pointer;
  z-index: 101;
}
.sidebar-menu {
	display: none;
}

#sidebar-menu-toggle:checked ~ .sidebar-menu {
	display: block;
}
@media screen and (max-width: 767px) {
	.sidebar-menu {
		position: absolute;
		display: block;
		overflow: hidden;
		height: 100vh;
		width: 360px;
		left: -360px;
		transition: left .1s ease-in-out;
    background: #ccc;
    z-index: 100;
	}
  
  #sidebar-menu-toggle:checked ~ .sidebar-menu {
		left: 0;
		transition: left .3s ease-in-out;
	}

}
```

```html
<label for="sidebar-menu-toggle" class="sidebar-menu-label">☰</label><input type="checkbox" id="sidebar-menu-toggle">

<div class="sidebar-menu">
  <ul>
    <li>Item a</li>
    <li>Item b</li>
  </ul>
</div>
```
