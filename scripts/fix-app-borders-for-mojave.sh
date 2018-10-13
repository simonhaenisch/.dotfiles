#!/usr/bin/env zsh

# When apps have `NSRequiresAquaSystemAppearance` set to true then the window
# will appear with a white border on top; to fix this, the setting can be
# disabled.

apps=(
	"Google Chrome"
	"Visual Studio Code"
	"Hyper"
	"Franz"
	"Pixelmator"
	"Sublime Text"
)

cols=$COLUMNS
export COLUMNS=1

echo "Do you want to fix the borders or undo the fix?"

select action in "fix" "undo"
do
	for app in $apps
	do
		if [[ "$action" == "fix" ]]
		then
			defaults write -app "$app" NSRequiresAquaSystemAppearance -bool no
		else
			defaults delete -app "$app" NSRequiresAquaSystemAppearance
		fi
	done

	echo done 🙌
	break
done

export COLUMNS=$cols
