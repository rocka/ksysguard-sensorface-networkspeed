cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(sensor-face-network-speed)

set(QT_MAJOR_VERSION 6)

find_package(ECM 6.0.0 REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})

include(KDEInstallDirs)

find_package(Plasma REQUIRED)

# https://invent.kde.org/plasma/libksysguard/-/blob/Plasma/6.1/faces/facepackages/CMakeLists.txt?ref_type=heads#L6
plasma_install_package(package me.rocka.ksysguard.networkspeed sensorfaces ksysguard)
