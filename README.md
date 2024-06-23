# ksysguard-sensorface-networkspeed

Show summed value of network speed sensors in plasma system monitor widget.

<img height="42" src="https://github.com/rocka/ksysguard-sensorface-networkspeed/assets/13914967/c5a9f75a-27c2-4334-b52a-2b2325bf2f0f">

"Creating sensor faces" Tutorial: https://develop.kde.org/docs/apps/sensor-faces/

Sensor face example: https://invent.kde.org/plasma/libksysguard/-/tree/master/faces/facepackages/textonly

## Installation

```sh
# would install to ~/.local/share/ksysguard/sensorfaces/me.rocka.ksysguard.networkspeed
kpackagetool6 --install ./package --type KSysguard/SensorFace

# upgrade
kpackagetool6 --upgrade ./package --type KSysguard/SensorFace

# uninstall
kpackagetool6 --remove me.rocka.ksysguard.networkspeed --type KSysguard/SensorFace
```

## Usage

1. Right click on Plasma panel -> "Add Widgets" -> "Network speed"
1. Right click on the newly added widget -> "Configure Network speed"
1. "Appearance" -> "Display Style" -> "Network Speed" -> "Apply"
