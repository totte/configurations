import XMonad
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Dishes
import XMonad.Layout.Gaps
import XMonad.Layout.LimitWindows
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.Spacing
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map as M

myTerminal              =   "konsole"
myBorderWidth           =   4
myModMask               =   mod4Mask
myWorkspaces            =   ["ZSH","VIM","QTC","WEB","IRC","PIM","MSC","LOG","SYS","NET"]
myNormalBorderColor     =   "#080808"
myFocusedBorderColor    =   "#080808"

--------------------------------------------------------------------------------------
-- Key bindings
--------------------------------------------------------------------------------------

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [
        ((modm, xK_Tab), sendMessage NextLayout),
        ((modm, xK_Escape), spawn "slock"),
        ((modm .|. shiftMask, xK_Escape), io (exitWith ExitSuccess)),
        ((modm, xK_r), spawn "xmonad --recompile; xmonad --restart"),
        ((modm, xK_Return), spawn $ XMonad.terminal conf),
        ((modm, xK_n), prevWS),
        ((modm .|. shiftMask, xK_n), shiftToPrev >> prevWS),
        ((modm, xK_e), windows W.focusDown),            -- Move focus to the previous window
        ((modm, xK_i), windows W.focusUp),              -- Move focus to the next window
        ((modm, xK_o), nextWS),
        ((modm .|. shiftMask, xK_o), shiftToNext >> nextWS),
        ((modm, xK_k), kill),                           -- close focused window
        ((modm, xK_m), windows W.swapMaster),           -- Make focused window master window
        ((modm, xK_comma), sendMessage Shrink),         -- Shrink the master area
        ((modm, xK_period), sendMessage Expand),        -- Expand the master area
        ((modm, xK_space), spawn "~/bin/drunner.sh")
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
        ((modm, button1), (\w -> focus w >> mouseMoveWindow w
            >> windows W.shiftMaster)), -- float and move window
        ((modm, button2), (\w -> focus w >> windows W.shiftMaster)), -- raise window
        ((modm, button3), (\w -> focus w >> mouseResizeWindow w
            >> windows W.shiftMaster)) -- float and resize window
    ]

--------------------------------------------------------------------------------------
-- Layouts
--------------------------------------------------------------------------------------

myFocus = gaps [(L,256), (R,256)] $ spacing 4 $ limitWindows 2 $ Dishes nmaster ratio
    where
        -- The default number of windows in the master pane
        nmaster = 1
        -- Default proportion of screen occupied by other panes
        ratio = 1/5

myFull = Full

myDiscs = spacing 4 $ limitWindows 5 $ Dishes nmaster ratio
    where
        -- The default number of windows in the master pane
        nmaster = 1
        -- Default proportion of screen occupied by other panes
        ratio = 1/5

myLayout =
    avoidStruts $
    noBorders (renamed [Replace "Full"] myFull) ||| renamed [Replace "Focus"] myFocus ||| renamed [Replace "Discs"] myDiscs

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
