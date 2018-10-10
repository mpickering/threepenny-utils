module Graphics.UI.Threepenny.Canvas.Utils where

import Graphics.UI.Threepenny

measureText :: Canvas -> String -> UI Double
measureText c s =  do
  callFunction $ ffi "%1.getContext('2d').measureText(%2).width" c s

save :: Canvas -> UI ()
save c = runFunction $ ffi "%1.getContext('2d').save();" c

restore :: Canvas -> UI ()
restore c = runFunction $ ffi "%1.getContext('2d').restore();" c

translate :: Double -> Double -> Canvas -> UI ()
translate x y c = runFunction $ ffi "%1.getContext('2d').translate(%2, %3);" c x y

scale :: Double -> Double -> Canvas -> UI ()
scale x y c = do
  runFunction $ ffi "%1.getContext('2d').scale(%2, %3);" c x y

arcNegative :: Point -> Double -> Double -> Double -> Canvas -> UI ()
arcNegative p d1 d2 d3 = arc' p d1 d2 d3 True

curveTo :: Double -> Double -> Double -> Double -> Double -> Double -> Canvas -> UI ()
curveTo a1 a2 a3 a4 a5 a6 c =
  runFunction $ ffi "%1.getContext('2d').bezierCurveTo(%2, %3, %4, %5, %6, %7);" c a1 a2 a3 a4 a5 a6
