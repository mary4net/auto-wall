# auto-wall
Based on swaybg, a simple script/user-level systemd that auto changes your wallpaper on every 15(or whatever number of time u want)

## how to use
1. fix the path to your wallpaper folder.
╰─λ ./auto_wall.sh -h

      Usage:  ./auto_wall.sh [OPTIONS]

      By deault, it change your background via swaybg every 30 min.

      Options:
      -n, --nochange, --no_change     dont change the wallpaper.
      -u, --use string                use this picture as wallpaper.
      -t, --time int[min]             set change time. By default 30min.

## systemd
1. fix the path in the service file.
2. put the service file under `~/.config/systemd/user/auto-wall.service`, this is
the user-level systemd folder.
3. then start it. `systemctl --user start auto-wall`

## logger
to be done. i feel like the timing went wrong.


