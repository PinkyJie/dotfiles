This repository holds my configuration files so that I can clone them to other machines easily.

# Installation

```
git clone git://github.com/PinkyJie/dotfiles.git ~/.dotfiles
```

# Setup

## Mac

### Optional Preferences before running the installation

- Install all available updates.
  - In `System Preferences -> Software Update`.
- Adjust dock configuration.
  - Move the "Dock Size" slider to make it smaller.
  - Enable "Automatically hide and show the dock".
- Modify the touchpad settings.
  - In `System Preferences -> Touchpad`:
    - Enable `Tap to click` in "Point & Click".
    - Disable `Scroll direction: Natural` in "Scroll & Zoom".
  - In `System Preferences -> Accessibility`:
    - Enable dragging in `Pointer Control -> Trackpad Options...` with "three finger drag".
- Adjust screen resolution.
  - In `System Preferences -> Displays`, choose the "Scaled" resolution with the one between "Default" and "More spaces".
- Add Chinese input method.
  - In `System Preferences -> Keyboard`, add "Chinese, Simplified" from the "Input Sources".
- Use 24h time format.
  - In `System Preferences -> Language & Region`, enable "24-Hour Time".

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
