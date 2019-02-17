# dotfiles

# Installation
1. cd into `dotfiles` repository directory

2. make file `install.sh` executable 

3. run `install.sh`

4. relog into your user account

# Troubleshooting

## GDM - Ignored .Xresources
1. `/etc/gdm/cusom.conf` uncomment line `#WaylandEnable=false`

2. `/etc/gdm/Xsession` remove `-nocpp` argument from line `xrdb -nocpp -merge "$userresources"`
