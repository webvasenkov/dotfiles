-- Base
import XMonad

-- Util
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.Cursor
import XMonad.Util.SpawnOnce

-- Layout
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.ShowWName
import XMonad.Layout.GridVariants
import XMonad.Layout.ResizableTile
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.NoBorders

-- Action
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Actions.CycleWS (nextScreen, prevScreen)

toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
toggleStrutsKey XConfig{ modMask = m } = (m, xK_b)

myModKey :: KeyMask
myModKey = mod4Mask

myTerminal :: String
myTerminal = "alacritty"

main :: IO ()
main = xmonad
     . ewmh  =<< statusBar "xmobar ~/.config/xmobar/xmobarrc" def toggleStrutsKey myConfig
  where
myConfig = def
    { modMask = myModKey
    , terminal  = myTerminal
    , layoutHook = myLayoutHook
    , normalBorderColor = "#dbc5f9"
    , focusedBorderColor = "#bd93f9"
    , borderWidth = 1
    , handleEventHook = handleEventHook def <+> fullscreenEventHook
    , startupHook = setDefaultCursor xC_left_ptr <+> myStartupHook
    , workspaces = myWorkspaces
    }
    `additionalKeysP`
    [ ("M-]", spawn "firefox")
    , ("M-p", spawn "dmenu_run -fn monospace:bold:size=10 -nb '#1e2029' -sf '#bd93f9' -sb '#1e2029' -nf '#f1f1f0'")
    , ("M-<Return>", spawn "alacritty")
    , ("M-f", sendMessage (Toggle FULL) >> sendMessage ToggleStruts)
    , ("<Print>", spawn "scrot -q 100")
    , ("M-.", nextScreen)
    , ("M-,", prevScreen)
    ]

mySpacing = spacingRaw False (Border 9 9 9 9) True (Border 3 3 3 3) True

myLayoutHook = smartBorders $ mkToggle (NOBORDERS ?? FULL ?? EOT) $ mySpacing (tiled ||| Mirror tiled ||| Full ||| threeCol)
  where
     -- tiled
     tiled = Tall nmaster delta ratio

     -- threeCol
     threeCol = ThreeColMid nmaster delta ratio 

     -- The default number of windows in the master pane
     nmaster = 1
     
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

myStartupHook = do 
    spawnOnce "fstrim /"
    spawnOnce "feh --bg-fill ~/Pictures/wallpapers/0057.jpg"
    spawnOnce "picom --experimental-backends &"
    spawnOnce "xmousepasteblock"
    spawnOnce "xrandr --output eDP-1 --off --output HDMI-1"
    spawnOnce "xcalib ~/.config/hp-x27q-calibration.icm"

myWorkspaces = ["dev", "www", "chill", "fun"]

myShowWNameTheme = def 
    { swn_font = "xtf:Hack:bold:size=60"
    , swn_fade = 1.0
    , swn_bgcolor = "#000000"
    , swn_color = "#ffffff"
    }