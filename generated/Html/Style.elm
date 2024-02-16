module Html.Style exposing (..)

import Html
import Html.Attributes


* : String -> Html.Attribute msg
* string =
    Html.Attributes.style "--*" string


mozappearance : String -> Html.Attribute msg
mozappearance string =
    Html.Attributes.style "-moz-appearance" string


mozbinding : String -> Html.Attribute msg
mozbinding string =
    Html.Attributes.style "-moz-binding" string


mozborderbottomcolors : String -> Html.Attribute msg
mozborderbottomcolors string =
    Html.Attributes.style "-moz-border-bottom-colors" string


mozborderleftcolors : String -> Html.Attribute msg
mozborderleftcolors string =
    Html.Attributes.style "-moz-border-left-colors" string


mozborderrightcolors : String -> Html.Attribute msg
mozborderrightcolors string =
    Html.Attributes.style "-moz-border-right-colors" string


mozbordertopcolors : String -> Html.Attribute msg
mozbordertopcolors string =
    Html.Attributes.style "-moz-border-top-colors" string


mozcontextproperties : String -> Html.Attribute msg
mozcontextproperties string =
    Html.Attributes.style "-moz-context-properties" string


mozfloatedge : String -> Html.Attribute msg
mozfloatedge string =
    Html.Attributes.style "-moz-float-edge" string


mozforcebrokenimageicon : String -> Html.Attribute msg
mozforcebrokenimageicon string =
    Html.Attributes.style "-moz-force-broken-image-icon" string


mozimageregion : String -> Html.Attribute msg
mozimageregion string =
    Html.Attributes.style "-moz-image-region" string


mozorient : String -> Html.Attribute msg
mozorient string =
    Html.Attributes.style "-moz-orient" string


mozoutlineradius : String -> Html.Attribute msg
mozoutlineradius string =
    Html.Attributes.style "-moz-outline-radius" string


mozoutlineradiusbottomleft : String -> Html.Attribute msg
mozoutlineradiusbottomleft string =
    Html.Attributes.style "-moz-outline-radius-bottomleft" string


mozoutlineradiusbottomright : String -> Html.Attribute msg
mozoutlineradiusbottomright string =
    Html.Attributes.style "-moz-outline-radius-bottomright" string


mozoutlineradiustopleft : String -> Html.Attribute msg
mozoutlineradiustopleft string =
    Html.Attributes.style "-moz-outline-radius-topleft" string


mozoutlineradiustopright : String -> Html.Attribute msg
mozoutlineradiustopright string =
    Html.Attributes.style "-moz-outline-radius-topright" string


mozstacksizing : String -> Html.Attribute msg
mozstacksizing string =
    Html.Attributes.style "-moz-stack-sizing" string


moztextblink : String -> Html.Attribute msg
moztextblink string =
    Html.Attributes.style "-moz-text-blink" string


mozuserfocus : String -> Html.Attribute msg
mozuserfocus string =
    Html.Attributes.style "-moz-user-focus" string


mozuserinput : String -> Html.Attribute msg
mozuserinput string =
    Html.Attributes.style "-moz-user-input" string


mozusermodify : String -> Html.Attribute msg
mozusermodify string =
    Html.Attributes.style "-moz-user-modify" string


mozwindowdragging : String -> Html.Attribute msg
mozwindowdragging string =
    Html.Attributes.style "-moz-window-dragging" string


mozwindowshadow : String -> Html.Attribute msg
mozwindowshadow string =
    Html.Attributes.style "-moz-window-shadow" string


msaccelerator : String -> Html.Attribute msg
msaccelerator string =
    Html.Attributes.style "-ms-accelerator" string


msblockprogression : String -> Html.Attribute msg
msblockprogression string =
    Html.Attributes.style "-ms-block-progression" string


mscontentzoomchaining : String -> Html.Attribute msg
mscontentzoomchaining string =
    Html.Attributes.style "-ms-content-zoom-chaining" string


mscontentzoomlimit : String -> Html.Attribute msg
mscontentzoomlimit string =
    Html.Attributes.style "-ms-content-zoom-limit" string


mscontentzoomlimitmax : String -> Html.Attribute msg
mscontentzoomlimitmax string =
    Html.Attributes.style "-ms-content-zoom-limit-max" string


mscontentzoomlimitmin : String -> Html.Attribute msg
mscontentzoomlimitmin string =
    Html.Attributes.style "-ms-content-zoom-limit-min" string


mscontentzoomsnap : String -> Html.Attribute msg
mscontentzoomsnap string =
    Html.Attributes.style "-ms-content-zoom-snap" string


mscontentzoomsnappoints : String -> Html.Attribute msg
mscontentzoomsnappoints string =
    Html.Attributes.style "-ms-content-zoom-snap-points" string


mscontentzoomsnaptype : String -> Html.Attribute msg
mscontentzoomsnaptype string =
    Html.Attributes.style "-ms-content-zoom-snap-type" string


mscontentzooming : String -> Html.Attribute msg
mscontentzooming string =
    Html.Attributes.style "-ms-content-zooming" string


msfilter : String -> Html.Attribute msg
msfilter string =
    Html.Attributes.style "-ms-filter" string


msflowfrom : String -> Html.Attribute msg
msflowfrom string =
    Html.Attributes.style "-ms-flow-from" string


msflowinto : String -> Html.Attribute msg
msflowinto string =
    Html.Attributes.style "-ms-flow-into" string


msgridcolumns : String -> Html.Attribute msg
msgridcolumns string =
    Html.Attributes.style "-ms-grid-columns" string


msgridrows : String -> Html.Attribute msg
msgridrows string =
    Html.Attributes.style "-ms-grid-rows" string


mshighcontrastadjust : String -> Html.Attribute msg
mshighcontrastadjust string =
    Html.Attributes.style "-ms-high-contrast-adjust" string


mshyphenatelimitchars : String -> Html.Attribute msg
mshyphenatelimitchars string =
    Html.Attributes.style "-ms-hyphenate-limit-chars" string


mshyphenatelimitlines : String -> Html.Attribute msg
mshyphenatelimitlines string =
    Html.Attributes.style "-ms-hyphenate-limit-lines" string


mshyphenatelimitzone : String -> Html.Attribute msg
mshyphenatelimitzone string =
    Html.Attributes.style "-ms-hyphenate-limit-zone" string


msimealign : String -> Html.Attribute msg
msimealign string =
    Html.Attributes.style "-ms-ime-align" string


msoverflowstyle : String -> Html.Attribute msg
msoverflowstyle string =
    Html.Attributes.style "-ms-overflow-style" string


msscrollchaining : String -> Html.Attribute msg
msscrollchaining string =
    Html.Attributes.style "-ms-scroll-chaining" string


msscrolllimit : String -> Html.Attribute msg
msscrolllimit string =
    Html.Attributes.style "-ms-scroll-limit" string


msscrolllimitxmax : String -> Html.Attribute msg
msscrolllimitxmax string =
    Html.Attributes.style "-ms-scroll-limit-x-max" string


msscrolllimitxmin : String -> Html.Attribute msg
msscrolllimitxmin string =
    Html.Attributes.style "-ms-scroll-limit-x-min" string


msscrolllimitymax : String -> Html.Attribute msg
msscrolllimitymax string =
    Html.Attributes.style "-ms-scroll-limit-y-max" string


msscrolllimitymin : String -> Html.Attribute msg
msscrolllimitymin string =
    Html.Attributes.style "-ms-scroll-limit-y-min" string


msscrollrails : String -> Html.Attribute msg
msscrollrails string =
    Html.Attributes.style "-ms-scroll-rails" string


msscrollsnappointsx : String -> Html.Attribute msg
msscrollsnappointsx string =
    Html.Attributes.style "-ms-scroll-snap-points-x" string


msscrollsnappointsy : String -> Html.Attribute msg
msscrollsnappointsy string =
    Html.Attributes.style "-ms-scroll-snap-points-y" string


msscrollsnaptype : String -> Html.Attribute msg
msscrollsnaptype string =
    Html.Attributes.style "-ms-scroll-snap-type" string


msscrollsnapx : String -> Html.Attribute msg
msscrollsnapx string =
    Html.Attributes.style "-ms-scroll-snap-x" string


msscrollsnapy : String -> Html.Attribute msg
msscrollsnapy string =
    Html.Attributes.style "-ms-scroll-snap-y" string


msscrolltranslation : String -> Html.Attribute msg
msscrolltranslation string =
    Html.Attributes.style "-ms-scroll-translation" string


