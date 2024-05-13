![banner](banner.png?raw=true)

## Installation:

Usage:  `sudo ./install.sh [OPTIONS...]`

```
  -t, --theme     theme variant(s)          [black]                             (default is black)
  -i, --icon      icon variant(s)           [white]                             (default is color)
  -s, --screen    screen display variant(s) [1920x1200|2560x1600]               (default is 1920x1200)
  -r, --remove    Remove theme              [black]                             (must add theme name option, default is black)

  -b, --boot      install theme into '/boot/grub' or '/boot/grub2'
  -g, --generate  do not install but generate theme into chosen directory       (must add your directory)

  -h, --help      Show this help
```

_If no options are used, a user interface `dialog` will show up instead_

### Examples:
 - Install Tela theme on 2560x1600 display device:

```sh
sudo ./install.sh -t black -s 2560x1600
```

 - Install Tela theme into /boot/grub/themes:

```sh
sudo ./install.sh -b -t black
```

 - Uninstall Tela theme:

```sh
sudo ./install.sh -r -t black
```

## Issues / tweaks:

### Correcting display resolution:

 - On the grub screen, press `c` to enter the command line
 - Enter `vbeinfo` or `videoinfo` to check available resolutions
 - Open `/etc/default/grub`, and edit `GRUB_GFXMODE=[height]x[width]x32` to match your resolution
 - Finally, run `grub-mkconfig -o /boot/grub/grub.cfg` to update your grub config

### Setting a custom background:

 - Make sure you have `imagemagick` installed, or at least something that provides `convert`
 - Find the resolution of your display, and make sure your background matches the resolution
   - 1920x1200 >> 1920x1200
   - 2560x1600 >> 2560x1600
 - Place your custom background inside the root of the project, and name it `background.jpg`
 - Run the installer like normal, but with -s `[YOUR_RESOLUTION]` and -t `[THEME]` and -i `[ICON]`
   - Make sure to replace `[YOUR_RESOLUTION]` with your resolution and `[THEME]` with the theme

## Contributing:
 - If you made changes to icons, or added a new one:
   - Delete the existing icon, if there is one
   - Run `cd assets; ./render-all.sh`
 - Create a pull request from your branch or fork
 - If any issues occur, report then to the [issue](https://github.com/karamellpelle/grub2-legion/issues) page

## Preview:
![preview](preview.png?raw=true)

## Documents

[Grub2 theme reference](https://wiki.rosalab.ru/en/index.php/Grub2_theme_/_reference)

[Grub2 theme tutorial](https://wiki.rosalab.ru/en/index.php/Grub2_theme_tutorial)
