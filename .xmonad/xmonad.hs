import XMonad
import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
 
myTerminal				=	"urxvt"
myBorderWidth			=	2
myModMask				=	mod1Mask
myWorkspaces			=	["SYS","WEB","IRC","MSC"]
myNormalBorderColor		=	"#161616"
myFocusedBorderColor	=	"#323232"
 
------------------------------------------------------------------------
-- Key bindings

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
	[
		((modm .|. shiftMask,	xK_Return), spawn $ XMonad.terminal conf),		-- launch a terminal
        ((modm,					xK_p     ), spawn "gmrun"),						-- launch gmrun
		((modm .|. shiftMask,	xK_c     ), kill),								-- close focused window
		((modm,					xK_space ), sendMessage NextLayout),			-- Rotate through the available layout algorithms
		((modm .|. shiftMask,	xK_space ), setLayout $ XMonad.layoutHook conf),--  Reset the layouts on the current workspace to default
		((modm,					xK_n     ), refresh),							-- Resize viewed windows to the correct size
		((modm,					xK_Tab   ), windows W.focusDown),				-- Move focus to the next window
		((modm,					xK_j     ), windows W.focusDown),				-- Move focus to the next window
		((modm,					xK_k     ), windows W.focusUp  ),				-- Move focus to the previous window
		((modm,					xK_m     ), windows W.focusMaster  ),			-- Move focus to the master window
		((modm,					xK_Return), windows W.swapMaster),				-- Swap the focused window and the master window
		((modm .|. shiftMask,	xK_j     ), windows W.swapDown  ),				-- Swap the focused window with the next window
		((modm .|. shiftMask,	xK_k     ), windows W.swapUp    ),				-- Swap the focused window with the previous window
		((modm,					xK_h     ), sendMessage Shrink),				-- Shrink the master area
		((modm,					xK_l     ), sendMessage Expand),				-- Expand the master area
		((modm,					xK_t     ), withFocused $ windows . W.sink),	-- Push window back into tiling
		((modm,					xK_comma ), sendMessage (IncMasterN 1)),		-- Increment the number of windows in the master area
		((modm,					xK_period), sendMessage (IncMasterN (-1))),		-- Deincrement the number of windows in the master area
		((modm .|. shiftMask,	xK_q     ), io (exitWith ExitSuccess)),			-- Quit xmonad
		((modm,					xK_q     ), spawn "xmonad --recompile; xmonad --restart")-- Restart xmonad
	]
    ++
 
    --
    -- mod-[1..9], Switch to workspace N
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
 
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
 
 
------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
	[
		((modm, button1),	(\w -> focus w	>>	mouseMoveWindow w
											>>	windows W.shiftMaster)),	-- mod-button1, float and move window
		((modm, button2),	(\w -> focus w	>> 	windows W.shiftMaster)),	-- mod-button2, raise window
		((modm, button3),	(\w -> focus w	>>	mouseResizeWindow w
											>>	windows W.shiftMaster))		-- mod-button3, float and resize window 
	]
 
------------------------------------------------------------------------
-- Layouts:

myLayout = avoidStruts $ tiled ||| Mirror tiled ||| Full
	where
		tiled	=	Tall nmaster delta ratio	-- default tiling algorithm partitions the screen into two panes
		nmaster	=	1							-- The default number of windows in the master pane
		ratio	=	1/2							-- Default proportion of screen occupied by master pane
		delta	=	3/100						-- Percent of screen to increment by when resizing panes
 
------------------------------------------------------------------------
-- Window rules

myManageHook = composeAll
	[
		className	=?	"MPlayer"			-->	doFloat,
		className	=?	"Gimp"				-->	doFloat,
		resource	=?	"desktop_window"	-->	doIgnore,
		resource	=?	"kdesktop"			-->	doIgnore
	]
 
------------------------------------------------------------------------
-- Statusbar

myBar = "xmobar"
myPP = xmobarPP
		{
			ppCurrent			=	wrap "<fc=#ffffff,#646464> " " </fc>",
			ppVisible			=	xmobarColor "#ff0000" "",
			ppHidden			=	xmobarColor "#646464" "",
			ppHiddenNoWindows	=	xmobarColor "#646464" "",
			ppUrgent			=	xmobarColor "#ff0000" "",
			ppLayout			=	xmobarColor "#aaaaaa" "",
			ppTitle				=	xmobarColor "#ffffff" "",
			ppSep				=	" : ",
			ppWsSep				=	" "
		}

------------------------------------------------------------------------
-- Run xmonad

main = xmonad =<< statusBar myBar myPP (\c -> (modMask c, xK_b)) myConfig

myConfig = defaultConfig
	{
		terminal			=	myTerminal,
		borderWidth			=	myBorderWidth,
		modMask				=	myModMask,
		workspaces			=	myWorkspaces,
		normalBorderColor	=	myNormalBorderColor,
		focusedBorderColor	=	myFocusedBorderColor,
		keys				=	myKeys,
		mouseBindings		=	myMouseBindings,
		layoutHook			=	myLayout,
		manageHook			=	myManageHook
	}