msscrollbar3dlightcolor : String -> Html.Attribute msg
msscrollbar3dlightcolor string =
    Html.Attributes.style "-ms-scrollbar-3dlight-color" string


msscrollbararrowcolor : String -> Html.Attribute msg
msscrollbararrowcolor string =
    Html.Attributes.style "-ms-scrollbar-arrow-color" string


msscrollbarbasecolor : String -> Html.Attribute msg
msscrollbarbasecolor string =
    Html.Attributes.style "-ms-scrollbar-base-color" string


msscrollbardarkshadowcolor : String -> Html.Attribute msg
msscrollbardarkshadowcolor string =
    Html.Attributes.style "-ms-scrollbar-darkshadow-color" string


msscrollbarfacecolor : String -> Html.Attribute msg
msscrollbarfacecolor string =
    Html.Attributes.style "-ms-scrollbar-face-color" string


msscrollbarhighlightcolor : String -> Html.Attribute msg
msscrollbarhighlightcolor string =
    Html.Attributes.style "-ms-scrollbar-highlight-color" string


msscrollbarshadowcolor : String -> Html.Attribute msg
msscrollbarshadowcolor string =
    Html.Attributes.style "-ms-scrollbar-shadow-color" string


msscrollbartrackcolor : String -> Html.Attribute msg
msscrollbartrackcolor string =
    Html.Attributes.style "-ms-scrollbar-track-color" string


mstextautospace : String -> Html.Attribute msg
mstextautospace string =
    Html.Attributes.style "-ms-text-autospace" string


mstouchselect : String -> Html.Attribute msg
mstouchselect string =
    Html.Attributes.style "-ms-touch-select" string


msuserselect : String -> Html.Attribute msg
msuserselect string =
    Html.Attributes.style "-ms-user-select" string


mswrapflow : String -> Html.Attribute msg
mswrapflow string =
    Html.Attributes.style "-ms-wrap-flow" string


mswrapmargin : String -> Html.Attribute msg
mswrapmargin string =
    Html.Attributes.style "-ms-wrap-margin" string


mswrapthrough : String -> Html.Attribute msg
mswrapthrough string =
    Html.Attributes.style "-ms-wrap-through" string


webkitappearance : String -> Html.Attribute msg
webkitappearance string =
    Html.Attributes.style "-webkit-appearance" string


webkitborderbefore : String -> Html.Attribute msg
webkitborderbefore string =
    Html.Attributes.style "-webkit-border-before" string


webkitborderbeforecolor : String -> Html.Attribute msg
webkitborderbeforecolor string =
    Html.Attributes.style "-webkit-border-before-color" string


webkitborderbeforestyle : String -> Html.Attribute msg
webkitborderbeforestyle string =
    Html.Attributes.style "-webkit-border-before-style" string


webkitborderbeforewidth : String -> Html.Attribute msg
webkitborderbeforewidth string =
    Html.Attributes.style "-webkit-border-before-width" string


webkitboxreflect : String -> Html.Attribute msg
webkitboxreflect string =
    Html.Attributes.style "-webkit-box-reflect" string


webkitlineclamp : String -> Html.Attribute msg
webkitlineclamp string =
    Html.Attributes.style "-webkit-line-clamp" string


webkitmask : String -> Html.Attribute msg
webkitmask string =
    Html.Attributes.style "-webkit-mask" string


webkitmaskattachment : String -> Html.Attribute msg
webkitmaskattachment string =
    Html.Attributes.style "-webkit-mask-attachment" string


webkitmaskclip : String -> Html.Attribute msg
webkitmaskclip string =
    Html.Attributes.style "-webkit-mask-clip" string


webkitmaskcomposite : String -> Html.Attribute msg
webkitmaskcomposite string =
    Html.Attributes.style "-webkit-mask-composite" string


webkitmaskimage : String -> Html.Attribute msg
webkitmaskimage string =
    Html.Attributes.style "-webkit-mask-image" string


webkitmaskorigin : String -> Html.Attribute msg
webkitmaskorigin string =
    Html.Attributes.style "-webkit-mask-origin" string


webkitmaskposition : String -> Html.Attribute msg
webkitmaskposition string =
    Html.Attributes.style "-webkit-mask-position" string


webkitmaskpositionx : String -> Html.Attribute msg
webkitmaskpositionx string =
    Html.Attributes.style "-webkit-mask-position-x" string


webkitmaskpositiony : String -> Html.Attribute msg
webkitmaskpositiony string =
    Html.Attributes.style "-webkit-mask-position-y" string


webkitmaskrepeat : String -> Html.Attribute msg
webkitmaskrepeat string =
    Html.Attributes.style "-webkit-mask-repeat" string


webkitmaskrepeatx : String -> Html.Attribute msg
webkitmaskrepeatx string =
    Html.Attributes.style "-webkit-mask-repeat-x" string


webkitmaskrepeaty : String -> Html.Attribute msg
webkitmaskrepeaty string =
    Html.Attributes.style "-webkit-mask-repeat-y" string


webkitmasksize : String -> Html.Attribute msg
webkitmasksize string =
    Html.Attributes.style "-webkit-mask-size" string


webkitoverflowscrolling : String -> Html.Attribute msg
webkitoverflowscrolling string =
    Html.Attributes.style "-webkit-overflow-scrolling" string


webkittaphighlightcolor : String -> Html.Attribute msg
webkittaphighlightcolor string =
    Html.Attributes.style "-webkit-tap-highlight-color" string


webkittextfillcolor : String -> Html.Attribute msg
webkittextfillcolor string =
    Html.Attributes.style "-webkit-text-fill-color" string


webkittextstroke : String -> Html.Attribute msg
webkittextstroke string =
    Html.Attributes.style "-webkit-text-stroke" string


webkittextstrokecolor : String -> Html.Attribute msg
webkittextstrokecolor string =
    Html.Attributes.style "-webkit-text-stroke-color" string


webkittextstrokewidth : String -> Html.Attribute msg
webkittextstrokewidth string =
    Html.Attributes.style "-webkit-text-stroke-width" string


webkittouchcallout : String -> Html.Attribute msg
webkittouchcallout string =
    Html.Attributes.style "-webkit-touch-callout" string


webkitusermodify : String -> Html.Attribute msg
webkitusermodify string =
    Html.Attributes.style "-webkit-user-modify" string


accentcolor : String -> Html.Attribute msg
accentcolor string =
    Html.Attributes.style "accent-color" string


aligncontent : String -> Html.Attribute msg
aligncontent string =
    Html.Attributes.style "align-content" string


alignitems : String -> Html.Attribute msg
alignitems string =
    Html.Attributes.style "align-items" string


alignself : String -> Html.Attribute msg
alignself string =
    Html.Attributes.style "align-self" string


aligntracks : String -> Html.Attribute msg
aligntracks string =
    Html.Attributes.style "align-tracks" string


all : String -> Html.Attribute msg
all string =
    Html.Attributes.style "all" string


animation : String -> Html.Attribute msg
animation string =
    Html.Attributes.style "animation" string


animationcomposition : String -> Html.Attribute msg
animationcomposition string =
    Html.Attributes.style "animation-composition" string


animationdelay : String -> Html.Attribute msg
animationdelay string =
    Html.Attributes.style "animation-delay" string


animationdirection : String -> Html.Attribute msg
animationdirection string =
    Html.Attributes.style "animation-direction" string


animationduration : String -> Html.Attribute msg
animationduration string =
    Html.Attributes.style "animation-duration" string


animationfillmode : String -> Html.Attribute msg
animationfillmode string =
    Html.Attributes.style "animation-fill-mode" string


animationiterationcount : String -> Html.Attribute msg
animationiterationcount string =
    Html.Attributes.style "animation-iteration-count" string


animationname : String -> Html.Attribute msg
animationname string =
    Html.Attributes.style "animation-name" string


animationplaystate : String -> Html.Attribute msg
animationplaystate string =
    Html.Attributes.style "animation-play-state" string


animationrange : String -> Html.Attribute msg
animationrange string =
    Html.Attributes.style "animation-range" string


animationrangeend : String -> Html.Attribute msg
animationrangeend string =
    Html.Attributes.style "animation-range-end" string


animationrangestart : String -> Html.Attribute msg
animationrangestart string =
    Html.Attributes.style "animation-range-start" string


animationtimeline : String -> Html.Attribute msg
animationtimeline string =
    Html.Attributes.style "animation-timeline" string


animationtimingfunction : String -> Html.Attribute msg
animationtimingfunction string =
    Html.Attributes.style "animation-timing-function" string


