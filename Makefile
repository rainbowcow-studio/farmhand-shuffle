test.linux.flatpak:
	flatpak run org.godotengine.Godot -d -s --path ./ addons/gut/gut_cmdln.gd

test.macos:
	/Applications/Godot.app/Contents/MacOS/Godot -d -s --path ./ addons/gut/gut_cmdln.gd
