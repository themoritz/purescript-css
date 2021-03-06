module Css.FontFace where

import Prelude
import Css.Property
import Css.String
import Css.Stylesheet
import Data.Maybe
import qualified Data.Array.NonEmpty as NEL

fontFaceFamily :: String -> Css
fontFaceFamily = key (fromString "font-family") <<< Literal

data FontFaceFormat = WOFF
                    | WOFF2
                    | TrueType
                    | OpenType
                    | EmbeddedOpenType
                    | SVG

formatName :: FontFaceFormat -> String
formatName WOFF             = "woff"
formatName WOFF2            = "woff2"
formatName TrueType         = "truetype"
formatName OpenType         = "opentype"
formatName EmbeddedOpenType = "embedded-opentype"
formatName SVG              = "svg"

data FontFaceSrc = FontFaceSrcUrl String (Maybe FontFaceFormat)
                 | FontFaceSrcLocal String

instance valFontFaceSrc :: Val FontFaceSrc where
  value (FontFaceSrcUrl u f) = fromString $ "url(" <> quote u <> ")" <> maybe "" (\f' -> " format(" <> formatName f' <> ")") f
  value (FontFaceSrcLocal l) = fromString $ "local(" <> quote l <> ")"

fontFaceSrc :: NEL.NonEmpty FontFaceSrc -> Css
fontFaceSrc = key $ fromString "src"
