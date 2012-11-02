import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.SimplestFloat
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.Window
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map as M

myFont              = "xft:Ubuntu:style=Bold:size=14"
myWhiteColor        = "#ffffff"
myLightGreyColor    = "#aaaaaa"
myGreyColor         = "#646464"
myDarkGreyColor     = "#323232"
myBlackColor        = "#000000"
myBlueColor         = "#2c72c7"
myRedColor          = "#e20800"
myBorderWidth       = 2
myTerminal          = "konsole"
myBar               = "xmobar"
myWorkspaces        = ["ZSH","VIM","QTC","WEB","IRC","PIM","MPD","ETC"]
myModMask           = mod4Mask
myAltMask           = mod1Mask
myLogHook = updatePointer (Relative 0.98 0.94)

-- Keybindings
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [
        ((modm, xK_Tab), sendMessage NextLayout),
        ((modm, xK_Escape), spawn "slock"),
        ((modm .|. shiftMask, xK_Escape), io (exitWith ExitSuccess)),
        ((modm, xK_r), spawn "xmonad --recompile; xmonad --restart"),
        ((modm, xK_Return), spawn $ XMonad.terminal conf),
        ((modm, xK_n), prevWS),
        ((modm .|. shiftMask, xK_n), shiftToPrev >> prevWS),
        ((modm, xK_e), windows W.focusDown),
        ((modm, xK_i), windows W.focusUp),
        ((modm, xK_o), nextWS),
        ((modm .|. shiftMask, xK_o), shiftToNext >> nextWS),
        ((modm, xK_k), kill),
        ((modm, xK_m), windows W.swapMaster),
        ((modm, xK_comma), sendMessage Shrink),
        ((modm, xK_period), sendMessage Expand),
        ((0, 0x1008FF11), spawn "amixer set Master 2-"),
        ((0, 0x1008FF12), spawn "amixer set Master toggle"),
        ((0, 0x1008FF13), spawn "amixer set Master 2+"),
        ((modm, xK_s), spawn "scrot '%Y-%m-%d_$wx$h.png' -t 10 -e 'mv $f ~/pictures/screenshots/' -e 'mv $m ~/pictures/screenshots/'"),
        ((modm, xK_space), shellPrompt myXPConfig),
        ((modm .|. myAltMask, xK_space), windowPromptGoto myXPConfig)
    ]

-- Mouse keybindings
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [
        ((modm, button1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster)),
        ((modm, button2), (\w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster)),
        ((modm, button3), windows . W.sink)
    ]

-- Layouts
myFull = noBorders Full
myWide = Mirror $ Tall nmaster delta ratio
    where
        nmaster = 1
        delta   = 4/100
        ratio   = 80/100
myFloat = simplestFloat
myLayout =
    avoidStruts $
        renamed [Replace "Full"] myFull ||| renamed [Replace "Wide"] myWide ||| renamed [Replace "Float"] myFloat

-- Window rules
myManageHook = composeAll
    [
        className =? "kontact" --> doShift "PIM",
        className =? "konversation" --> doShift "IRC",
        className =? "opera" --> doShift "WEB",
        className =? "qmpdclient" --> doShift "MPD",
        className =? "qtcreator" --> doShift "QTC",
        className =? "transmission-qt" --> doShift "WEB",
        -- className =? "digikam" --> doShift "4",
        -- className =? "smplayer" --> doShift "4",
        className =? "xmessage" --> doCenterFloat
    ]

-- Panel
myPP = xmobarPP
    {
        ppCurrent = xmobarColor myBlueColor "",
        ppVisible = xmobarColor myBlueColor "",
        ppHidden = xmobarColor myGreyColor "",
        ppHiddenNoWindows = xmobarColor myDarkGreyColor "",
        ppUrgent = xmobarColor myRedColor "",
        ppTitle = xmobarColor myWhiteColor "" . shorten 86,
        ppLayout = xmobarColor myLightGreyColor "",
        ppSep = " » ",
        ppWsSep = " "
    }

-- Prompt
myXPConfig = defaultXPConfig
    {
        font = myFont,
        bgColor = myBlackColor,
        fgColor = myWhiteColor,
        bgHLight = myBlackColor,
        fgHLight = myBlueColor,
        borderColor = myBlackColor,
        promptBorderWidth = 0,
        position = Top,
        height = 32
    }

-- Put together all configurations
myConfig = defaultConfig
    {
        terminal = myTerminal,
        borderWidth = myBorderWidth,
        modMask = myModMask,
        workspaces = myWorkspaces,
        normalBorderColor = myBlackColor,
        focusedBorderColor = myBlueColor,
        keys = myKeys,
        mouseBindings = myMouseBindings,
        layoutHook = myLayout,
        manageHook = myManageHook,
        logHook = myLogHook
    }

-- Main thingy
main = xmonad =<< statusBar myBar myPP (\c -> (modMask c, xK_b)) myConfig
