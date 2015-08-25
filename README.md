# postcss-presass-include
Sass style include

Input:
```scss
.block {
  +foobar: 1 2, 3 4;
  +foo: bar {
    baz: qux;
  }
}
```

Output:
```scss
.block {
  @include foobar(1 2, 3 4);
  @include foo(bar) {
    baz: qux;
  }
}
```