appearance : String -> Html.Attribute msg
appearance string =
    Html.Attributes.style "appearance" string


aspectratio : String -> Html.Attribute msg
aspectratio string =
    Html.Attributes.style "aspect-ratio" string


azimuth : String -> Html.Attribute msg
azimuth string =
    Html.Attributes.style "azimuth" string


backdropfilter : String -> Html.Attribute msg
backdropfilter string =
    Html.Attributes.style "backdrop-filter" string


backfacevisibility : String -> Html.Attribute msg
backfacevisibility string =
    Html.Attributes.style "backface-visibility" string


background : String -> Html.Attribute msg
background string =
    Html.Attributes.style "background" string


backgroundattachment : String -> Html.Attribute msg
backgroundattachment string =
    Html.Attributes.style "background-attachment" string


backgroundblendmode : String -> Html.Attribute msg
backgroundblendmode string =
    Html.Attributes.style "background-blend-mode" string


backgroundclip : String -> Html.Attribute msg
backgroundclip string =
    Html.Attributes.style "background-clip" string


backgroundcolor : String -> Html.Attribute msg
backgroundcolor string =
    Html.Attributes.style "background-color" string


backgroundimage : String -> Html.Attribute msg
backgroundimage string =
    Html.Attributes.style "background-image" string


backgroundorigin : String -> Html.Attribute msg
backgroundorigin string =
    Html.Attributes.style "background-origin" string


backgroundposition : String -> Html.Attribute msg
backgroundposition string =
    Html.Attributes.style "background-position" string


backgroundpositionx : String -> Html.Attribute msg
backgroundpositionx string =
    Html.Attributes.style "background-position-x" string


backgroundpositiony : String -> Html.Attribute msg
backgroundpositiony string =
    Html.Attributes.style "background-position-y" string


backgroundrepeat : String -> Html.Attribute msg
backgroundrepeat string =
    Html.Attributes.style "background-repeat" string


backgroundsize : String -> Html.Attribute msg
backgroundsize string =
    Html.Attributes.style "background-size" string


blocksize : String -> Html.Attribute msg
blocksize string =
    Html.Attributes.style "block-size" string


border : String -> Html.Attribute msg
border string =
    Html.Attributes.style "border" string


borderblock : String -> Html.Attribute msg
borderblock string =
    Html.Attributes.style "border-block" string


borderblockcolor : String -> Html.Attribute msg
borderblockcolor string =
    Html.Attributes.style "border-block-color" string


borderblockend : String -> Html.Attribute msg
borderblockend string =
    Html.Attributes.style "border-block-end" string


borderblockendcolor : String -> Html.Attribute msg
borderblockendcolor string =
    Html.Attributes.style "border-block-end-color" string


borderblockendstyle : String -> Html.Attribute msg
borderblockendstyle string =
    Html.Attributes.style "border-block-end-style" string


borderblockendwidth : String -> Html.Attribute msg
borderblockendwidth string =
    Html.Attributes.style "border-block-end-width" string


borderblockstart : String -> Html.Attribute msg
borderblockstart string =
    Html.Attributes.style "border-block-start" string


borderblockstartcolor : String -> Html.Attribute msg
borderblockstartcolor string =
    Html.Attributes.style "border-block-start-color" string


borderblockstartstyle : String -> Html.Attribute msg
borderblockstartstyle string =
    Html.Attributes.style "border-block-start-style" string


borderblockstartwidth : String -> Html.Attribute msg
borderblockstartwidth string =
    Html.Attributes.style "border-block-start-width" string


borderblockstyle : String -> Html.Attribute msg
borderblockstyle string =
    Html.Attributes.style "border-block-style" string


borderblockwidth : String -> Html.Attribute msg
borderblockwidth string =
    Html.Attributes.style "border-block-width" string


borderbottom : String -> Html.Attribute msg
borderbottom string =
    Html.Attributes.style "border-bottom" string


borderbottomcolor : String -> Html.Attribute msg
borderbottomcolor string =
    Html.Attributes.style "border-bottom-color" string


borderbottomleftradius : String -> Html.Attribute msg
borderbottomleftradius string =
    Html.Attributes.style "border-bottom-left-radius" string


borderbottomrightradius : String -> Html.Attribute msg
borderbottomrightradius string =
    Html.Attributes.style "border-bottom-right-radius" string


borderbottomstyle : String -> Html.Attribute msg
borderbottomstyle string =
    Html.Attributes.style "border-bottom-style" string


borderbottomwidth : String -> Html.Attribute msg
borderbottomwidth string =
    Html.Attributes.style "border-bottom-width" string


bordercollapse : String -> Html.Attribute msg
bordercollapse string =
    Html.Attributes.style "border-collapse" string


bordercolor : String -> Html.Attribute msg
bordercolor string =
    Html.Attributes.style "border-color" string


borderendendradius : String -> Html.Attribute msg
borderendendradius string =
    Html.Attributes.style "border-end-end-radius" string


borderendstartradius : String -> Html.Attribute msg
borderendstartradius string =
    Html.Attributes.style "border-end-start-radius" string


borderimage : String -> Html.Attribute msg
borderimage string =
    Html.Attributes.style "border-image" string


borderimageoutset : String -> Html.Attribute msg
borderimageoutset string =
    Html.Attributes.style "border-image-outset" string


borderimagerepeat : String -> Html.Attribute msg
borderimagerepeat string =
    Html.Attributes.style "border-image-repeat" string


borderimageslice : String -> Html.Attribute msg
borderimageslice string =
    Html.Attributes.style "border-image-slice" string


borderimagesource : String -> Html.Attribute msg
borderimagesource string =
    Html.Attributes.style "border-image-source" string


borderimagewidth : String -> Html.Attribute msg
borderimagewidth string =
    Html.Attributes.style "border-image-width" string


borderinline : String -> Html.Attribute msg
borderinline string =
    Html.Attributes.style "border-inline" string


borderinlinecolor : String -> Html.Attribute msg
borderinlinecolor string =
    Html.Attributes.style "border-inline-color" string


borderinlineend : String -> Html.Attribute msg
borderinlineend string =
    Html.Attributes.style "border-inline-end" string


borderinlineendcolor : String -> Html.Attribute msg
borderinlineendcolor string =
    Html.Attributes.style "border-inline-end-color" string


borderinlineendstyle : String -> Html.Attribute msg
borderinlineendstyle string =
    Html.Attributes.style "border-inline-end-style" string


borderinlineendwidth : String -> Html.Attribute msg
borderinlineendwidth string =
    Html.Attributes.style "border-inline-end-width" string


borderinlinestart : String -> Html.Attribute msg
borderinlinestart string =
    Html.Attributes.style "border-inline-start" string


borderinlinestartcolor : String -> Html.Attribute msg
borderinlinestartcolor string =
    Html.Attributes.style "border-inline-start-color" string


borderinlinestartstyle : String -> Html.Attribute msg
borderinlinestartstyle string =
    Html.Attributes.style "border-inline-start-style" string


borderinlinestartwidth : String -> Html.Attribute msg
borderinlinestartwidth string =
    Html.Attributes.style "border-inline-start-width" string


borderinlinestyle : String -> Html.Attribute msg
borderinlinestyle string =
    Html.Attributes.style "border-inline-style" string


borderinlinewidth : String -> Html.Attribute msg
borderinlinewidth string =
    Html.Attributes.style "border-inline-width" string


borderleft : String -> Html.Attribute msg
borderleft string =
    Html.Attributes.style "border-left" string


borderleftcolor : String -> Html.Attribute msg
borderleftcolor string =
    Html.Attributes.style "border-left-color" string


borderleftstyle : String -> Html.Attribute msg
borderleftstyle string =
    Html.Attributes.style "border-left-style" string


borderleftwidth : String -> Html.Attribute msg
borderleftwidth string =
    Html.Attributes.style "border-left-width" string


borderradius : String -> Html.Attribute msg
borderradius string =
    Html.Attributes.style "border-radius" string


borderright : String -> Html.Attribute msg
borderright string =
    Html.Attributes.style "border-right" string


borderrightcolor : String -> Html.Attribute msg
borderrightcolor string =
    Html.Attributes.style "border-right-color" string


borderrightstyle : String -> Html.Attribute msg
borderrightstyle string =
    Html.Attributes.style "border-right-style" string


borderrightwidth : String -> Html.Attribute msg
borderrightwidth string =
    Html.Attributes.style "border-right-width" string


borderspacing : String -> Html.Attribute msg
borderspacing string =
    Html.Attributes.style "border-spacing" string


