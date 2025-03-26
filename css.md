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

# Transition effects

```css
.fader {
    transition: opacity 0.5s linear;
}

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

### Shimmer loading animation effect (while waiting for asynchronous content)

From Reddit:

```css
:root {
  --color-shimmer-background: #ffffff08;
  --color-shimmer-gradient-overlay: linear-gradient(to right, #ffffff00, #ffffff05 20%, #ffffff0f 50%, #ffffff08 70%, #ffffff00 100%);
}

.loader {
  background: var(--color-shimmer-background);
  height: 100%;
  width: 100%;
  position: relative;
  overflow-x: hidden;
}

.loader .shimmer-object {
  background: var(--color-shimmer-gradient-overlay);
  border-radius: 0.5rem;
  height: 100%;
  width: 200%;
  position: absolute;
  top: 0px;
  left: 0px;
  transform: translateX(-100%);
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


## Print CSS

```css
@page
{
    size: A4 portrait;
    margin: 0;
}


/* Avoid break after header*/
h2,h3,h4,h5,h6,h7,h8 {break-after: avoid-page;}
/* Avoid splitting image */
img, svg, table, canvas {break-inside: avoid;}
/* Print URL of links */
a::after {content: " (" attr(href) ")";}

```

## CSS Libraries/Frameworks

- [Pico (pure HTML selectors)](https://v2.picocss.com/)


## Color Palettes

### Stripe

```css
:root {
--stripe-hue-gray0: #ffffff;
--stripe-hue-gray50: #f6f8fa;
--stripe-hue-gray100: #ebeef1;
--stripe-hue-gray150: #d5dbe1;
--stripe-hue-gray200: #c0c8d2;
--stripe-hue-gray300: #a3acba;
--stripe-hue-gray400: #87909f;
--stripe-hue-gray500: #687385;
--stripe-hue-gray600: #545969;
--stripe-hue-gray700: #414552;
--stripe-hue-gray800: #30313d;
--stripe-hue-gray900: #1a1b25;
--stripe-hue-gray950: #10111a;
--stripe-hue-blue50: #ddfffe;
--stripe-hue-blue100: #cff5f6;
--stripe-hue-blue150: #a2e5ef;
--stripe-hue-blue200: #75d5e8;
--stripe-hue-blue300: #06b9ef;
--stripe-hue-blue400: #0096eb;
--stripe-hue-blue500: #0570de;
--stripe-hue-blue600: #0055bc;
--stripe-hue-blue700: #04438c;
--stripe-hue-blue800: #003262;
--stripe-hue-blue900: #011c3a;
--stripe-hue-green50: #ecfed7;
--stripe-hue-green100: #d7f7c2;
--stripe-hue-green150: #a6eb84;
--stripe-hue-green200: #76df47;
--stripe-hue-green300: #48c404;
--stripe-hue-green400: #3fa40d;
--stripe-hue-green500: #228403;
--stripe-hue-green600: #006908;
--stripe-hue-green700: #0b5019;
--stripe-hue-green800: #043b15;
--stripe-hue-green900: #02220d;
--stripe-hue-orange50: #fef9da;
--stripe-hue-orange100: #fcedb9;
--stripe-hue-orange150: #fcd579;
--stripe-hue-orange200: #fcbd3a;
--stripe-hue-orange300: #ff8f0e;
--stripe-hue-orange400: #ed6704;
--stripe-hue-orange500: #c84801;
--stripe-hue-orange600: #a82c00;
--stripe-hue-orange700: #842106;
--stripe-hue-orange800: #5f1a05;
--stripe-hue-orange900: #331302;
--stripe-hue-red50: #fff5fa;
--stripe-hue-red100: #ffe7f2;
--stripe-hue-red150: #ffccdf;
--stripe-hue-red200: #ffb1cd;
--stripe-hue-red300: #fe87a1;
--stripe-hue-red400: #fc526a;
--stripe-hue-red500: #df1b41;
--stripe-hue-red600: #b3093c;
--stripe-hue-red700: #890d37;
--stripe-hue-red800: #68052b;
--stripe-hue-red900: #3e021a;
--stripe-hue-purple50: #f9f7ff;
--stripe-hue-purple100: #f2ebff;
--stripe-hue-purple150: #dfd3fc;
--stripe-hue-purple200: #d1befe;
--stripe-hue-purple300: #b49cfc;
--stripe-hue-purple400: #8d7ffa;
--stripe-hue-purple500: #625afa;
--stripe-hue-purple600: #513dd9;
--stripe-hue-purple700: #3f32a1;
--stripe-hue-purple800: #302476;
--stripe-hue-purple900: #14134e;
}
```
