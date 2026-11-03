--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Window Rules

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

-- Bitwarden window
hl.window_rule({
	name = "bitwarden",
	match = {
		class = "brave-nngceckbapebfimnlniiiahkandclblb-Default",
	},
	border_size = 2,
	float = true,
})

-- Auto Cpufreq
hl.window_rule({
	name = "auto-cpufreq",
	match = {
		class = "auto-cpufreq-gtk",
	},
	border_size = 2,
	float = true,
})

-- Workspace specific layouts
hl.workspace_rule({ workspace = "5", layout = "scrolling" })
hl.workspace_rule({ workspace = "6", layout = "scrolling" })
hl.workspace_rule({ workspace = "7", layout = "scrolling" })
hl.workspace_rule({ workspace = "8", layout = "scrolling" })
hl.workspace_rule({ workspace = "9", layout = "monocle" })
hl.workspace_rule({ workspace = "10", layout = "monocle" })

-- Workspace Rules
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