borderstartendradius : String -> Html.Attribute msg
borderstartendradius string =
    Html.Attributes.style "border-start-end-radius" string


borderstartstartradius : String -> Html.Attribute msg
borderstartstartradius string =
    Html.Attributes.style "border-start-start-radius" string


borderstyle : String -> Html.Attribute msg
borderstyle string =
    Html.Attributes.style "border-style" string


bordertop : String -> Html.Attribute msg
bordertop string =
    Html.Attributes.style "border-top" string


bordertopcolor : String -> Html.Attribute msg
bordertopcolor string =
    Html.Attributes.style "border-top-color" string


bordertopleftradius : String -> Html.Attribute msg
bordertopleftradius string =
    Html.Attributes.style "border-top-left-radius" string


bordertoprightradius : String -> Html.Attribute msg
bordertoprightradius string =
    Html.Attributes.style "border-top-right-radius" string


bordertopstyle : String -> Html.Attribute msg
bordertopstyle string =
    Html.Attributes.style "border-top-style" string


bordertopwidth : String -> Html.Attribute msg
bordertopwidth string =
    Html.Attributes.style "border-top-width" string


borderwidth : String -> Html.Attribute msg
borderwidth string =
    Html.Attributes.style "border-width" string


bottom : String -> Html.Attribute msg
bottom string =
    Html.Attributes.style "bottom" string


boxalign : String -> Html.Attribute msg
boxalign string =
    Html.Attributes.style "box-align" string


boxdecorationbreak : String -> Html.Attribute msg
boxdecorationbreak string =
    Html.Attributes.style "box-decoration-break" string


boxdirection : String -> Html.Attribute msg
boxdirection string =
    Html.Attributes.style "box-direction" string


boxflex : String -> Html.Attribute msg
boxflex string =
    Html.Attributes.style "box-flex" string


boxflexgroup : String -> Html.Attribute msg
boxflexgroup string =
    Html.Attributes.style "box-flex-group" string


boxlines : String -> Html.Attribute msg
boxlines string =
    Html.Attributes.style "box-lines" string


boxordinalgroup : String -> Html.Attribute msg
boxordinalgroup string =
    Html.Attributes.style "box-ordinal-group" string


boxorient : String -> Html.Attribute msg
boxorient string =
    Html.Attributes.style "box-orient" string


boxpack : String -> Html.Attribute msg
boxpack string =
    Html.Attributes.style "box-pack" string


boxshadow : String -> Html.Attribute msg
boxshadow string =
    Html.Attributes.style "box-shadow" string


boxsizing : String -> Html.Attribute msg
boxsizing string =
    Html.Attributes.style "box-sizing" string


breakafter : String -> Html.Attribute msg
breakafter string =
    Html.Attributes.style "break-after" string


breakbefore : String -> Html.Attribute msg
breakbefore string =
    Html.Attributes.style "break-before" string


breakinside : String -> Html.Attribute msg
breakinside string =
    Html.Attributes.style "break-inside" string


captionside : String -> Html.Attribute msg
captionside string =
    Html.Attributes.style "caption-side" string


caret : String -> Html.Attribute msg
caret string =
    Html.Attributes.style "caret" string


caretcolor : String -> Html.Attribute msg
caretcolor string =
    Html.Attributes.style "caret-color" string


caretshape : String -> Html.Attribute msg
caretshape string =
    Html.Attributes.style "caret-shape" string


clear : String -> Html.Attribute msg
clear string =
    Html.Attributes.style "clear" string


clip : String -> Html.Attribute msg
clip string =
    Html.Attributes.style "clip" string


clippath : String -> Html.Attribute msg
clippath string =
    Html.Attributes.style "clip-path" string


color : String -> Html.Attribute msg
color string =
    Html.Attributes.style "color" string


colorscheme : String -> Html.Attribute msg
colorscheme string =
    Html.Attributes.style "color-scheme" string


columncount : String -> Html.Attribute msg
columncount string =
    Html.Attributes.style "column-count" string


columnfill : String -> Html.Attribute msg
columnfill string =
    Html.Attributes.style "column-fill" string


columngap : String -> Html.Attribute msg
columngap string =
    Html.Attributes.style "column-gap" string


columnrule : String -> Html.Attribute msg
columnrule string =
    Html.Attributes.style "column-rule" string


columnrulecolor : String -> Html.Attribute msg
columnrulecolor string =
    Html.Attributes.style "column-rule-color" string


columnrulestyle : String -> Html.Attribute msg
columnrulestyle string =
    Html.Attributes.style "column-rule-style" string


columnrulewidth : String -> Html.Attribute msg
columnrulewidth string =
    Html.Attributes.style "column-rule-width" string


columnspan : String -> Html.Attribute msg
columnspan string =
    Html.Attributes.style "column-span" string


columnwidth : String -> Html.Attribute msg
columnwidth string =
    Html.Attributes.style "column-width" string


columns : String -> Html.Attribute msg
columns string =
    Html.Attributes.style "columns" string


contain : String -> Html.Attribute msg
contain string =
    Html.Attributes.style "contain" string


containintrinsicblocksize : String -> Html.Attribute msg
containintrinsicblocksize string =
    Html.Attributes.style "contain-intrinsic-block-size" string


containintrinsicheight : String -> Html.Attribute msg
containintrinsicheight string =
    Html.Attributes.style "contain-intrinsic-height" string


containintrinsicinlinesize : String -> Html.Attribute msg
containintrinsicinlinesize string =
    Html.Attributes.style "contain-intrinsic-inline-size" string


containintrinsicsize : String -> Html.Attribute msg
containintrinsicsize string =
    Html.Attributes.style "contain-intrinsic-size" string


containintrinsicwidth : String -> Html.Attribute msg
containintrinsicwidth string =
    Html.Attributes.style "contain-intrinsic-width" string


container : String -> Html.Attribute msg
container string =
    Html.Attributes.style "container" string


containername : String -> Html.Attribute msg
containername string =
    Html.Attributes.style "container-name" string


containertype : String -> Html.Attribute msg
containertype string =
    Html.Attributes.style "container-type" string


content : String -> Html.Attribute msg
content string =
    Html.Attributes.style "content" string


contentvisibility : String -> Html.Attribute msg
contentvisibility string =
    Html.Attributes.style "content-visibility" string


counterincrement : String -> Html.Attribute msg
counterincrement string =
    Html.Attributes.style "counter-increment" string


counterreset : String -> Html.Attribute msg
counterreset string =
    Html.Attributes.style "counter-reset" string


counterset : String -> Html.Attribute msg
counterset string =
    Html.Attributes.style "counter-set" string


cursor : String -> Html.Attribute msg
cursor string =
    Html.Attributes.style "cursor" string


direction : String -> Html.Attribute msg
direction string =
    Html.Attributes.style "direction" string


display : String -> Html.Attribute msg
display string =
    Html.Attributes.style "display" string


emptycells : String -> Html.Attribute msg
emptycells string =
    Html.Attributes.style "empty-cells" string


filter : String -> Html.Attribute msg
filter string =
    Html.Attributes.style "filter" string


flex : String -> Html.Attribute msg
flex string =
    Html.Attributes.style "flex" string


flexbasis : String -> Html.Attribute msg
flexbasis string =
    Html.Attributes.style "flex-basis" string


flexdirection : String -> Html.Attribute msg
flexdirection string =
    Html.Attributes.style "flex-direction" string


flexflow : String -> Html.Attribute msg
flexflow string =
    Html.Attributes.style "flex-flow" string


flexgrow : String -> Html.Attribute msg
flexgrow string =
    Html.Attributes.style "flex-grow" string


flexshrink : String -> Html.Attribute msg
flexshrink string =
    Html.Attributes.style "flex-shrink" string


flexwrap : String -> Html.Attribute msg
flexwrap string =
    Html.Attributes.style "flex-wrap" string


float : String -> Html.Attribute msg
float string =
    Html.Attributes.style "float" string


font : String -> Html.Attribute msg
font string =
    Html.Attributes.style "font" string


fontfamily : String -> Html.Attribute msg
fontfamily string =
    Html.Attributes.style "font-family" string


fontfeaturesettings : String -> Html.Attribute msg
fontfeaturesettings string =
    Html.Attributes.style "font-feature-settings" string


fontkerning : String -> Html.Attribute msg
fontkerning string =
    Html.Attributes.style "font-kerning" string


fontlanguageoverride : String -> Html.Attribute msg
fontlanguageoverride string =
    Html.Attributes.style "font-language-override" string


fontopticalsizing : String -> Html.Attribute msg
fontopticalsizing string =
    Html.Attributes.style "font-optical-sizing" string


