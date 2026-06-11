## SCSS/Sass Rules

* This codebase uses nested SCSS and BEM naming.
* `&` refers to the full parent selector.
* `&__element` creates a BEM element.
* `&--modifier` creates a BEM modifier.
* Nesting compounds selectors from the current parent.

Examples:

```scss
.card {
  &__title {}
  &--featured {}

  &__title {
    &--large {}
  }

  &:hover {}
}
```

Compiles to:

```css
.card__title {}
.card--featured {}
.card__title--large {}
.card:hover {}
```

Important:

* Do NOT convert `&__element` into `.parent .element`.
* Do NOT convert `&--modifier` into descendant selectors.
* Always mentally expand nested selectors before editing code.
* Preserve the existing BEM structure and nesting patterns.
