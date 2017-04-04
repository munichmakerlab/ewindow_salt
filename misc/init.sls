unclutter-pkg:
  pkg.installed:
    - name: unclutter

unclutter-autostart:
  file.append:
    - name: /home/pi/.config/lxsession/LXDE/autostart
    - text: "@unclutter"
    - makedirs: True
