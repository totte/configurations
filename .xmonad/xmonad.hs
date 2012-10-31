import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.GridSelect
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Dishes
import XMonad.Layout.Gaps
import XMonad.Layout.Grid
import XMonad.Layout.LimitWindows
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map as M

myTerminal              =   "konsole"
myBorderWidth           =   2
myModMask               =   mod4Mask
myWorkspaces            =   ["ZSH","VIM","NET","ETC"]
myNormalBorderColor     =   "#080808"
myFocusedBorderColor    =   "#080808"

--------------------------------------------------------------------------------------
-- Key bindings
--------------------------------------------------------------------------------------

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

        -- Grid: select and switch to workspace
        ((modm, xK_s), gridselectWorkspace defaultGSConfig (W.view)),

        -- Grid: select and switch to window
        ((modm, xK_t), goToSelected defaultGSConfig),

        -- Grid: spawn program
        ((modm, xK_space), spawnSelected defaultGSConfig ["digikam","konsole","kontact","konversation","opera","qtcreator","qtfm","qmpdclient","smplayer","transmission-qt"])
    ]
    ++
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modm, k), windows $ f i)
    | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
    , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

--------------------------------------------------------------------------------------
-- Mouse bindings
--------------------------------------------------------------------------------------

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [
        -- Float and move window
        ((modm, button1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster)),
        
        -- Float and resize window
        ((modm, button2), (\w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster)),
        
        -- Push back into tiling
        ((modm, button3), windows . W.sink)
    ]

--------------------------------------------------------------------------------------
-- Layouts
--------------------------------------------------------------------------------------

myFull = Full

myWide = Mirror $ Tall nmaster delta ratio
    where
        -- The default number of windows in the master pane
        nmaster = 1
        -- Percent of screen to increment by when resizing panes
        delta   = 4/100
        -- Default proportion of screen occupied by master pane
        ratio   = 80/100

myDish = limitWindows 5 $ Dishes nmaster ratio
    where
        -- The default number of windows in the master pane
        nmaster = 1
        -- Default proportion of screen occupied by other panes
        ratio = 1/4

myFloat = simplestFloat

myGrid = Grid

myLayout =
    avoidStruts $
    noBorders (renamed [Replace "Full"] myFull) ||| renamed [Replace "Wide"] myWide ||| renamed [Replace "Discs"] myDish ||| renamed [Replace "Float"] myFloat ||| renamed [Replace "Grid"] myGrid

--------------------------------------------------------------------------------------
-- Window rules
--------------------------------------------------------------------------------------

myManageHook = composeAll
    [
        className =? "MPlayer" --> doFloat,
        className =? "Gimp" --> doFloat
    ]

--------------------------------------------------------------------------------------
-- Statusbar
--------------------------------------------------------------------------------------

myBar = "xmobar"
myPP = xmobarPP
    {
        ppCurrent = wrap "<fc=#ffffff,#0055FF> " " </fc>",
        ppVisible = xmobarColor "#ff0000" "",
        ppHidden = xmobarColor "#646464" "",
        ppHiddenNoWindows = xmobarColor "#646464" "",
        ppUrgent = xmobarColor "#ff0000" "",
        ppTitle = xmobarColor "#ffffff" "" . shorten 86,
        ppLayout = xmobarColor "#aaaaaa" "",
        ppSep = " » ",
        ppWsSep = " "
    }

--------------------------------------------------------------------------------------
-- Run XMonad
--------------------------------------------------------------------------------------

main = xmonad =<< statusBar myBar myPP (\c -> (modMask c, xK_b)) myConfig

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
        manageHook = myManageHook
    }
