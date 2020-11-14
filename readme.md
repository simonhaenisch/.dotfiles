# .dotfiles

![Screenshot of ZSH Config](screenshot.png)

## Installation on fresh macOS

1. Open Terminal
2. Add ssh public key to Github account
3. `git clone git@github.com:simonhaenisch/.dotfiles`
4. Install XCode Developer Tools (the `git` command will open the prompt)
5. Accept Xcode licences: `sudo xcodebuild -license`
6. Repeat `git clone ...`
7. `cd .dotfiles`
8. `./setup-macos.sh`
9. Check output for any failed brew/cask installs
10. Reboot

## To-do after installation

* Open Chrome and set as default browser
* Open the following apps to make sure iCloud sync works:
  - Photos
  - Notes
  - Reminders
  - Messages (enable iCloud Messages
* Open iCloud Drive preferences and
  1) disable "optimize mac storage"
  2) enable "Desktop & Documents folders"
* Open Logic Pro to download essential sounds
* Open Finder settings to set view options in home folder (and use as defaults)
* Open f.lux and set location
* Open and configure Unarchiver (select all formats, extract to same folder, move to trash after extraction)