fontpalette : String -> Html.Attribute msg
fontpalette string =
    Html.Attributes.style "font-palette" string


fontsize : String -> Html.Attribute msg
fontsize string =
    Html.Attributes.style "font-size" string


fontsizeadjust : String -> Html.Attribute msg
fontsizeadjust string =
    Html.Attributes.style "font-size-adjust" string


fontsmooth : String -> Html.Attribute msg
fontsmooth string =
    Html.Attributes.style "font-smooth" string


fontstretch : String -> Html.Attribute msg
fontstretch string =
    Html.Attributes.style "font-stretch" string


fontstyle : String -> Html.Attribute msg
fontstyle string =
    Html.Attributes.style "font-style" string


fontsynthesis : String -> Html.Attribute msg
fontsynthesis string =
    Html.Attributes.style "font-synthesis" string


fontsynthesisposition : String -> Html.Attribute msg
fontsynthesisposition string =
    Html.Attributes.style "font-synthesis-position" string


fontsynthesissmallcaps : String -> Html.Attribute msg
fontsynthesissmallcaps string =
    Html.Attributes.style "font-synthesis-small-caps" string


fontsynthesisstyle : String -> Html.Attribute msg
fontsynthesisstyle string =
    Html.Attributes.style "font-synthesis-style" string


fontsynthesisweight : String -> Html.Attribute msg
fontsynthesisweight string =
    Html.Attributes.style "font-synthesis-weight" string


fontvariant : String -> Html.Attribute msg
fontvariant string =
    Html.Attributes.style "font-variant" string


fontvariantalternates : String -> Html.Attribute msg
fontvariantalternates string =
    Html.Attributes.style "font-variant-alternates" string


fontvariantcaps : String -> Html.Attribute msg
fontvariantcaps string =
    Html.Attributes.style "font-variant-caps" string


fontvarianteastasian : String -> Html.Attribute msg
fontvarianteastasian string =
    Html.Attributes.style "font-variant-east-asian" string


fontvariantemoji : String -> Html.Attribute msg
fontvariantemoji string =
    Html.Attributes.style "font-variant-emoji" string


fontvariantligatures : String -> Html.Attribute msg
fontvariantligatures string =
    Html.Attributes.style "font-variant-ligatures" string


fontvariantnumeric : String -> Html.Attribute msg
fontvariantnumeric string =
    Html.Attributes.style "font-variant-numeric" string


fontvariantposition : String -> Html.Attribute msg
fontvariantposition string =
    Html.Attributes.style "font-variant-position" string


fontvariationsettings : String -> Html.Attribute msg
fontvariationsettings string =
    Html.Attributes.style "font-variation-settings" string


fontweight : String -> Html.Attribute msg
fontweight string =
    Html.Attributes.style "font-weight" string


forcedcoloradjust : String -> Html.Attribute msg
forcedcoloradjust string =
    Html.Attributes.style "forced-color-adjust" string


gap : String -> Html.Attribute msg
gap string =
    Html.Attributes.style "gap" string


grid : String -> Html.Attribute msg
grid string =
    Html.Attributes.style "grid" string


gridarea : String -> Html.Attribute msg
gridarea string =
    Html.Attributes.style "grid-area" string


gridautocolumns : String -> Html.Attribute msg
gridautocolumns string =
    Html.Attributes.style "grid-auto-columns" string


gridautoflow : String -> Html.Attribute msg
gridautoflow string =
    Html.Attributes.style "grid-auto-flow" string


gridautorows : String -> Html.Attribute msg
gridautorows string =
    Html.Attributes.style "grid-auto-rows" string


gridcolumn : String -> Html.Attribute msg
gridcolumn string =
    Html.Attributes.style "grid-column" string


gridcolumnend : String -> Html.Attribute msg
gridcolumnend string =
    Html.Attributes.style "grid-column-end" string


gridcolumngap : String -> Html.Attribute msg
gridcolumngap string =
    Html.Attributes.style "grid-column-gap" string


gridcolumnstart : String -> Html.Attribute msg
gridcolumnstart string =
    Html.Attributes.style "grid-column-start" string


gridgap : String -> Html.Attribute msg
gridgap string =
    Html.Attributes.style "grid-gap" string


gridrow : String -> Html.Attribute msg
gridrow string =
    Html.Attributes.style "grid-row" string


gridrowend : String -> Html.Attribute msg
gridrowend string =
    Html.Attributes.style "grid-row-end" string


gridrowgap : String -> Html.Attribute msg
gridrowgap string =
    Html.Attributes.style "grid-row-gap" string


gridrowstart : String -> Html.Attribute msg
gridrowstart string =
    Html.Attributes.style "grid-row-start" string


gridtemplate : String -> Html.Attribute msg
gridtemplate string =
    Html.Attributes.style "grid-template" string


gridtemplateareas : String -> Html.Attribute msg
gridtemplateareas string =
    Html.Attributes.style "grid-template-areas" string


gridtemplatecolumns : String -> Html.Attribute msg
gridtemplatecolumns string =
    Html.Attributes.style "grid-template-columns" string


gridtemplaterows : String -> Html.Attribute msg
gridtemplaterows string =
    Html.Attributes.style "grid-template-rows" string


hangingpunctuation : String -> Html.Attribute msg
hangingpunctuation string =
    Html.Attributes.style "hanging-punctuation" string


height : String -> Html.Attribute msg
height string =
    Html.Attributes.style "height" string


hyphenatecharacter : String -> Html.Attribute msg
hyphenatecharacter string =
    Html.Attributes.style "hyphenate-character" string


hyphenatelimitchars : String -> Html.Attribute msg
hyphenatelimitchars string =
    Html.Attributes.style "hyphenate-limit-chars" string


hyphens : String -> Html.Attribute msg
hyphens string =
    Html.Attributes.style "hyphens" string


imageorientation : String -> Html.Attribute msg
imageorientation string =
    Html.Attributes.style "image-orientation" string


imagerendering : String -> Html.Attribute msg
imagerendering string =
    Html.Attributes.style "image-rendering" string


imageresolution : String -> Html.Attribute msg
imageresolution string =
    Html.Attributes.style "image-resolution" string


imemode : String -> Html.Attribute msg
imemode string =
    Html.Attributes.style "ime-mode" string


initialletter : String -> Html.Attribute msg
initialletter string =
    Html.Attributes.style "initial-letter" string


initialletteralign : String -> Html.Attribute msg
initialletteralign string =
    Html.Attributes.style "initial-letter-align" string


inlinesize : String -> Html.Attribute msg
inlinesize string =
    Html.Attributes.style "inline-size" string


inputsecurity : String -> Html.Attribute msg
inputsecurity string =
    Html.Attributes.style "input-security" string


inset : String -> Html.Attribute msg
inset string =
    Html.Attributes.style "inset" string


insetblock : String -> Html.Attribute msg
insetblock string =
    Html.Attributes.style "inset-block" string


insetblockend : String -> Html.Attribute msg
insetblockend string =
    Html.Attributes.style "inset-block-end" string


insetblockstart : String -> Html.Attribute msg
insetblockstart string =
    Html.Attributes.style "inset-block-start" string


insetinline : String -> Html.Attribute msg
insetinline string =
    Html.Attributes.style "inset-inline" string


insetinlineend : String -> Html.Attribute msg
insetinlineend string =
    Html.Attributes.style "inset-inline-end" string


insetinlinestart : String -> Html.Attribute msg
insetinlinestart string =
    Html.Attributes.style "inset-inline-start" string


isolation : String -> Html.Attribute msg
isolation string =
    Html.Attributes.style "isolation" string


justifycontent : String -> Html.Attribute msg
justifycontent string =
    Html.Attributes.style "justify-content" string


justifyitems : String -> Html.Attribute msg
justifyitems string =
    Html.Attributes.style "justify-items" string


justifyself : String -> Html.Attribute msg
justifyself string =
    Html.Attributes.style "justify-self" string


justifytracks : String -> Html.Attribute msg
justifytracks string =
    Html.Attributes.style "justify-tracks" string


left : String -> Html.Attribute msg
left string =
    Html.Attributes.style "left" string


letterspacing : String -> Html.Attribute msg
letterspacing string =
    Html.Attributes.style "letter-spacing" string


linebreak : String -> Html.Attribute msg
linebreak string =
    Html.Attributes.style "line-break" string


lineclamp : String -> Html.Attribute msg
lineclamp string =
    Html.Attributes.style "line-clamp" string


