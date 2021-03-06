#!/usr/bin/python3

import subprocess
from shutil import which


class BTdevice():
    def __init__(self, name, mac):
        self.name = name
        self.mac = mac

    def getProperties(self):
        return self.name, self.mac


bt_devices = {BTdevice(name='mifo_O5', mac='19:08:31:89:B2:FB'),BTdevice(name='MX Master 2S', mac='D4:AE:FE:93:78:99')}

if which("bluetoothctl") is not None:
    bt_connected = "no"
    for dev in bt_devices:
        name, mac = dev.getProperties()
        cmd_bt_connected = 'bluetoothctl info ' + mac + ' | grep -i connected | awk \'{print $2}\''
        t = subprocess.Popen([cmd_bt_connected], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=True)
        bt_connected = t.stdout.read().decode('utf-8').strip('\n')
        if bt_connected == "yes":
            print(name)
            break
    if bt_connected == "no":
        print("None")
else:
    print("bluetoothctl missing")
