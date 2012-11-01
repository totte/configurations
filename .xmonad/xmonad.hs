import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.GridSelect
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.SimplestFloat
import XMonad.Prompt
import XMonad.Prompt.Shell
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map as M

myTerminal              =   "konsole"
myBorderWidth           =   2
myFocusedBorderColor    =   "#2C72C7"
myNormalBorderColor     =   "#080808"
myWorkspaces            =   ["ZSH","VIM","QTC","WEB","IRC","PIM","MPD","ETC"]
myModMask               =   mod4Mask

-- Keybindings
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [
        -- Switch to next layout
        ((modm, xK_Tab), sendMessage NextLayout),
        
        -- Lock screen
        ((modm, xK_Escape), spawn "slock"),
        
        -- Exit session
        ((modm .|. shiftMask, xK_Escape), io (exitWith ExitSuccess)),
        
        -- Recompile and restart XMonad
        ((modm, xK_r), spawn "xmonad --recompile; xmonad --restart"),
        
        -- Run terminal
        ((modm, xK_Return), spawn $ XMonad.terminal conf),
        
        -- Switch to previous workspace
        ((modm, xK_n), prevWS),
        
        -- Move focused window to previous workspace
        ((modm .|. shiftMask, xK_n), shiftToPrev >> prevWS),
        
        -- Move focus to the previous window
        ((modm, xK_e), windows W.focusDown),
        
        -- Move focus to the next window
        ((modm, xK_i), windows W.focusUp),
        
        -- Switch to next workspace
        ((modm, xK_o), nextWS),
        
        -- Move focused window to next workspace
        ((modm .|. shiftMask, xK_o), shiftToNext >> nextWS),
        
        -- Kill focused window
        ((modm, xK_k), kill),
        
        -- Make focused window master window
        ((modm, xK_m), windows W.swapMaster),
        
        -- Shrink the master area
        ((modm, xK_comma), sendMessage Shrink),
        
        -- Expand the master area
        ((modm, xK_period), sendMessage Expand),
        
        -- Lower master volume
        ((0, 0x1008FF11), spawn "amixer set Master 2-"),
        
        -- Toggle master output
        ((0, 0x1008FF12), spawn "amixer set Master toggle"),
        
        -- Raise master volume
        ((0, 0x1008FF13), spawn "amixer set Master 2+"),

        -- Screenshot
        ((modm, xK_a), spawn "scrot '%Y-%m-%d_$wx$h.png' -e 'mv $f ~/pictures/screenshots/' -t 10"),

        -- Grid: select and switch to window
        ((modm, xK_t), goToSelected defaultGSConfig),

        -- Prompt: run program
        ((modm, xK_space), shellPrompt defaultXPConfig)
    ]

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [
        -- Float and move window
        ((modm, button1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster)),
        
        -- Float and resize window
        ((modm, button2), (\w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster)),
        
        -- Push back into tiling
        ((modm, button3), windows . W.sink)
    ]

-- Layouts
myFull = Full
myWide = Mirror $ Tall nmaster delta ratio
    where
        nmaster = 1
        delta   = 4/100
        ratio   = 80/100
myFloat = simplestFloat
myLayout =
    avoidStruts $
        noBorders (renamed [Replace "Full"] myFull) ||| renamed [Replace "Wide"] myWide ||| renamed [Replace "Float"] myFloat

-- Window rules
myManageHook = composeAll
    [
        -- className =? "qtcreator" --> doShift "1",
        -- className =? "opera" --> doShift "2",
        -- className =? "transmission-qt" --> doShift "2",
        -- className =? "kontact" --> doShift "3",
        -- className =? "konversation" --> doShift "3",
        -- className =? "digikam" --> doShift "4",
        -- className =? "qmpdclient" --> doShift "4",
        -- className =? "smplayer" --> doShift "4",
        className =? "qtpanel" --> doFloat,
        className =? "xmessage" --> doFloat
    ]

-- ??? rules
myLogHook = updatePointer (Relative 0.98 0.94)

-- Panel
myBar = "xmobar"
myPP = xmobarPP
    {
        ppCurrent = wrap "<fc=#ffffff,#2C72C7> " " </fc>",
        ppVisible = xmobarColor "#ff0000" "",
        ppHidden = xmobarColor "#646464" "",
        ppHiddenNoWindows = xmobarColor "#646464" "",
        ppUrgent = xmobarColor "#ff0000" "",
        ppTitle = xmobarColor "#ffffff" "" . shorten 86,
        ppLayout = xmobarColor "#aaaaaa" "",
        ppSep = " » ",
        ppWsSep = " "
    }

-- ???
myConfig = defaultConfig
    {
        terminal = myTerminal,
        borderWidth = myBorderWidth,
        modMask = myModMask,
        workspaces = myWorkspaces,
        normalBorderColor = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
        keys = myKeys,
        mouseBindings = myMouseBindings,
        layoutHook = myLayout,
        manageHook = myManageHook,
        logHook = myLogHook
    }

-- Main thingy
main = xmonad =<< statusBar myBar myPP (\c -> (modMask c, xK_b)) myConfig