lineheight : String -> Html.Attribute msg
lineheight string =
    Html.Attributes.style "line-height" string


lineheightstep : String -> Html.Attribute msg
lineheightstep string =
    Html.Attributes.style "line-height-step" string


liststyle : String -> Html.Attribute msg
liststyle string =
    Html.Attributes.style "list-style" string


liststyleimage : String -> Html.Attribute msg
liststyleimage string =
    Html.Attributes.style "list-style-image" string


liststyleposition : String -> Html.Attribute msg
liststyleposition string =
    Html.Attributes.style "list-style-position" string


liststyletype : String -> Html.Attribute msg
liststyletype string =
    Html.Attributes.style "list-style-type" string


margin : String -> Html.Attribute msg
margin string =
    Html.Attributes.style "margin" string


marginblock : String -> Html.Attribute msg
marginblock string =
    Html.Attributes.style "margin-block" string


marginblockend : String -> Html.Attribute msg
marginblockend string =
    Html.Attributes.style "margin-block-end" string


marginblockstart : String -> Html.Attribute msg
marginblockstart string =
    Html.Attributes.style "margin-block-start" string


marginbottom : String -> Html.Attribute msg
marginbottom string =
    Html.Attributes.style "margin-bottom" string


margininline : String -> Html.Attribute msg
margininline string =
    Html.Attributes.style "margin-inline" string


margininlineend : String -> Html.Attribute msg
margininlineend string =
    Html.Attributes.style "margin-inline-end" string


margininlinestart : String -> Html.Attribute msg
margininlinestart string =
    Html.Attributes.style "margin-inline-start" string


marginleft : String -> Html.Attribute msg
marginleft string =
    Html.Attributes.style "margin-left" string


marginright : String -> Html.Attribute msg
marginright string =
    Html.Attributes.style "margin-right" string


margintop : String -> Html.Attribute msg
margintop string =
    Html.Attributes.style "margin-top" string


margintrim : String -> Html.Attribute msg
margintrim string =
    Html.Attributes.style "margin-trim" string


mask : String -> Html.Attribute msg
mask string =
    Html.Attributes.style "mask" string


maskborder : String -> Html.Attribute msg
maskborder string =
    Html.Attributes.style "mask-border" string


maskbordermode : String -> Html.Attribute msg
maskbordermode string =
    Html.Attributes.style "mask-border-mode" string


maskborderoutset : String -> Html.Attribute msg
maskborderoutset string =
    Html.Attributes.style "mask-border-outset" string


maskborderrepeat : String -> Html.Attribute msg
maskborderrepeat string =
    Html.Attributes.style "mask-border-repeat" string


maskborderslice : String -> Html.Attribute msg
maskborderslice string =
    Html.Attributes.style "mask-border-slice" string


maskbordersource : String -> Html.Attribute msg
maskbordersource string =
    Html.Attributes.style "mask-border-source" string


maskborderwidth : String -> Html.Attribute msg
maskborderwidth string =
    Html.Attributes.style "mask-border-width" string


maskclip : String -> Html.Attribute msg
maskclip string =
    Html.Attributes.style "mask-clip" string


maskcomposite : String -> Html.Attribute msg
maskcomposite string =
    Html.Attributes.style "mask-composite" string


maskimage : String -> Html.Attribute msg
maskimage string =
    Html.Attributes.style "mask-image" string


maskmode : String -> Html.Attribute msg
maskmode string =
    Html.Attributes.style "mask-mode" string


maskorigin : String -> Html.Attribute msg
maskorigin string =
    Html.Attributes.style "mask-origin" string


maskposition : String -> Html.Attribute msg
maskposition string =
    Html.Attributes.style "mask-position" string


maskrepeat : String -> Html.Attribute msg
maskrepeat string =
    Html.Attributes.style "mask-repeat" string


masksize : String -> Html.Attribute msg
masksize string =
    Html.Attributes.style "mask-size" string


masktype : String -> Html.Attribute msg
masktype string =
    Html.Attributes.style "mask-type" string


masonryautoflow : String -> Html.Attribute msg
masonryautoflow string =
    Html.Attributes.style "masonry-auto-flow" string


mathdepth : String -> Html.Attribute msg
mathdepth string =
    Html.Attributes.style "math-depth" string


mathshift : String -> Html.Attribute msg
mathshift string =
    Html.Attributes.style "math-shift" string


mathstyle : String -> Html.Attribute msg
mathstyle string =
    Html.Attributes.style "math-style" string


maxblocksize : String -> Html.Attribute msg
maxblocksize string =
    Html.Attributes.style "max-block-size" string


maxheight : String -> Html.Attribute msg
maxheight string =
    Html.Attributes.style "max-height" string


maxinlinesize : String -> Html.Attribute msg
maxinlinesize string =
    Html.Attributes.style "max-inline-size" string


maxlines : String -> Html.Attribute msg
maxlines string =
    Html.Attributes.style "max-lines" string


maxwidth : String -> Html.Attribute msg
maxwidth string =
    Html.Attributes.style "max-width" string


minblocksize : String -> Html.Attribute msg
minblocksize string =
    Html.Attributes.style "min-block-size" string


minheight : String -> Html.Attribute msg
minheight string =
    Html.Attributes.style "min-height" string


mininlinesize : String -> Html.Attribute msg
mininlinesize string =
    Html.Attributes.style "min-inline-size" string


minwidth : String -> Html.Attribute msg
minwidth string =
    Html.Attributes.style "min-width" string


mixblendmode : String -> Html.Attribute msg
mixblendmode string =
    Html.Attributes.style "mix-blend-mode" string


objectfit : String -> Html.Attribute msg
objectfit string =
    Html.Attributes.style "object-fit" string


objectposition : String -> Html.Attribute msg
objectposition string =
    Html.Attributes.style "object-position" string


offset : String -> Html.Attribute msg
offset string =
    Html.Attributes.style "offset" string


offsetanchor : String -> Html.Attribute msg
offsetanchor string =
    Html.Attributes.style "offset-anchor" string


offsetdistance : String -> Html.Attribute msg
offsetdistance string =
    Html.Attributes.style "offset-distance" string


offsetpath : String -> Html.Attribute msg
offsetpath string =
    Html.Attributes.style "offset-path" string


offsetposition : String -> Html.Attribute msg
offsetposition string =
    Html.Attributes.style "offset-position" string


offsetrotate : String -> Html.Attribute msg
offsetrotate string =
    Html.Attributes.style "offset-rotate" string


opacity : String -> Html.Attribute msg
opacity string =
    Html.Attributes.style "opacity" string


order : String -> Html.Attribute msg
order string =
    Html.Attributes.style "order" string


orphans : String -> Html.Attribute msg
orphans string =
    Html.Attributes.style "orphans" string


outline : String -> Html.Attribute msg
outline string =
    Html.Attributes.style "outline" string


outlinecolor : String -> Html.Attribute msg
outlinecolor string =
    Html.Attributes.style "outline-color" string


outlineoffset : String -> Html.Attribute msg
outlineoffset string =
    Html.Attributes.style "outline-offset" string


outlinestyle : String -> Html.Attribute msg
outlinestyle string =
    Html.Attributes.style "outline-style" string


outlinewidth : String -> Html.Attribute msg
outlinewidth string =
    Html.Attributes.style "outline-width" string


overflow : String -> Html.Attribute msg
overflow string =
    Html.Attributes.style "overflow" string


overflowanchor : String -> Html.Attribute msg
overflowanchor string =
    Html.Attributes.style "overflow-anchor" string


overflowblock : String -> Html.Attribute msg
overflowblock string =
    Html.Attributes.style "overflow-block" string


overflowclipbox : String -> Html.Attribute msg
overflowclipbox string =
    Html.Attributes.style "overflow-clip-box" string


overflowclipmargin : String -> Html.Attribute msg
overflowclipmargin string =
    Html.Attributes.style "overflow-clip-margin" string


overflowinline : String -> Html.Attribute msg
overflowinline string =
    Html.Attributes.style "overflow-inline" string


overflowwrap : String -> Html.Attribute msg
overflowwrap string =
    Html.Attributes.style "overflow-wrap" string


overflowx : String -> Html.Attribute msg
overflowx string =
    Html.Attributes.style "overflow-x" string


overflowy : String -> Html.Attribute msg
overflowy string =
    Html.Attributes.style "overflow-y" string


overlay : String -> Html.Attribute msg
overlay string =
    Html.Attributes.style "overlay" string


overscrollbehavior : String -> Html.Attribute msg
overscrollbehavior string =
    Html.Attributes.style "overscroll-behavior" string


