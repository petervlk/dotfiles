# dotfiles

# Troubleshooting

## GDM - Ignored .Xresources
1. `/etc/gdm/cusom.conf` uncomment line `#WaylandEnable=false`

2. `/etc/gdm/Xsession` remove `-nocpp` argument from line `xrdb -nocpp -merge "$userresources"`
