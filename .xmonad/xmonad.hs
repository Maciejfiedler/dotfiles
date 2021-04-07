import XMonad hiding ( (|||) )
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Layout.Maximize
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import System.IO

myTerminal = "kitty"
myBrowser = "brave"
rofiLauncher = "rofi -modi run -show run -theme Monokai"

myLayout = 
    renamed [CutWordsLeft 1] 
    $ maximize 
    $ avoidStruts 
    (tiled |||
    Mirror tiled) ||| 
    noBorders Full
  where tiled = Tall 1 (3/100) (1/2)

main = do   
    xmproc <- spawnPipe "xmobar" -- bar
    spawn "bash ~/.screenlayout/1monitor.sh" -- monitor script
    -- trayer
    spawn "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --height 19 --alpha 150 --tint 0x00000"
    spawn "nitrogen --restore" --wallpaper
    spawn "picom" --picom
    xmonad $ docks def
        { terminal = myTerminal
        , focusedBorderColor = "#302d75"
        , normalBorderColor = "#000000"
        , borderWidth = 2
        , layoutHook = myLayout
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppSep = " | "
                        , ppTitle = xmobarColor "#d1e3ff" "" . shorten 60
                        , ppLayout = xmobarColor "#679df0" "" 
                        , ppCurrent = xmobarColor "#3c7ae6" "" . wrap "[" "]"
                        , ppHidden = xmobarColor "#3b5e94" ""
                        , ppHiddenNoWindows = xmobarColor "#142033" ""
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        }
        `additionalKeysP` 
        [ ("M-M1-<Return>", spawn myTerminal) -- launch terminal
        , ("M-M1-b", spawn myBrowser) -- launch browser
        , ("M1-f", sendMessage $ JumpToLayout "Full") -- jump to fullscreen layout
        , ("M1-r", withFocused (sendMessage . maximizeRestore)) -- maximize restore window
        , ("M1-w", kill) -- close window
        , ("M1-p", spawn rofiLauncher)
        ]