overscrollbehaviorblock : String -> Html.Attribute msg
overscrollbehaviorblock string =
    Html.Attributes.style "overscroll-behavior-block" string


overscrollbehaviorinline : String -> Html.Attribute msg
overscrollbehaviorinline string =
    Html.Attributes.style "overscroll-behavior-inline" string


overscrollbehaviorx : String -> Html.Attribute msg
overscrollbehaviorx string =
    Html.Attributes.style "overscroll-behavior-x" string


overscrollbehaviory : String -> Html.Attribute msg
overscrollbehaviory string =
    Html.Attributes.style "overscroll-behavior-y" string


padding : String -> Html.Attribute msg
padding string =
    Html.Attributes.style "padding" string


paddingblock : String -> Html.Attribute msg
paddingblock string =
    Html.Attributes.style "padding-block" string


paddingblockend : String -> Html.Attribute msg
paddingblockend string =
    Html.Attributes.style "padding-block-end" string


paddingblockstart : String -> Html.Attribute msg
paddingblockstart string =
    Html.Attributes.style "padding-block-start" string


paddingbottom : String -> Html.Attribute msg
paddingbottom string =
    Html.Attributes.style "padding-bottom" string


paddinginline : String -> Html.Attribute msg
paddinginline string =
    Html.Attributes.style "padding-inline" string


paddinginlineend : String -> Html.Attribute msg
paddinginlineend string =
    Html.Attributes.style "padding-inline-end" string


paddinginlinestart : String -> Html.Attribute msg
paddinginlinestart string =
    Html.Attributes.style "padding-inline-start" string


paddingleft : String -> Html.Attribute msg
paddingleft string =
    Html.Attributes.style "padding-left" string


paddingright : String -> Html.Attribute msg
paddingright string =
    Html.Attributes.style "padding-right" string


paddingtop : String -> Html.Attribute msg
paddingtop string =
    Html.Attributes.style "padding-top" string


page : String -> Html.Attribute msg
page string =
    Html.Attributes.style "page" string


pagebreakafter : String -> Html.Attribute msg
pagebreakafter string =
    Html.Attributes.style "page-break-after" string


pagebreakbefore : String -> Html.Attribute msg
pagebreakbefore string =
    Html.Attributes.style "page-break-before" string


pagebreakinside : String -> Html.Attribute msg
pagebreakinside string =
    Html.Attributes.style "page-break-inside" string


paintorder : String -> Html.Attribute msg
paintorder string =
    Html.Attributes.style "paint-order" string


perspective : String -> Html.Attribute msg
perspective string =
    Html.Attributes.style "perspective" string


perspectiveorigin : String -> Html.Attribute msg
perspectiveorigin string =
    Html.Attributes.style "perspective-origin" string


placecontent : String -> Html.Attribute msg
placecontent string =
    Html.Attributes.style "place-content" string


placeitems : String -> Html.Attribute msg
placeitems string =
    Html.Attributes.style "place-items" string


placeself : String -> Html.Attribute msg
placeself string =
    Html.Attributes.style "place-self" string


pointerevents : String -> Html.Attribute msg
pointerevents string =
    Html.Attributes.style "pointer-events" string


position : String -> Html.Attribute msg
position string =
    Html.Attributes.style "position" string


printcoloradjust : String -> Html.Attribute msg
printcoloradjust string =
    Html.Attributes.style "print-color-adjust" string


quotes : String -> Html.Attribute msg
quotes string =
    Html.Attributes.style "quotes" string


resize : String -> Html.Attribute msg
resize string =
    Html.Attributes.style "resize" string


right : String -> Html.Attribute msg
right string =
    Html.Attributes.style "right" string


rotate : String -> Html.Attribute msg
rotate string =
    Html.Attributes.style "rotate" string


rowgap : String -> Html.Attribute msg
rowgap string =
    Html.Attributes.style "row-gap" string


rubyalign : String -> Html.Attribute msg
rubyalign string =
    Html.Attributes.style "ruby-align" string


rubymerge : String -> Html.Attribute msg
rubymerge string =
    Html.Attributes.style "ruby-merge" string


rubyposition : String -> Html.Attribute msg
rubyposition string =
    Html.Attributes.style "ruby-position" string


scale : String -> Html.Attribute msg
scale string =
    Html.Attributes.style "scale" string


scrollbehavior : String -> Html.Attribute msg
scrollbehavior string =
    Html.Attributes.style "scroll-behavior" string


scrollmargin : String -> Html.Attribute msg
scrollmargin string =
    Html.Attributes.style "scroll-margin" string


scrollmarginblock : String -> Html.Attribute msg
scrollmarginblock string =
    Html.Attributes.style "scroll-margin-block" string


scrollmarginblockend : String -> Html.Attribute msg
scrollmarginblockend string =
    Html.Attributes.style "scroll-margin-block-end" string


scrollmarginblockstart : String -> Html.Attribute msg
scrollmarginblockstart string =
    Html.Attributes.style "scroll-margin-block-start" string


scrollmarginbottom : String -> Html.Attribute msg
scrollmarginbottom string =
    Html.Attributes.style "scroll-margin-bottom" string


scrollmargininline : String -> Html.Attribute msg
scrollmargininline string =
    Html.Attributes.style "scroll-margin-inline" string


scrollmargininlineend : String -> Html.Attribute msg
scrollmargininlineend string =
    Html.Attributes.style "scroll-margin-inline-end" string


scrollmargininlinestart : String -> Html.Attribute msg
scrollmargininlinestart string =
    Html.Attributes.style "scroll-margin-inline-start" string


scrollmarginleft : String -> Html.Attribute msg
scrollmarginleft string =
    Html.Attributes.style "scroll-margin-left" string


scrollmarginright : String -> Html.Attribute msg
scrollmarginright string =
    Html.Attributes.style "scroll-margin-right" string


scrollmargintop : String -> Html.Attribute msg
scrollmargintop string =
    Html.Attributes.style "scroll-margin-top" string


scrollpadding : String -> Html.Attribute msg
scrollpadding string =
    Html.Attributes.style "scroll-padding" string


scrollpaddingblock : String -> Html.Attribute msg
scrollpaddingblock string =
    Html.Attributes.style "scroll-padding-block" string


scrollpaddingblockend : String -> Html.Attribute msg
scrollpaddingblockend string =
    Html.Attributes.style "scroll-padding-block-end" string


scrollpaddingblockstart : String -> Html.Attribute msg
scrollpaddingblockstart string =
    Html.Attributes.style "scroll-padding-block-start" string


scrollpaddingbottom : String -> Html.Attribute msg
scrollpaddingbottom string =
    Html.Attributes.style "scroll-padding-bottom" string


scrollpaddinginline : String -> Html.Attribute msg
scrollpaddinginline string =
    Html.Attributes.style "scroll-padding-inline" string


scrollpaddinginlineend : String -> Html.Attribute msg
scrollpaddinginlineend string =
    Html.Attributes.style "scroll-padding-inline-end" string


scrollpaddinginlinestart : String -> Html.Attribute msg
scrollpaddinginlinestart string =
    Html.Attributes.style "scroll-padding-inline-start" string


scrollpaddingleft : String -> Html.Attribute msg
scrollpaddingleft string =
    Html.Attributes.style "scroll-padding-left" string


scrollpaddingright : String -> Html.Attribute msg
scrollpaddingright string =
    Html.Attributes.style "scroll-padding-right" string


scrollpaddingtop : String -> Html.Attribute msg
scrollpaddingtop string =
    Html.Attributes.style "scroll-padding-top" string


scrollsnapalign : String -> Html.Attribute msg
scrollsnapalign string =
    Html.Attributes.style "scroll-snap-align" string


scrollsnapcoordinate : String -> Html.Attribute msg
scrollsnapcoordinate string =
    Html.Attributes.style "scroll-snap-coordinate" string


scrollsnapdestination : String -> Html.Attribute msg
scrollsnapdestination string =
    Html.Attributes.style "scroll-snap-destination" string


scrollsnappointsx : String -> Html.Attribute msg
scrollsnappointsx string =
    Html.Attributes.style "scroll-snap-points-x" string


scrollsnappointsy : String -> Html.Attribute msg
scrollsnappointsy string =
    Html.Attributes.style "scroll-snap-points-y" string


scrollsnapstop : String -> Html.Attribute msg
scrollsnapstop string =
    Html.Attributes.style "scroll-snap-stop" string


scrollsnaptype : String -> Html.Attribute msg
scrollsnaptype string =
    Html.Attributes.style "scroll-snap-type" string


