# wallset
A wallpaper manager that makes it possible to show videos as live wallpapers

# Installation
First you will need to have these dependencies installed on your system:
+ [bash >=4.0](http://tiswww.case.edu/php/chet/bash/bashtop.html)
+ [sed >=4.5](http://sed.sourceforge.net/)
+ [ffmpeg >=4.2.3](https://ffmpeg.org/)
+ [feh >=3.4.1](https://feh.finalrewind.org/)
+ [imagemagick >=7.0.10.16](https://www.imagemagick.org/)
+ [procps >=2.3](https://packages.debian.org/stable/procps)

If you're on Debian stable or any mainstream and updated GNU/Linux distro, you should be good.

```sh
git clone https://github.com/XCaminhante/wallset
cd wallset
cp -v ./wallset ~/.local/bin
# Otherwise, to keep updating the script with git:
ln -svf $PWD/wallset ~/.local/bin/
# Then add a wallpaper or configure wallset
```

# Usage
```sh
Wallset: shows one or more images in a loop as a live wallpaper
Version 0.2

Usage: wallset [options]
Options:
  -i,--image <image file.{jpg,png}>
  Replaces the current set of wallpaper images with this image
  Use any file format supported by imagemagick

  -v,--video <video file.{mp4,mkv,webm}>
  Replaces the current set of wallpaper images for the frames of a video excerpt
  Use any file format supported by ffmpeg

  -f,--from 00:00
  Pass this argument before -v, it defines from which point in the video the excerpt starts
  By default, wallset extracts the excerpt from the beginning of the video (point 00:00)
  Consult the ffmpeg manual if you have any doubts about the syntax

  -d,--duration 10s
  Pass this argument before -v, it defines how many seconds to extract from the video
  By default, wallset extracts 10 seconds from the video (that's approximately 300 frames)
  Consult the ffmpeg manual if you have any doubts about the syntax

  -w,--width 1680
  Sets the frame width scaling
  By default, wallset scales frames to be 1680 pixels wide
  Set this to your screen width

  -a,--append-image <image file.{jpg,png}>
  Appends an image to the current wallpaper image set
  This argument can be used several times on the same command line
  It can be used in conjunction with -i or -v, but must appear after both of them
  Use any file format supported by imagemagick

  -t,--transition 0.1
  Sets the approximate time between one image and the next in the wallpaper display
  By default wallset uses 0.1 second
  Don't use sleep suffixes, only pass the float number of seconds

  -z,--zoom-mode <fill|scale|center|tile|max>
  Sets the zoom mode feh will use when applying each image at the background
  Consult the feh manpage, specifically the --bg-* arguments, if you have any doubts about their effects

  -p,--pause
  Stops the wallpaper image display loop

  -s,--start
  Starts the wallpaper image display loop
  When you use the -i or -v arguments, the loop starts automatically

  -c,--config
  Shows the actual configuration.

  --loop
  For internal use only.

  -h,--help
  Shows this message

The set of images is stored in ~/.config/wallset/
```

# Uninstall
```sh
# First stop the wallpaper repaint loop:
wallset --pause
rm -v ~/.local/bin/wallset
# Do whatever you want with the git repo you downloaded
```

# Differences at this fork
* Complete code rewrite.
* No more wallpaper selector numbers. You set one live (or static) wallpaper at a time.
* No more tinkering with `gsettings` or `~/.fehbg`
* More configurable.
* You can append new images to the current wallpaper frames set.
You can add several static images and set a longer transition time, for example.
* Smarter wallpaper repaint loop logic. No more `killall bash`. No running a loop if there's only a single (or none) frame.

