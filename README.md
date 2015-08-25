# postcss-presass-include
Sass style include

Input:
```scss
.block {
  +padding: 1 2 3 4, em;
  +margin-block: blue {
    margin: 10px;
  }
}
```

Output:
```scss
.block {
  @include padding(1 2 3 4, em);
  @include margin-block(blue) {
    margin: 10px;
  }
}
```
