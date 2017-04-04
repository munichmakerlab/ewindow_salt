/home/pi/.config/autostart/chrome_ewindow.desktop:
  file.managed:
    - source: salt://browser/files/chrome_ewindow.desktop
    - makedirs: True
    - template: jinja

/etc/rc.local:
  file.managed:
    - source: salt://browser/files/rc.local