scrollsnaptypex : String -> Html.Attribute msg
scrollsnaptypex string =
    Html.Attributes.style "scroll-snap-type-x" string


scrollsnaptypey : String -> Html.Attribute msg
scrollsnaptypey string =
    Html.Attributes.style "scroll-snap-type-y" string


scrolltimeline : String -> Html.Attribute msg
scrolltimeline string =
    Html.Attributes.style "scroll-timeline" string


scrolltimelineaxis : String -> Html.Attribute msg
scrolltimelineaxis string =
    Html.Attributes.style "scroll-timeline-axis" string


scrolltimelinename : String -> Html.Attribute msg
scrolltimelinename string =
    Html.Attributes.style "scroll-timeline-name" string


scrollbarcolor : String -> Html.Attribute msg
scrollbarcolor string =
    Html.Attributes.style "scrollbar-color" string


scrollbargutter : String -> Html.Attribute msg
scrollbargutter string =
    Html.Attributes.style "scrollbar-gutter" string


scrollbarwidth : String -> Html.Attribute msg
scrollbarwidth string =
    Html.Attributes.style "scrollbar-width" string


shapeimagethreshold : String -> Html.Attribute msg
shapeimagethreshold string =
    Html.Attributes.style "shape-image-threshold" string


shapemargin : String -> Html.Attribute msg
shapemargin string =
    Html.Attributes.style "shape-margin" string


shapeoutside : String -> Html.Attribute msg
shapeoutside string =
    Html.Attributes.style "shape-outside" string


tabsize : String -> Html.Attribute msg
tabsize string =
    Html.Attributes.style "tab-size" string


tablelayout : String -> Html.Attribute msg
tablelayout string =
    Html.Attributes.style "table-layout" string


textalign : String -> Html.Attribute msg
textalign string =
    Html.Attributes.style "text-align" string


textalignlast : String -> Html.Attribute msg
textalignlast string =
    Html.Attributes.style "text-align-last" string


textcombineupright : String -> Html.Attribute msg
textcombineupright string =
    Html.Attributes.style "text-combine-upright" string


textdecoration : String -> Html.Attribute msg
textdecoration string =
    Html.Attributes.style "text-decoration" string


textdecorationcolor : String -> Html.Attribute msg
textdecorationcolor string =
    Html.Attributes.style "text-decoration-color" string


textdecorationline : String -> Html.Attribute msg
textdecorationline string =
    Html.Attributes.style "text-decoration-line" string


textdecorationskip : String -> Html.Attribute msg
textdecorationskip string =
    Html.Attributes.style "text-decoration-skip" string


textdecorationskipink : String -> Html.Attribute msg
textdecorationskipink string =
    Html.Attributes.style "text-decoration-skip-ink" string


textdecorationstyle : String -> Html.Attribute msg
textdecorationstyle string =
    Html.Attributes.style "text-decoration-style" string


textdecorationthickness : String -> Html.Attribute msg
textdecorationthickness string =
    Html.Attributes.style "text-decoration-thickness" string


textemphasis : String -> Html.Attribute msg
textemphasis string =
    Html.Attributes.style "text-emphasis" string


textemphasiscolor : String -> Html.Attribute msg
textemphasiscolor string =
    Html.Attributes.style "text-emphasis-color" string


textemphasisposition : String -> Html.Attribute msg
textemphasisposition string =
    Html.Attributes.style "text-emphasis-position" string


textemphasisstyle : String -> Html.Attribute msg
textemphasisstyle string =
    Html.Attributes.style "text-emphasis-style" string


textindent : String -> Html.Attribute msg
textindent string =
    Html.Attributes.style "text-indent" string


textjustify : String -> Html.Attribute msg
textjustify string =
    Html.Attributes.style "text-justify" string


textorientation : String -> Html.Attribute msg
textorientation string =
    Html.Attributes.style "text-orientation" string


textoverflow : String -> Html.Attribute msg
textoverflow string =
    Html.Attributes.style "text-overflow" string


textrendering : String -> Html.Attribute msg
textrendering string =
    Html.Attributes.style "text-rendering" string


textshadow : String -> Html.Attribute msg
textshadow string =
    Html.Attributes.style "text-shadow" string


textsizeadjust : String -> Html.Attribute msg
textsizeadjust string =
    Html.Attributes.style "text-size-adjust" string


texttransform : String -> Html.Attribute msg
texttransform string =
    Html.Attributes.style "text-transform" string


textunderlineoffset : String -> Html.Attribute msg
textunderlineoffset string =
    Html.Attributes.style "text-underline-offset" string


textunderlineposition : String -> Html.Attribute msg
textunderlineposition string =
    Html.Attributes.style "text-underline-position" string


textwrap : String -> Html.Attribute msg
textwrap string =
    Html.Attributes.style "text-wrap" string


timelinescope : String -> Html.Attribute msg
timelinescope string =
    Html.Attributes.style "timeline-scope" string


top : String -> Html.Attribute msg
top string =
    Html.Attributes.style "top" string


touchaction : String -> Html.Attribute msg
touchaction string =
    Html.Attributes.style "touch-action" string


transform : String -> Html.Attribute msg
transform string =
    Html.Attributes.style "transform" string


transformbox : String -> Html.Attribute msg
transformbox string =
    Html.Attributes.style "transform-box" string


transformorigin : String -> Html.Attribute msg
transformorigin string =
    Html.Attributes.style "transform-origin" string


transformstyle : String -> Html.Attribute msg
transformstyle string =
    Html.Attributes.style "transform-style" string


transition : String -> Html.Attribute msg
transition string =
    Html.Attributes.style "transition" string


transitionbehavior : String -> Html.Attribute msg
transitionbehavior string =
    Html.Attributes.style "transition-behavior" string


transitiondelay : String -> Html.Attribute msg
transitiondelay string =
    Html.Attributes.style "transition-delay" string


transitionduration : String -> Html.Attribute msg
transitionduration string =
    Html.Attributes.style "transition-duration" string


transitionproperty : String -> Html.Attribute msg
transitionproperty string =
    Html.Attributes.style "transition-property" string


transitiontimingfunction : String -> Html.Attribute msg
transitiontimingfunction string =
    Html.Attributes.style "transition-timing-function" string


translate : String -> Html.Attribute msg
translate string =
    Html.Attributes.style "translate" string


unicodebidi : String -> Html.Attribute msg
unicodebidi string =
    Html.Attributes.style "unicode-bidi" string


userselect : String -> Html.Attribute msg
userselect string =
    Html.Attributes.style "user-select" string


verticalalign : String -> Html.Attribute msg
verticalalign string =
    Html.Attributes.style "vertical-align" string


viewtimeline : String -> Html.Attribute msg
viewtimeline string =
    Html.Attributes.style "view-timeline" string


viewtimelineaxis : String -> Html.Attribute msg
viewtimelineaxis string =
    Html.Attributes.style "view-timeline-axis" string


viewtimelineinset : String -> Html.Attribute msg
viewtimelineinset string =
    Html.Attributes.style "view-timeline-inset" string


viewtimelinename : String -> Html.Attribute msg
viewtimelinename string =
    Html.Attributes.style "view-timeline-name" string


viewtransitionname : String -> Html.Attribute msg
viewtransitionname string =
    Html.Attributes.style "view-transition-name" string


visibility : String -> Html.Attribute msg
visibility string =
    Html.Attributes.style "visibility" string


whitespace : String -> Html.Attribute msg
whitespace string =
    Html.Attributes.style "white-space" string


whitespacecollapse : String -> Html.Attribute msg
whitespacecollapse string =
    Html.Attributes.style "white-space-collapse" string


widows : String -> Html.Attribute msg
widows string =
    Html.Attributes.style "widows" string


width : String -> Html.Attribute msg
width string =
    Html.Attributes.style "width" string


willchange : String -> Html.Attribute msg
willchange string =
    Html.Attributes.style "will-change" string


wordbreak : String -> Html.Attribute msg
wordbreak string =
    Html.Attributes.style "word-break" string


wordspacing : String -> Html.Attribute msg
wordspacing string =
    Html.Attributes.style "word-spacing" string


wordwrap : String -> Html.Attribute msg
wordwrap string =
    Html.Attributes.style "word-wrap" string


writingmode : String -> Html.Attribute msg
writingmode string =
    Html.Attributes.style "writing-mode" string


zindex : String -> Html.Attribute msg
zindex string =
    Html.Attributes.style "z-index" string


zoom : String -> Html.Attribute msg
zoom string =
    Html.Attributes.style "zoom" string