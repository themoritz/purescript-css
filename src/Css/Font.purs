module Css.Font where

import Prelude
import Css.Color
import Css.Property
import Css.Size
import Css.String
import Css.Stylesheet
import qualified Data.Array.NonEmpty as NEL

color :: Color -> Css
color = key $ fromString "color"

newtype GenericFontFamily = GenericFontFamily Value

instance valGenericFontFamily :: Val GenericFontFamily where
  value (GenericFontFamily v) = v

sansSerif :: GenericFontFamily
sansSerif = GenericFontFamily $ fromString "sans-serif"

fontFamily :: Array String -> NEL.NonEmpty GenericFontFamily -> Css
fontFamily a b = key (fromString "font-family") <<< value $ (value <<< quote <$> a) <> NEL.toArray (value <$> b)

fontSize :: forall a. Size a -> Css
fontSize = key $ fromString "font-size"

newtype FontWeight = FontWeight Value

instance valFontWeight :: Val FontWeight where
  value (FontWeight v) = v

bold :: FontWeight
bold = FontWeight $ fromString "bold"

bolder :: FontWeight
bolder = FontWeight $ fromString "bolder"

lighter :: FontWeight
lighter = FontWeight $ fromString "lighter"

weight :: Number -> FontWeight
weight i = FontWeight $ value i

fontWeight :: FontWeight -> Css
fontWeight = key $ fromString "font-weight"
