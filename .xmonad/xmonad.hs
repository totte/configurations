import XMonad
import System.Exit
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.Spacing
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
 
myTerminal				=	"urxvtc"
myBorderWidth			=	2
myModMask				=	mod4Mask
myWorkspaces			=	["ZSH","VIM","WEB","IRC"]
myNormalBorderColor		=	"#161616"
myFocusedBorderColor	=	"#323232"
 
--------------------------------------------------------------------------------------
-- Key bindings
--------------------------------------------------------------------------------------

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
	[
		((modm,	                xK_slash ), spawn $ XMonad.terminal conf),		-- Init a terminal
        ((modm,					xK_space ), spawn "dmenu_run -fn 'Terminus:bold:size=16' -nb '#000' -nf '#868686' -sb '#868686' -sf '#fff'"),					-- Init dmenu_run
		((modm,					xK_Tab   ), windows W.focusDown),				-- Move focus to the next window
		((modm .|. shiftMask,	xK_Tab 	 ), sendMessage NextLayout),			-- Rotate through the available layout algorithms
		((modm,                 xK_Return), sendMessage ToggleLayout),          -- Toggle fullscreen mode
		((modm,                 xK_n     ), prevWS),                            -- 
		((modm,                 xK_o     ), nextWS),                            -- 
		((modm .|. shiftMask,   xK_n     ), shiftToPrev >> prevWS),             -- 
		((modm .|. shiftMask,   xK_o     ), shiftToNext >> nextWS),             -- 
		--((modm .|. shiftMask,	xK_c     ), kill),								-- close focused window
		--((modm .|. shiftMask,	xK_space ), setLayout $ XMonad.layoutHook conf),--  Reset the layouts on current workspace to default
		--((modm,				xK_n     ), refresh),							-- Resize viewed windows to the correct size
		--((modm,				xK_j     ), windows W.focusDown),				-- Move focus to the next window
		--((modm,				xK_k     ), windows W.focusUp  ),				-- Move focus to the previous window
		--((modm,				xK_m     ), windows W.focusMaster  ),			-- Move focus to the master window
		--((modm,				xK_Return), windows W.swapMaster),				-- Swap the focused window and the master window
		--((modm .|. shiftMask,	xK_j     ), windows W.swapDown  ),				-- Swap the focused window with the next window
		--((modm .|. shiftMask,	xK_k     ), windows W.swapUp    ),				-- Swap the focused window with the previous window
		--((modm,				xK_h     ), sendMessage Shrink),				-- Shrink the master area
		--((modm,				xK_l     ), sendMessage Expand),				-- Expand the master area
		--((modm,				xK_t     ), withFocused $ windows . W.sink),	-- Push window back into tiling
		--((modm,				xK_comma ), sendMessage (IncMasterN 1)),		-- Increment number of windows in the master area
		--((modm,				xK_period), sendMessage (IncMasterN (-1))),		-- Deincrement number of windows in the master area
		((modm,	                xK_comma ), io (exitWith ExitSuccess)),			-- Quit xmonad
		((modm,					xK_period), spawn "xmonad --recompile; xmonad --restart")-- Restart xmonad
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
		((modm, button1),	(\w -> focus w	>>	mouseMoveWindow w
											>>	windows W.shiftMaster)),	-- mod-button1, float and move window
		((modm, button2),	(\w -> focus w	>> 	windows W.shiftMaster)),	-- mod-button2, raise window
		((modm, button3),	(\w -> focus w	>>	mouseResizeWindow w
											>>	windows W.shiftMaster))		-- mod-button3, float and resize window 
	]
 
--------------------------------------------------------------------------------------
-- Layouts
--------------------------------------------------------------------------------------

myLayout =
	avoidStruts $
	spacing 4 $
	toggleLayouts Full $
	tiled ||| Mirror tiled
	where
		tiled	=	Tall nmaster delta ratio	-- default tiling algorithm partitions the screen into two panes
		nmaster	=	1							-- The default number of windows in the master pane
		ratio	=	1/2							-- Default proportion of screen occupied by master pane
		delta	=	3/100						-- Percent of screen to increment by when resizing panes
 
--------------------------------------------------------------------------------------
-- Window rules
--------------------------------------------------------------------------------------

myManageHook = composeAll
	[
		className	=?	"MPlayer"			-->	doFloat,
		className	=?	"Gimp"				-->	doFloat,
		resource	=?	"desktop_window"	-->	doIgnore,
		resource	=?	"kdesktop"			-->	doIgnore
	]
 
--------------------------------------------------------------------------------------
-- Statusbar
--------------------------------------------------------------------------------------

myBar = "xmobar"
myPP = xmobarPP
		{
			ppCurrent			=	wrap "<fc=#ffffff,#868686> " " </fc>",
			ppVisible			=	xmobarColor "#ff0000" "",
			ppHidden			=	xmobarColor "#646464" "",
			ppHiddenNoWindows	=	xmobarColor "#646464" "",
			ppUrgent			=	xmobarColor "#ff0000" "",
			ppLayout			=	xmobarColor "#aaaaaa" "",
			ppTitle				=	xmobarColor "#ffffff" "",
			ppSep				=	" : ",
			ppWsSep				=	" "
		}

--------------------------------------------------------------------------------------
-- Run XMonad
--------------------------------------------------------------------------------------

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
