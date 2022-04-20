# Icecast95
A theme for Icecast 2.4.4 made to emulate the appearance of Windows 95.

## Description
Thanks for checking out my Icecast95 theme! This theme is made
to work with Icecast 2.4.4, and has been tested to work on the
icecast-kh branch. This theme has not yet been tested with
older Icecast versions. It may work on other versions, but I 
won't guarantee it.

The following are instructions on how to "install" this theme.
These instructions were made with a Linux system in mind,
specifically Ubuntu 20.04.

## "Installation" Instructions

NOTE: You will need root privileges to do this. If the
account you are using to do this does not have root privileges:
- If doing this from the terminal, run "sudo su".
- If doing this from a file manager, run your file manager
as root. For Gnome setups, run 'sudo nautilus'. If you are
using a different desktop environment, find your file manager
name and run it by typing 'sudo {file manager name}'.

1) Navigate to /etc/icecast2.

2) Back up the "admin" and "web" folders elsewhere in the event
that you need to revert back. Once you have them backed up, go
ahead and delete these folders from the Icecast directory.

3) Copy the "admin" and "web" folders from the archive into
/etc/icecast2.

4) In your configuration file, likely icecast.xml, scroll down to
the paths section. Here you'll find this line:
- `<webroot>/usr/share/icecast2/web</webroot>`

Change the path in this line to `/etc/icecast2/web`. Do not worry
about `<adminroot>`, you won't need to change this.

5) Start your Icecast server if it isn't already running. If it is
already running, restart it.

6) Navigate to the various pages and check to make sure everything
works.

NOTE: Windows will only appear on the status page if you are
streaming to the server. If you are not streaming to the server
and you only see the taskbar, nothing is broken.

NOTE 2: If you run into issues with Icecast being unable to display the XSLT file, use `chown` to transfer ownership of the files to the user running the Icecast server. Example, if `user` is running the Icecast instance, run the following:

`chown user admin/`

`chown user admin/*`

`chown user web/`

`chown user web/*`


If everything is good, Icecast95 is "installed"! Enjoy!

If you need help, reach out to me via email: msx.inbox@gmail.com

## Resource Credits
  
Fonts used:
  - Body fonts: [ms_sans_serif.woff2](https://jdan.github.io/98.css/ms_sans_serif.woff2) and [ms_sans_serif_bold.woff2](https://jdan.github.io/98.css/ms_sans_serif_bold.woff2) from [98.css](https://jdan.github.io/98.css)
  - Header font: [Bit Serif](https://www.pentacom.jp/pentacom/bitfontmaker2/gallery/?id=9588) by Owen Compher

Icons used: Windows 98 Icons
