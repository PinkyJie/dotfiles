This repository holds my configuration files so that I can clone them to other machines easily.

# Installation
```
git clone git://github.com/PinkyJie/dotfiles.git ~/.dotfiles
```
# Setup

## Mac

### Optional Preferences before running the installation

* Install all available updates.
    * In `System Preferences -> Software Update`.
* Modify the touchpad settings.
    * In `System Preferences -> Touchpad`:
        * Enable `Tap to click` in "Point & Click".
        * Disable `Scroll direction: Natural` in "Scroll & Zoom".
    * In `System Preferences -> Accessibility`:
        * Enable dragging in `Pointer Control -> Trackpad Options...` with "three finger drag".
* Adjust screen resolution.
    * In `System Preferences -> Displays`, choose the "Scaled" resolution with the one between "Default" and "More spaces".

Make sure Xcode is installed and you have already agreed the agreement.
```
cd ~/.dotfiles
./install_mac.sh
```
## Linux
```
cd ~/.dotfiles
./install_linux.sh
```