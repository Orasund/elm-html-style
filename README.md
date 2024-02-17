# elm-html-style

This package provides shortshands for writing css.

All functions have been generated from the [MDN data repository](https://github.com/mdn/data), ensuring that you can always use the most recent css features.

The following functions are currently generated:

* Generic functions returning a Html.Attributes
  
  ```
  maxWidth string = Html.Attributes.style "max-width" string
  ```
* Variants for constant values

  ```
  maxWidthMaxContent = Html.Attributes.style "max-width" "max-content"
  ```
* Variants for lengths (currently only "px" and "rem")
  ```
  maxWidthPx float = Html.Attributes.style "max-width" (float ++ "px")
  ```