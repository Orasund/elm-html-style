# elm-html-style

This package provides shortshands for writing css.

All functions have been generated from the [MDN data repository](https://github.com/mdn/data), ensuring that you can always use the most recent css features.

The following functions are currently generated:

* generic function returning a Html.Attributes
  
  ```
  maxWidth string = Html.Attributes.style "max-width" string
  ```
* variants for constant values

  ```
  maxWidthMaxContent = Html.Attributes.style "max-width" "max-content"
  ```
* viarants for lengths (currently only "px" and "rem")
  ```
  maxWidthPx float = Html.Attributes.style "max-width" (float ++ "px")
  ```