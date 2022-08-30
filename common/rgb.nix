{config, pkgs, util-lib, ...}:

let
	cfg = config.main.rgb;
	# FIXME + TODO: This is very messy
	openrgb-rules = ''
#---------------------------------------------------------------#
#  OpenRGB udev rules - Git Commit: 6d1f8967                    #
#---------------------------------------------------------------#

#---------------------------------------------------------------#
#  User I2C/SMBus Access                                        #
#---------------------------------------------------------------#
KERNEL=="i2c-[0-99]*", TAG+="uaccess"

#---------------------------------------------------------------#
#  Super I/O Access                                             #
#---------------------------------------------------------------#
KERNEL=="port", TAG+="uaccess"

#---------------------------------------------------------------#
#  ASUS TUF Laptops (faustus)                                   #
#---------------------------------------------------------------#
ACTION=="add", SUBSYSTEM=="platform", KERNEL=="faustus", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/bus/platform/devices/%k/kbbl/kbbl_blue"
ACTION=="add", SUBSYSTEM=="platform", KERNEL=="faustus", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/bus/platform/devices/%k/kbbl/kbbl_flags"
ACTION=="add", SUBSYSTEM=="platform", KERNEL=="faustus", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/bus/platform/devices/%k/kbbl/kbbl_green"
ACTION=="add", SUBSYSTEM=="platform", KERNEL=="faustus", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/bus/platform/devices/%k/kbbl/kbbl_mode"
ACTION=="add", SUBSYSTEM=="platform", KERNEL=="faustus", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/bus/platform/devices/%k/kbbl/kbbl_red"
ACTION=="add", SUBSYSTEM=="platform", KERNEL=="faustus", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/bus/platform/devices/%k/kbbl/kbbl_set"
ACTION=="add", SUBSYSTEM=="platform", KERNEL=="faustus", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/bus/platform/devices/%k/kbbl/kbbl_speed"

#---------------------------------------------------------------#
# Logitech Lightsync Mouse (1 Zone) - DetectLogitechMouseG203
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c084", TAG+="uaccess", TAG+="Logitech_G203_Prodigy"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c092", TAG+="uaccess", TAG+="Logitech_G203_Lightsync"
#---------------------------------------------------------------#
# Logitech Lightsync Mouse (1 Zone) - DetectLogitechMouseGPRO
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c085", TAG+="uaccess", TAG+="Logitech_G_Pro_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c08c", TAG+="uaccess", TAG+="Logitech_G_Pro_HERO_Gaming_Mouse"
#---------------------------------------------------------------#
# Logitech Lightsync Mouse - DetectLogitechMouseG303
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c080", TAG+="uaccess", TAG+="Logitech_G303_Daedalus_Apex"
#---------------------------------------------------------------#
# Logitech Lightsync Mouse - DetectLogitechMouseG403
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c08f", TAG+="uaccess", TAG+="Logitech_G403_Hero"
#---------------------------------------------------------------#
# Logitech G810 - DetectLogitechKeyboardG810
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c342", TAG+="uaccess", TAG+="Logitech_G512"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c33c", TAG+="uaccess", TAG+="Logitech_G512_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c333", TAG+="uaccess", TAG+="Logitech_G610_Orion"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c338", TAG+="uaccess", TAG+="Logitech_G610_Orion"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c331", TAG+="uaccess", TAG+="Logitech_G810_Orion_Spectrum"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c337", TAG+="uaccess", TAG+="Logitech_G810_Orion_Spectrum"
#---------------------------------------------------------------#
# Logitech X56 - DetectLogitechX56
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0738", ATTRS{idProduct}=="2221", TAG+="uaccess", TAG+="Logitech_X56_Rhino_Hotas_Joystick"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0738", ATTRS{idProduct}=="a221", TAG+="uaccess", TAG+="Logitech_X56_Rhino_Hotas_Throttle"
#---------------------------------------------------------------#
# Logitech G910 - DetectLogitechKeyboardG910
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c32b", TAG+="uaccess", TAG+="Logitech_G910_Orion_Spark"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c335", TAG+="uaccess", TAG+="Logitech_G910_Orion_Spectrum"
#---------------------------------------------------------------#
# Logitech G203L - DetectLogitechMouseG203L
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c092", TAG+="uaccess", TAG+="Logitech_G203_Lightsync"
#---------------------------------------------------------------#
# Logitech G560 - DetectLogitechG560
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="0a78", TAG+="uaccess", TAG+="Logitech_G560_Lightsync_Speaker"
#---------------------------------------------------------------#
# Logitech G213 - DetectLogitechKeyboardG213
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c336", TAG+="uaccess", TAG+="Logitech_G213"
#---------------------------------------------------------------#
# Logitech G915 - DetectLogitechKeyboardG915
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c541", TAG+="uaccess", TAG+="Logitech_G915_Wireless_RGB_Mechanical_Gaming_Keyboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c547", TAG+="uaccess", TAG+="Logitech_G915_Wireless_RGB_Mechanical_Gaming_Keyboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c33e", TAG+="uaccess", TAG+="Logitech_G915_Wireless_RGB_Mechanical_Gaming_Keyboard_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c545", TAG+="uaccess", TAG+="Logitech_G915TKL_Wireless_RGB_Mechanical_Gaming_Keyboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c343", TAG+="uaccess", TAG+="Logitech_G915TKL_Wireless_RGB_Mechanical_Gaming_Keyboard_Wired"
#---------------------------------------------------------------#
# Logitech G915 - DetectLogitechKeyboardG915Wired
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c33e", TAG+="uaccess", TAG+="Logitech_G915_Wireless_RGB_Mechanical_Gaming_Keyboard_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c343", TAG+="uaccess", TAG+="Logitech_G915TKL_Wireless_RGB_Mechanical_Gaming_Keyboard_Wired"
#---------------------------------------------------------------#
# Logitech G815 - DetectLogitechKeyboardG815
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c232", TAG+="uaccess", TAG+="Logitech_G813_RGB_Mechanical_Gaming_Keyboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c33f", TAG+="uaccess", TAG+="Logitech_G815_RGB_Mechanical_Gaming_Keyboard"
#---------------------------------------------------------------#
# Logitech Powerplay Mat - 
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Logitech G933 - DetectLogitechG933
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="0a5b", TAG+="uaccess", TAG+="Logitech_G933_Lightsync_Headset"
#---------------------------------------------------------------#
# Logitech Lightspeed - DetectLogitechWireless
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="405d", TAG+="uaccess", TAG+="Logitech_G403_Wireless_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="407f", TAG+="uaccess", TAG+="Logitech_G502_Wireless_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="4070", TAG+="uaccess", TAG+="Logitech_G703_Wireless_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="4086", TAG+="uaccess", TAG+="Logitech_G703_Hero_Wireless_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="4053", TAG+="uaccess", TAG+="Logitech_G900_Wireless_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="4067", TAG+="uaccess", TAG+="Logitech_G903_Wireless_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="4087", TAG+="uaccess", TAG+="Logitech_G903_Hero_Wireless_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="4079", TAG+="uaccess", TAG+="Logitech_G_Pro_Wireless_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="405f", TAG+="uaccess", TAG+="Logitech_Powerplay_Mat"
#---------------------------------------------------------------#
# Logitech Lightspeed - DetectLogitechWired
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c332", TAG+="uaccess", TAG+="Logitech_G502_Proteus_Spectrum_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c08b", TAG+="uaccess", TAG+="Logitech_G502_Hero_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c083", TAG+="uaccess", TAG+="Logitech_G403_Prodigy_Gaming_Mouse"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c082", TAG+="uaccess", TAG+="Logitech_G403_Wireless_Gaming_Mouse_wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c08d", TAG+="uaccess", TAG+="Logitech_G502_Wireless_Gaming_Mouse_wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c087", TAG+="uaccess", TAG+="Logitech_G703_Wireless_Gaming_Mouse_wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c090", TAG+="uaccess", TAG+="Logitech_G703_Hero_Wireless_Gaming_Mouse_wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c081", TAG+="uaccess", TAG+="Logitech_G900_Wireless_Gaming_Mouse_wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c086", TAG+="uaccess", TAG+="Logitech_G903_Wireless_Gaming_Mouse_wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c091", TAG+="uaccess", TAG+="Logitech_G903_Hero_Wireless_Gaming_Mouse_wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c088", TAG+="uaccess", TAG+="Logitech_G_Pro_Wireless_Gaming_Mouse_wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="0ab5", TAG+="uaccess", TAG+="Logitech_G733_Gaming_Headset"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="0a87", TAG+="uaccess", TAG+="Logitech_G935_Gaming_Headset"
#---------------------------------------------------------------#
# Logitech G Pro - DetectLogitechKeyboardGPro
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c339", TAG+="uaccess", TAG+="Logitech_G_Pro_RGB_Mechanical_Gaming_Keyboard"
#---------------------------------------------------------------#
# Lian Li Uni Hub - DetectLianLiUniHub
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0cf2", ATTRS{idProduct}=="7750", TAG+="uaccess", TAG+="Lian_Li_Uni_Hub"
#---------------------------------------------------------------#
# Strimer L Connect - DetectStrimerControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0cf2", ATTRS{idProduct}=="a200", TAG+="uaccess", TAG+="Strimer_L_Connect"
#---------------------------------------------------------------#
# Corsair Lighting Node - DetectCorsairLightingNodeControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c1a", TAG+="uaccess", TAG+="Corsair_Lighting_Node_Core"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c0b", TAG+="uaccess", TAG+="Corsair_Lighting_Node_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c10", TAG+="uaccess", TAG+="Corsair_Commander_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c1e", TAG+="uaccess", TAG+="Corsair_LS100_Lighting_Kit"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1d00", TAG+="uaccess", TAG+="Corsair_1000D_Obsidian"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1d04", TAG+="uaccess", TAG+="Corsair_SPEC_OMEGA_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c23", TAG+="uaccess", TAG+="Corsair_LT100"
#---------------------------------------------------------------#
# Trust GXT 114 - DetectTrustGXT114Controllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="145f", ATTRS{idProduct}=="026d", TAG+="uaccess", TAG+="Trust_GXT_114"
#---------------------------------------------------------------#
# Trust GXT 180 - DetectTrustGXT180Controllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="145f", ATTRS{idProduct}=="0248", TAG+="uaccess", TAG+="Trust_GXT_180"
#---------------------------------------------------------------#
# Quantum Mechanical Keyboard (QMK) - 
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# EVision Keyboard - DetectEVisionKeyboards
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="5204", TAG+="uaccess", TAG+="EVision_Keyboard_0C455204"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="5104", TAG+="uaccess", TAG+="EVision_Keyboard_0C455104"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="5004", TAG+="uaccess", TAG+="EVision_Keyboard_0C455004"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="652f", TAG+="uaccess", TAG+="EVision_Keyboard_0C45652F"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="8520", TAG+="uaccess", TAG+="EVision_Keyboard_0C458520"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="320f", ATTRS{idProduct}=="502a", TAG+="uaccess", TAG+="EVision_Keyboard_320F502A"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="7698", TAG+="uaccess", TAG+="EVision_Keyboard_0C457698"
#---------------------------------------------------------------#
# Redragon Mice - DetectRedragonMice
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="fc30", TAG+="uaccess", TAG+="Redragon_M711_Cobra"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="fc39", TAG+="uaccess", TAG+="Redragon_M715_Dagger"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="fc3a", TAG+="uaccess", TAG+="Redragon_M716_Inquisitor"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="fc4d", TAG+="uaccess", TAG+="Redragon_M908_Impact"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="fc38", TAG+="uaccess", TAG+="Redragon_M602_Griffin"
#---------------------------------------------------------------#
# Zalmna Z Sync - DetectZalmanZSyncControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1c57", ATTRS{idProduct}=="7ed0", TAG+="uaccess", TAG+="Zalman_Z_Sync"
#---------------------------------------------------------------#
# Keychron Keyboard - DetectKeychronKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="05ac", ATTRS{idProduct}=="024f", TAG+="uaccess", TAG+="Keychron_Gaming_Keyboard_1"
#---------------------------------------------------------------#
# Asus AURA Core - DetectAsusAuraCoreControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1854", TAG+="uaccess", TAG+="ASUS_Aura_Core"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1866", TAG+="uaccess", TAG+="ASUS_Aura_Core"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1869", TAG+="uaccess", TAG+="ASUS_Aura_Core"
#---------------------------------------------------------------#
# AsusAuraCoreLaptop - DetectAsusAuraCoreLaptopControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="19b6", TAG+="uaccess", TAG+="ASUS_ROG_Strix_SCAR_15"
#---------------------------------------------------------------#
# ASrock Polychrome USB - DetectPolychromeUSBControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="26ce", ATTRS{idProduct}=="01a2", TAG+="uaccess", TAG+="ASRock_Polychrome_USB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="26ce", ATTRS{idProduct}=="01a6", TAG+="uaccess", TAG+="ASRock_Deskmini_Addressable_LED_Strip"
#---------------------------------------------------------------#
# Thermaltake Riing - DetectThermaltakeRiingControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fa5", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FA5"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fa6", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FA6"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fa7", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FA7"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fa8", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FA8"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fa9", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FA9"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1faa", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FAA"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fab", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FAB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fac", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FAC"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fad", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FAD"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fae", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FAE"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1faf", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FAF"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fb0", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FB0"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fb1", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FB1"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fb2", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FB2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fb3", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FB3"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fb4", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FB4"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="1fb5", TAG+="uaccess", TAG+="Thermaltake_Riing_PID_0x1FB5"
#---------------------------------------------------------------#
# Thermaltake Riing Quad - DetectThermaltakeRiingQuadControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2260", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2260"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2261", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2261"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2262", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2262"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2263", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2263"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2264", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2264"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2265", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2265"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2266", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2266"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2267", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2267"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2268", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2268"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2269", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2269"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="226a", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x226A"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="226b", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x226B"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="226c", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x226C"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="226d", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x226D"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="226e", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x226E"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="226f", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x226F"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="2270", TAG+="uaccess", TAG+="Thermaltake_Riing_Quad_PID_0x2270"
#---------------------------------------------------------------#
# Corsair Hydro Platinum - DetectCorsairHydroPlatinumControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c18", TAG+="uaccess", TAG+="Corsair_Hydro_H100i_Platinum"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c19", TAG+="uaccess", TAG+="Corsair_Hydro_H100i_Platinum_SE"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c17", TAG+="uaccess", TAG+="Corsair_Hydro_H115i_Platinum"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c29", TAG+="uaccess", TAG+="Corsair_Hydro_H60i_Pro_XT"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c20", TAG+="uaccess", TAG+="Corsair_Hydro_H100i_Pro_XT"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c2d", TAG+="uaccess", TAG+="Corsair_Hydro_H100i_Pro_XT_v2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c21", TAG+="uaccess", TAG+="Corsair_Hydro_H115i_Pro_XT"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c22", TAG+="uaccess", TAG+="Corsair_Hydro_H150i_Pro_XT"
#---------------------------------------------------------------#
# Ducky Keyboard - DetectDuckyKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="0348", TAG+="uaccess", TAG+="Ducky_Shine_7Ducky_One_2_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="0356", TAG+="uaccess", TAG+="Ducky_One_2_RGB_TKL"
#---------------------------------------------------------------#
# Lenovo USB - DetectLenovoLegionUSBControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="c935", TAG+="uaccess", TAG+="Lenovo_Legion_Y740"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="c956", TAG+="uaccess", TAG+="Lenovo_Legion_7_gen_5"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="c957", TAG+="uaccess", TAG+="Lenovo_Legion_7S_gen_5"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="c968", TAG+="uaccess", TAG+="Lenovo_Legion_7_gen_6"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="c967", TAG+="uaccess", TAG+="Lenovo_Legion_7S_gen_6"
#---------------------------------------------------------------#
# Lexip Mouse - DetectLexipMouseControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d8", ATTRS{idProduct}=="fd0a", TAG+="uaccess", TAG+="Np93_ALPHA__Gaming_Mouse"
#---------------------------------------------------------------#
# HyperX Alloy Origins Core - DetectHyperXAlloyOriginsCore
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16e6", TAG+="uaccess", TAG+="HyperX_Alloy_Origins_Core"
#---------------------------------------------------------------#
# HyperX Alloy Elite - DetectHyperXAlloyElite
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16be", TAG+="uaccess", TAG+="HyperX_Alloy_Elite_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="1711", TAG+="uaccess", TAG+="HyperX_Alloy_Elite_2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="058f", TAG+="uaccess", TAG+="HyperX_Alloy_Elite_2_HP"
#---------------------------------------------------------------#
# HyperX Alloy FPS - DetectHyperXAlloyFPS
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16dc", TAG+="uaccess", TAG+="HyperX_Alloy_FPS_RGB"
#---------------------------------------------------------------#
# HyperX Alloy Elite 2 - DetectHyperXAlloyElite2
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="1711", TAG+="uaccess", TAG+="HyperX_Alloy_Elite_2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03f0", ATTRS{idProduct}=="058f", TAG+="uaccess", TAG+="HyperX_Alloy_Elite_2_HP"
#---------------------------------------------------------------#
# HyperX Alloy Origins - DetectHyperXAlloyOrigins
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16e6", TAG+="uaccess", TAG+="HyperX_Alloy_Origins_Core"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16e5", TAG+="uaccess", TAG+="HyperX_Alloy_Origins"
#---------------------------------------------------------------#
# NVidia ESA - DetectNvidiaESAControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0955", ATTRS{idProduct}=="000a", TAG+="uaccess", TAG+="Nvidia_ESA__Dell_XPS_730x"
#---------------------------------------------------------------#
# MSI Vigor GK30 - DetectMSIVigorGK30Controllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0db0", ATTRS{idProduct}=="0b30", TAG+="uaccess", TAG+="MSI_Vigor_GK30_controller"
#---------------------------------------------------------------#
# Razer Kraken - DetectRazerKrakenControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0501", TAG+="uaccess", TAG+="Razer_Kraken_71"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0506", TAG+="uaccess", TAG+="Razer_Kraken_71"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0504", TAG+="uaccess", TAG+="Razer_Kraken_71_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0510", TAG+="uaccess", TAG+="Razer_Kraken_71_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0527", TAG+="uaccess", TAG+="Razer_Kraken_Ultimate"
#---------------------------------------------------------------#
# Razer - DetectRazerControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0241", TAG+="uaccess", TAG+="Razer_Blackwidow_2019"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0203", TAG+="uaccess", TAG+="Razer_Blackwidow_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0209", TAG+="uaccess", TAG+="Razer_Blackwidow_Chroma_Tournament_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0221", TAG+="uaccess", TAG+="Razer_Blackwidow_Chroma_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0228", TAG+="uaccess", TAG+="Razer_Blackwidow_Elite"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0211", TAG+="uaccess", TAG+="Razer_Blackwidow_Overwatch"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="024e", TAG+="uaccess", TAG+="Razer_Blackwidow_V3"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="025a", TAG+="uaccess", TAG+="Razer_Blackwidow_V3_Pro_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="025c", TAG+="uaccess", TAG+="Razer_Blackwidow_V3_Pro_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0a24", TAG+="uaccess", TAG+="Razer_Blackwidow_V3_TKL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0258", TAG+="uaccess", TAG+="Razer_Blackwidow_V3_Mini_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0271", TAG+="uaccess", TAG+="Razer_Blackwidow_V3_Mini_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0216", TAG+="uaccess", TAG+="Razer_Blackwidow_X_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="021a", TAG+="uaccess", TAG+="Razer_Blackwidow_X_Chroma_Tournament_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="022a", TAG+="uaccess", TAG+="Razer_Cynosa_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="025e", TAG+="uaccess", TAG+="Razer_Cynosa_Chroma_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="023f", TAG+="uaccess", TAG+="Razer_Cynosa_Lite"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0204", TAG+="uaccess", TAG+="Razer_Deathstalker_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0227", TAG+="uaccess", TAG+="Razer_Huntsman"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0226", TAG+="uaccess", TAG+="Razer_Huntsman_Elite"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0257", TAG+="uaccess", TAG+="Razer_Huntsman_Mini"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0243", TAG+="uaccess", TAG+="Razer_Huntsman_Tournament_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0266", TAG+="uaccess", TAG+="Razer_Huntsman_V2_Analog"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="026b", TAG+="uaccess", TAG+="Razer_Huntsman_V2_TKL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="026c", TAG+="uaccess", TAG+="Razer_Huntsman_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="021e", TAG+="uaccess", TAG+="Razer_Ornata_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="025d", TAG+="uaccess", TAG+="Razer_Ornata_Chroma_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="020f", TAG+="uaccess", TAG+="Razer_Blade_2016"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0224", TAG+="uaccess", TAG+="Razer_Blade_Late_2016"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0270", TAG+="uaccess", TAG+="Razer_Blade_14_2021"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0233", TAG+="uaccess", TAG+="Razer_Blade_15_2018_Advanced"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="023b", TAG+="uaccess", TAG+="Razer_Blade_15_2018_Base"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0240", TAG+="uaccess", TAG+="Razer_Blade_15_2018_Mercury"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="023a", TAG+="uaccess", TAG+="Razer_Blade_15_2019_Advanced"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0246", TAG+="uaccess", TAG+="Razer_Blade_15_2019_Base"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0245", TAG+="uaccess", TAG+="Razer_Blade_15_2019_Mercury"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="024d", TAG+="uaccess", TAG+="Razer_Blade_15_2019_Studio"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0253", TAG+="uaccess", TAG+="Razer_Blade_15_2020_Advanced"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0255", TAG+="uaccess", TAG+="Razer_Blade_15_2020_Base"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0268", TAG+="uaccess", TAG+="Razer_Blade_15_Late_2020"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="026d", TAG+="uaccess", TAG+="Razer_Blade_15_2021_Advanced"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="026f", TAG+="uaccess", TAG+="Razer_Blade_15_2021_Base"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="027a", TAG+="uaccess", TAG+="Razer_Blade_15_2021_Base"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0210", TAG+="uaccess", TAG+="Razer_Blade_Pro_2016"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0225", TAG+="uaccess", TAG+="Razer_Blade_Pro_2017"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="022f", TAG+="uaccess", TAG+="Razer_Blade_Pro_2017_FullHD"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0234", TAG+="uaccess", TAG+="Razer_Blade_Pro_2019"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="024c", TAG+="uaccess", TAG+="Razer_Blade_Pro_Late_2019"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0256", TAG+="uaccess", TAG+="Razer_Blade_Pro_17_2020"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0279", TAG+="uaccess", TAG+="Razer_Blade_Pro_17_2021"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0205", TAG+="uaccess", TAG+="Razer_Blade_Stealth_2016"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0220", TAG+="uaccess", TAG+="Razer_Blade_Stealth_Late_2016"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="022d", TAG+="uaccess", TAG+="Razer_Blade_Stealth_2017"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0232", TAG+="uaccess", TAG+="Razer_Blade_Stealth_Late_2017"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0239", TAG+="uaccess", TAG+="Razer_Blade_Stealth_2019"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="024a", TAG+="uaccess", TAG+="Razer_Blade_Stealth_Late_2019"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0252", TAG+="uaccess", TAG+="Razer_Blade_Stealth_2020"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0259", TAG+="uaccess", TAG+="Razer_Blade_Stealth_Late_2020"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="026a", TAG+="uaccess", TAG+="Razer_Book_13_2020"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="006a", TAG+="uaccess", TAG+="Razer_Abyssus_Elite_DVa_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="006b", TAG+="uaccess", TAG+="Razer_Abyssus_Essential"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0064", TAG+="uaccess", TAG+="Razer_Basilisk"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0065", TAG+="uaccess", TAG+="Razer_Basilisk_Essential"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0086", TAG+="uaccess", TAG+="Razer_Basilisk_Ultimate_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0088", TAG+="uaccess", TAG+="Razer_Basilisk_Ultimate_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0085", TAG+="uaccess", TAG+="Razer_Basilisk_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0099", TAG+="uaccess", TAG+="Razer_Basilisk_V3"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0043", TAG+="uaccess", TAG+="Razer_Deathadder_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="005c", TAG+="uaccess", TAG+="Razer_Deathadder_Elite"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="006e", TAG+="uaccess", TAG+="Razer_Deathadder_Essential"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0098", TAG+="uaccess", TAG+="Razer_Deathadder_Essential_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0071", TAG+="uaccess", TAG+="Razer_Deathadder_Essential_White_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0084", TAG+="uaccess", TAG+="Razer_Deathadder_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="008c", TAG+="uaccess", TAG+="Razer_Deathadder_V2_Mini"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="007c", TAG+="uaccess", TAG+="Razer_Deathadder_V2_Pro_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="007d", TAG+="uaccess", TAG+="Razer_Deathadder_V2_Pro_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="004c", TAG+="uaccess", TAG+="Razer_Diamondback"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0059", TAG+="uaccess", TAG+="Razer_Lancehead_2017_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="005a", TAG+="uaccess", TAG+="Razer_Lancehead_2017_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0070", TAG+="uaccess", TAG+="Razer_Lancehead_2019_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="006f", TAG+="uaccess", TAG+="Razer_Lancehead_2019_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0060", TAG+="uaccess", TAG+="Razer_Lancehead_Tournament_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0024", TAG+="uaccess", TAG+="Razer_Mamba_2012_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0025", TAG+="uaccess", TAG+="Razer_Mamba_2012_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0044", TAG+="uaccess", TAG+="Razer_Mamba_2015_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0045", TAG+="uaccess", TAG+="Razer_Mamba_2015_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0073", TAG+="uaccess", TAG+="Razer_Mamba_2018_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0072", TAG+="uaccess", TAG+="Razer_Mamba_2018_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="006c", TAG+="uaccess", TAG+="Razer_Mamba_Elite"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0046", TAG+="uaccess", TAG+="Razer_Mamba_Tournament_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0053", TAG+="uaccess", TAG+="Razer_Naga_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0093", TAG+="uaccess", TAG+="Razer_Naga_Classic"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="003e", TAG+="uaccess", TAG+="Razer_Naga_Epic_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="008d", TAG+="uaccess", TAG+="Razer_Naga_Left_Handed"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0050", TAG+="uaccess", TAG+="Razer_Naga_Hex_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0067", TAG+="uaccess", TAG+="Razer_Naga_Trinity"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="008f", TAG+="uaccess", TAG+="Razer_Naga_Pro_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0090", TAG+="uaccess", TAG+="Razer_Naga_Pro_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0078", TAG+="uaccess", TAG+="Razer_Viper"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0091", TAG+="uaccess", TAG+="Razer_Viper_8kHz"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="008a", TAG+="uaccess", TAG+="Razer_Viper_Mini"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="007a", TAG+="uaccess", TAG+="Razer_Viper_Ultimate_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="007b", TAG+="uaccess", TAG+="Razer_Viper_Ultimate_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0207", TAG+="uaccess", TAG+="Razer_Orbweaver_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0208", TAG+="uaccess", TAG+="Razer_Tartarus_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="022b", TAG+="uaccess", TAG+="Razer_Tartarus_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f19", TAG+="uaccess", TAG+="Razer_Kraken_Kitty_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f21", TAG+="uaccess", TAG+="Razer_Kraken_Kitty_Black_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f03", TAG+="uaccess", TAG+="Razer_Tiamat_71_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0c00", TAG+="uaccess", TAG+="Razer_Firefly"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0c04", TAG+="uaccess", TAG+="Razer_Firefly_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0068", TAG+="uaccess", TAG+="Razer_Firefly_Hyperflux"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0c01", TAG+="uaccess", TAG+="Razer_Goliathus"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0c02", TAG+="uaccess", TAG+="Razer_Goliathus_Extended"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f08", TAG+="uaccess", TAG+="Razer_Base_Station_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f20", TAG+="uaccess", TAG+="Razer_Base_Station_V2_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f26", TAG+="uaccess", TAG+="Razer_Charging_Pad_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f09", TAG+="uaccess", TAG+="Razer_Chroma_HDK"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f07", TAG+="uaccess", TAG+="Razer_Chroma_Mug_Holder"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f0e", TAG+="uaccess", TAG+="Razer_Chroma_PC_Case_Lighting_Kit"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0215", TAG+="uaccess", TAG+="Razer_Core"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f1a", TAG+="uaccess", TAG+="Razer_Core_X"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f0d", TAG+="uaccess", TAG+="Razer_Laptop_Stand_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f2b", TAG+="uaccess", TAG+="Razer_Laptop_Stand_Chroma_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f1d", TAG+="uaccess", TAG+="Razer_Mouse_Bungee_V3_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="007e", TAG+="uaccess", TAG+="Razer_Mouse_Dock_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f13", TAG+="uaccess", TAG+="Lian_Li_O11_Dynamic__Razer_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f1b", TAG+="uaccess", TAG+="Razer_Seiren_Emote"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0517", TAG+="uaccess", TAG+="Razer_Nommo_Chroma"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0518", TAG+="uaccess", TAG+="Razer_Nommo_Pro"
#---------------------------------------------------------------#
# Razer ARGB - DetectRazerARGBControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0f1f", TAG+="uaccess", TAG+="Razer_Chroma_Addressable_RGB_Controller"
#---------------------------------------------------------------#
# Anne Pro 2 - DetectAnnePro2Controllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="8008", TAG+="uaccess", TAG+="Anne_Pro_2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="8009", TAG+="uaccess", TAG+="Anne_Pro_2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="a292", TAG+="uaccess", TAG+="Anne_Pro_2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="a293", TAG+="uaccess", TAG+="Anne_Pro_2"
#---------------------------------------------------------------#
# Corsair Wireless Peripheral - DetectCorsairWirelessControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b6e", TAG+="uaccess", TAG+="Corsair_K57_RGB_Wired"
#---------------------------------------------------------------#
# Serial LED Strip - DetectLEDStripControllers
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Sony Dual Shock 4 controller - DetectSonyDS4Controllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="05c4", TAG+="uaccess", TAG+="Sony_DualShock_4"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="09cc", TAG+="uaccess", TAG+="Sony_DualShock_4"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ba0", TAG+="uaccess", TAG+="Sony_DualShock_4"
#---------------------------------------------------------------#
# Sony Dual Sense controller - DetectSonyDualSenseControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ce6", TAG+="uaccess", TAG+="Sony_DualSense"
#---------------------------------------------------------------#
# Alienware AW510 Keyboard - DetectAlienwareAW510KControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04f2", ATTRS{idProduct}=="1830", TAG+="uaccess", TAG+="Alienware_AW510K"
#---------------------------------------------------------------#
# Holtek A1FA - DetectHoltekMousemats
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="a1fa", TAG+="uaccess", TAG+="Holtek_Mousemat"
#---------------------------------------------------------------#
# Holtek A070 - DetectHoltekControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="a070", TAG+="uaccess", TAG+="Holtek_USB_Gaming_Mouse"
#---------------------------------------------------------------#
# HP Omen 30L - DetectHPOmen30LController
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="103c", ATTRS{idProduct}=="84fd", TAG+="uaccess", TAG+="HP_Omen_30L"
#---------------------------------------------------------------#
# ThingM Blink - DetectThingMBlink
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="27b8", ATTRS{idProduct}=="01ed", TAG+="uaccess", TAG+="ThingM_blink1_mk2"
#---------------------------------------------------------------#
# HyperX Mousemat - DetectHyperXMousematControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="1705", TAG+="uaccess", TAG+="HyperX_Fury_Ultra"
#---------------------------------------------------------------#
# LIFX Globes - DetectLIFXControllers
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Aorus ATC800 - DetectGigabyteAorusCPUCoolerControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1044", ATTRS{idProduct}=="7a42", TAG+="uaccess", TAG+="Aorus_CPU_Coolers"
#---------------------------------------------------------------#
# NZXT Kraken - DetectNZXTKrakenControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="170e", TAG+="uaccess", TAG+="NZXT_Kraken_X2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="1715", TAG+="uaccess", TAG+="NZXT_Kraken_M2"
#---------------------------------------------------------------#
# MSI 3 Zone Keyboard - DetectMSI3ZoneControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1770", ATTRS{idProduct}=="ff00", TAG+="uaccess", TAG+="MSI_3Zone_Laptop"
#---------------------------------------------------------------#
# Wooting Keyboards - DetectWootingOneKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", TAG+="uaccess", TAG+="Wooting_ONE_Keyboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", TAG+="uaccess", TAG+="Wooting_TWO_Keyboard"
#---------------------------------------------------------------#
# Wooting Keyboards - DetectWootingTwoKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1210", TAG+="uaccess", TAG+="Wooting_TWO_Keyboard_LE"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="31e3", ATTRS{idProduct}=="1220", TAG+="uaccess", TAG+="Wooting_TWO_Keyboard_HE"
#---------------------------------------------------------------#
# Tecknet Mouse - DetectTecknetControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="fc05", TAG+="uaccess", TAG+="Tecknet_M008"
#---------------------------------------------------------------#
# MSI Optix - DetectMSIOptixControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="3fa4", TAG+="uaccess", TAG+="MSI_Optix_controller"
#---------------------------------------------------------------#
# Sinowealth 1007 Mouse - DetectSinowealthMouse
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0036", TAG+="uaccess", TAG+="Glorious_Model_O__O"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0033", TAG+="uaccess", TAG+="Glorious_Model_D__D"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0029", TAG+="uaccess", TAG+="Everest_GT100_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="1007", TAG+="uaccess", TAG+="ZET_Fury_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2022", TAG+="uaccess", TAG+="Glorious_Model_O__O_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2011", TAG+="uaccess", TAG+="Glorious_Model_O__O_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2023", TAG+="uaccess", TAG+="Glorious_Model_D__D_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2012", TAG+="uaccess", TAG+="Glorious_Model_D__D_Wireless"
#---------------------------------------------------------------#
# Sinowealth Keyboard - DetectSinowealthKeyboard
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Sinowealth Keyboard 16 - DetectSinowealthKeyboard
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Sinowealth Mice - DetectSinowealthMouse
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0036", TAG+="uaccess", TAG+="Glorious_Model_O__O"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0033", TAG+="uaccess", TAG+="Glorious_Model_D__D"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0029", TAG+="uaccess", TAG+="Everest_GT100_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="1007", TAG+="uaccess", TAG+="ZET_Fury_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2022", TAG+="uaccess", TAG+="Glorious_Model_O__O_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2011", TAG+="uaccess", TAG+="Glorious_Model_O__O_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2023", TAG+="uaccess", TAG+="Glorious_Model_D__D_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2012", TAG+="uaccess", TAG+="Glorious_Model_D__D_Wireless"
#---------------------------------------------------------------#
# Sinowealth Glorious Model O Wireless - DetectSinowealthMouse
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0036", TAG+="uaccess", TAG+="Glorious_Model_O__O"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0033", TAG+="uaccess", TAG+="Glorious_Model_D__D"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="0029", TAG+="uaccess", TAG+="Everest_GT100_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="1007", TAG+="uaccess", TAG+="ZET_Fury_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2022", TAG+="uaccess", TAG+="Glorious_Model_O__O_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2011", TAG+="uaccess", TAG+="Glorious_Model_O__O_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2023", TAG+="uaccess", TAG+="Glorious_Model_D__D_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="2012", TAG+="uaccess", TAG+="Glorious_Model_D__D_Wireless"
#---------------------------------------------------------------#
# Blinky Tape - DetectBlinkyTapeControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="serial|hidraw", ATTRS{idVendor}=="1d50", ATTRS{idProduct}=="605e", TAG+="uaccess", TAG+="BlinkyTape"
#---------------------------------------------------------------#
# Corsair K100 Keyboard - DetectCorsairK100Controllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b7c", TAG+="uaccess", TAG+="Corsair_K100"
#---------------------------------------------------------------#
# Corsair K95 Platinum XT Keyboard - DetectCorsairK95PlatinumXTControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b89", TAG+="uaccess", TAG+="Corsair_K95_RGB_PLATINUM_XT"
#---------------------------------------------------------------#
# Corsair Peripheral - DetectCorsairPeripheralControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b3d", TAG+="uaccess", TAG+="Corsair_K55_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b17", TAG+="uaccess", TAG+="Corsair_K65_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b37", TAG+="uaccess", TAG+="Corsair_K65_LUX_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b39", TAG+="uaccess", TAG+="Corsair_K65_RGB_RAPIDFIRE"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b4f", TAG+="uaccess", TAG+="Corsair_K68_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b13", TAG+="uaccess", TAG+="Corsair_K70_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b33", TAG+="uaccess", TAG+="Corsair_K70_LUX_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b38", TAG+="uaccess", TAG+="Corsair_K70_RGB_RAPIDFIRE"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b49", TAG+="uaccess", TAG+="Corsair_K70_RGB_MK2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b6b", TAG+="uaccess", TAG+="Corsair_K70_RGB_MK2_SE"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b55", TAG+="uaccess", TAG+="Corsair_K70_RGB_MK2_Low_Profile"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b11", TAG+="uaccess", TAG+="Corsair_K95_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b2d", TAG+="uaccess", TAG+="Corsair_K95_RGB_PLATINUM"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b20", TAG+="uaccess", TAG+="Corsair_Strafe"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b44", TAG+="uaccess", TAG+="Corsair_Strafe_Red"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b48", TAG+="uaccess", TAG+="Corsair_Strafe_MK2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b34", TAG+="uaccess", TAG+="Corsair_Glaive_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b74", TAG+="uaccess", TAG+="Corsair_Glaive_RGB_PRO"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b3c", TAG+="uaccess", TAG+="Corsair_Harpoon_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b75", TAG+="uaccess", TAG+="Corsair_Harpoon_RGB_PRO"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b5d", TAG+="uaccess", TAG+="Corsair_Ironclaw_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b12", TAG+="uaccess", TAG+="Corsair_M65"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b2e", TAG+="uaccess", TAG+="Corsair_M65_PRO"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b5a", TAG+="uaccess", TAG+="Corsair_M65_RGB_Elite"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b5c", TAG+="uaccess", TAG+="Corsair_Nightsword"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b1e", TAG+="uaccess", TAG+="Corsair_Scimitar_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b3e", TAG+="uaccess", TAG+="Corsair_Scimitar_PRO_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b8b", TAG+="uaccess", TAG+="Corsair_Scimitar_Elite_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b2f", TAG+="uaccess", TAG+="Corsair_Sabre_RGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b3b", TAG+="uaccess", TAG+="Corsair_MM800_RGB_Polaris"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0a34", TAG+="uaccess", TAG+="Corsair_ST100_RGB"
#---------------------------------------------------------------#
# Corsair K55 RGB Pro XT - DetectCorsairK55RGBPROXTControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1ba1", TAG+="uaccess", TAG+="Corsair_K55_RGB_PRO_XT"
#---------------------------------------------------------------#
# Corsair K65 Mini - DetectCorsairK65MiniControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1baf", TAG+="uaccess", TAG+="Corsair_K65_Mini"
#---------------------------------------------------------------#
# Corsair K55 RGB Pro - DetectCorsairV2SoftwareControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1ba4", TAG+="uaccess", TAG+="Corsair_K55_RGB_PRO"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b9b", TAG+="uaccess", TAG+="Corsair_MM700"
#---------------------------------------------------------------#
# N5312A mouse - DetectN5312AControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="4e53", ATTRS{idProduct}=="5406", TAG+="uaccess", TAG+="N5312A_USB_Optical_Mouse"
#---------------------------------------------------------------#
# HyoerX Pulsefire Dart - DetectHyperXPulsefireDartControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16e1", TAG+="uaccess", TAG+="HyperX_Pulsefire_Dart_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16e2", TAG+="uaccess", TAG+="HyperX_Pulsefire_Dart_Wired"
#---------------------------------------------------------------#
# HyperX Pulsefire Surge - DetectHyperXPulsefireSurgeControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16d3", TAG+="uaccess", TAG+="HyperX_Pulsefire_Surge"
#---------------------------------------------------------------#
# HyperX Pulsefire FPS - DetectHyperXPulsefireFPSProControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16d7", TAG+="uaccess", TAG+="HyperX_Pulsefire_FPS_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16de", TAG+="uaccess", TAG+="HyperX_Pulsefire_Core"
#---------------------------------------------------------------#
# HyperX Pulsefire Haste - DetectHyperXPulsefireHasteControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="1727", TAG+="uaccess", TAG+="HyperX_Pulsefire_Haste"
#---------------------------------------------------------------#
# HyoerX Pulsefire Raid - DetectHyperXPulsefireRaidControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0951", ATTRS{idProduct}=="16e4", TAG+="uaccess", TAG+="HyperX_Pulsefire_Raid"
#---------------------------------------------------------------#
# Asus Aura Strix Evolve - DetectAsusAuraUSBStrixEvolve
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="185b", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Evolve"
#---------------------------------------------------------------#
# Corsair Commander Core - DetectCorsairCapellixHIDControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c1c", TAG+="uaccess", TAG+="Corsair_Commander_Core"
#---------------------------------------------------------------#
# BloodyMouse - DetectA4TechMouseControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="37ea", TAG+="uaccess", TAG+="Bloody_W60_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="fa60", TAG+="uaccess", TAG+="Bloody_MP_50RS"
#---------------------------------------------------------------#
# ZET Edge Air Pro - DetectZETGAMINGEdgeAirProControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="25a7", ATTRS{idProduct}=="fa3f", TAG+="uaccess", TAG+="ZET_GAMING_Edge_Air_Pro_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="25a7", ATTRS{idProduct}=="fa40", TAG+="uaccess", TAG+="ZET_GAMING_Edge_Air_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="25a7", ATTRS{idProduct}=="fa48", TAG+="uaccess", TAG+="ZET_GAMING_Edge_Air_Elit_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="25a7", ATTRS{idProduct}=="fa49", TAG+="uaccess", TAG+="ZET_GAMING_Edge_Air_Elit"
#---------------------------------------------------------------#
# GaiZhongGai Keyboard - DetectGaiZhongGaiKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3061", ATTRS{idProduct}=="4700", TAG+="uaccess", TAG+="GaiZhongGai_684_PRO"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3061", ATTRS{idProduct}=="4770", TAG+="uaccess", TAG+="GaiZhongGai_174Touch_PRO"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3061", ATTRS{idProduct}=="4771", TAG+="uaccess", TAG+="GaiZhongGai_17_PRO"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3061", ATTRS{idProduct}=="4772", TAG+="uaccess", TAG+="GaiZhongGai_20_PRO"
#---------------------------------------------------------------#
# FanBus - DetectFanBusControllers
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# AMD Wraith Prism - DetectAMDWraithPrismControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0051", TAG+="uaccess", TAG+="AMD_Wraith_Prism"
#---------------------------------------------------------------#
# Alienware - DetectAlienwareControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="187c", ATTRS{idProduct}=="0550", TAG+="uaccess", TAG+="Dell_G_Series_LED_Controller"
#---------------------------------------------------------------#
# Asus Aura Ryuo AIO  - DetectAsusAuraUSBMousemats
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1891", TAG+="uaccess", TAG+="ASUS_ROG_Balteus"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1890", TAG+="uaccess", TAG+="ASUS_ROG_Balteus_Qi"
#---------------------------------------------------------------#
# Asus ROG Strix Liquid Cooler - DetectAsusAuraUSBROGStrixLC
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="879e", TAG+="uaccess", TAG+="ASUS_ROG_Strix_LC"
#---------------------------------------------------------------#
# Asus Aura Mouse - DetectAsusAuraUSBMice
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18dd", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_II_Core"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1845", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_II"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1877", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_II_Origin"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18cd", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_II_Origin_PNK_LTD"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18b1", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_II_Origin_COD"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="189e", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_II_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18a0", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_II_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="197d", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_III_Wireless_USB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="197f", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_III_Wireless_24Ghz"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1981", TAG+="uaccess", TAG+="ASUS_ROG_Gladius_III_Wireless_Bluetooth"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18e5", TAG+="uaccess", TAG+="ASUS_ROG_Chakram_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18e3", TAG+="uaccess", TAG+="Asus_ROG_Chakram_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1958", TAG+="uaccess", TAG+="Asus_ROG_Chakram_Core"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1846", TAG+="uaccess", TAG+="ASUS_ROG_Pugio"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1906", TAG+="uaccess", TAG+="ASUS_ROG_Pugio_II_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1908", TAG+="uaccess", TAG+="ASUS_ROG_Pugio_II_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1847", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Impact"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18e1", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Impact_II"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="189e", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Impact_II_Gundam"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1956", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Impact_II_Electro_Punk"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="19d2", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Impact_II_Moonlight_White"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1947", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Impact_II_Wireless_USB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1949", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Impact_II_Wireless_24_Ghz"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="195c", TAG+="uaccess", TAG+="ASUS_ROG_Keris"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="195e", TAG+="uaccess", TAG+="ASUS_ROG_Keris_Wireless_USB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1960", TAG+="uaccess", TAG+="ASUS_ROG_Keris_Wireless_24Ghz"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1962", TAG+="uaccess", TAG+="ASUS_ROG_Keris_Wireless_Bluetooth"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1910", TAG+="uaccess", TAG+="ASUS_TUF_Gaming_M3"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1898", TAG+="uaccess", TAG+="ASUS_TUF_Gaming_M5"
#---------------------------------------------------------------#
# Asus Aura Headset Stand - DetectAsusAuraUSBHeadsetStand
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18d9", TAG+="uaccess", TAG+="ASUS_ROG_Throne"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18c5", TAG+="uaccess", TAG+="ASUS_ROG_Throne_QI"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1994", TAG+="uaccess", TAG+="ASUS_ROG_Throne_QI_GUNDAM"
#---------------------------------------------------------------#
# Asus Aura USB - DetectAsusAuraUSBTerminal
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1889", TAG+="uaccess", TAG+="ASUS_ROG_AURA_Terminal"
#---------------------------------------------------------------#
# Asus Aura USB - DetectAsusAuraUSBAddressable
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1867", TAG+="uaccess", TAG+="ASUS_Aura_Addressable"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1872", TAG+="uaccess", TAG+="ASUS_Aura_Addressable"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18a3", TAG+="uaccess", TAG+="ASUS_Aura_Addressable"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18a5", TAG+="uaccess", TAG+="ASUS_Aura_Addressable"
#---------------------------------------------------------------#
# Asus Aura USB - DetectAsusAuraUSBMotherboards
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18f3", TAG+="uaccess", TAG+="ASUS_Aura_Motherboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1939", TAG+="uaccess", TAG+="ASUS_Aura_Motherboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="19af", TAG+="uaccess", TAG+="ASUS_Aura_Motherboard"
#---------------------------------------------------------------#
# Asus Aura Mousemat - DetectAsusAuraUSBMousemats
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1891", TAG+="uaccess", TAG+="ASUS_ROG_Balteus"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1890", TAG+="uaccess", TAG+="ASUS_ROG_Balteus_Qi"
#---------------------------------------------------------------#
# Asus Aura TUF Keyboard - DetectAsusAuraTUFUSBKeyboard
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18aa", TAG+="uaccess", TAG+="ASUS_TUF_Gaming_K7"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="194b", TAG+="uaccess", TAG+="ASUS_TUF_Gaming_K3"
#---------------------------------------------------------------#
# Asus Aura Keyboard - DetectAsusAuraUSBKeyboards
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="193c", TAG+="uaccess", TAG+="ASUS_ROG_Falchion_Wired"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="193e", TAG+="uaccess", TAG+="ASUS_ROG_Falchion_Wireless"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1875", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Flare"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18cf", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Flare_PNK_LTD"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18f8", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Scope"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1951", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Scope_RX"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="190c", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Scope_TKL"
#---------------------------------------------------------------#
# Asus Aura Monitor - DetectAsusAuraUSBMonitor
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="198c", TAG+="uaccess", TAG+="ASUS_ROG_Strix_XG27AQ"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="1933", TAG+="uaccess", TAG+="ASUS_ROG_Strix_XG27W"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="19b9", TAG+="uaccess", TAG+="ASUS_ROG_PG32UQ"
#---------------------------------------------------------------#
# Asus Aura Strix Evolve - DetectAsusAuraUSBStrixEvolve
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="185b", TAG+="uaccess", TAG+="ASUS_ROG_Strix_Evolve"
#---------------------------------------------------------------#
# Gigabyte RGB Fusion 2 USB - DetectGigabyteRGBFusion2USBControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="8297", TAG+="uaccess", TAG+="Gigabyte_RGB_Fusion_2_USB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="5702", TAG+="uaccess", TAG+="Gigabyte_RGB_Fusion_2_USB"
#---------------------------------------------------------------#
# Das Keyboard - DetectDasKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="24f0", ATTRS{idProduct}=="2020", TAG+="uaccess", TAG+="Das_Keyboard_Q5_RGB"
#---------------------------------------------------------------#
# NZXT Hue2 - DetectNZXTHue2
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2001", TAG+="uaccess", TAG+="NZXT_Hue_2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2002", TAG+="uaccess", TAG+="NZXT_Hue_2_Ambient"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2005", TAG+="uaccess", TAG+="NZXT_Hue_2_Motherboard"
#---------------------------------------------------------------#
# NZXT Hue2 - DetectNZXTHue2Ambient
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2002", TAG+="uaccess", TAG+="NZXT_Hue_2_Ambient"
#---------------------------------------------------------------#
# NZXT Hue2 - DetectNZXTHue2Motherboard
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2005", TAG+="uaccess", TAG+="NZXT_Hue_2_Motherboard"
#---------------------------------------------------------------#
# NZXT Hue2 - DetectNZXTSmartDeviceV2
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2006", TAG+="uaccess", TAG+="NZXT_Smart_Device_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="200d", TAG+="uaccess", TAG+="NZXT_Smart_Device_V2"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="200f", TAG+="uaccess", TAG+="NZXT_Smart_Device_V2"
#---------------------------------------------------------------#
# NZXT Hue2 - DetectNZXTKrakenX3
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2007", TAG+="uaccess", TAG+="NZXT_Kraken_X3"
#---------------------------------------------------------------#
# NZXT Hue2 - DetectNZXTFanController
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2009", TAG+="uaccess", TAG+="NZXT_RGB__Fan_Controller"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2010", TAG+="uaccess", TAG+="NZXT_RGB__Fan_Controller"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="200e", TAG+="uaccess", TAG+="NZXT_RGB__Fan_Controller"
#---------------------------------------------------------------#
# Roccat Burst Mouse - DetectRoccatBurstCoreControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e7d", ATTRS{idProduct}=="2de6", TAG+="uaccess", TAG+="Roccat_Burst_Core"
#---------------------------------------------------------------#
# Roccat Burst Mouse - DetectRoccatBurstProControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e7d", ATTRS{idProduct}=="2de1", TAG+="uaccess", TAG+="Roccat_Burst_Pro"
#---------------------------------------------------------------#
# Roccat Horde Aimo - DetectRoccatHordeAimoKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e7d", ATTRS{idProduct}=="303e", TAG+="uaccess", TAG+="Roccat_Horde_Aimo"
#---------------------------------------------------------------#
# Roccat Vulcan Aimo - DetectRoccatKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e7d", ATTRS{idProduct}=="3098", TAG+="uaccess", TAG+="Roccat_Vulcan_120_Aimo"
#---------------------------------------------------------------#
# Roccat Kone Aimo - DetectRoccatMouseControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e7d", ATTRS{idProduct}=="2e27", TAG+="uaccess", TAG+="Roccat_Kone_Aimo"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1e7d", ATTRS{idProduct}=="2e2c", TAG+="uaccess", TAG+="Roccat_Kone_Aimo_16K"
#---------------------------------------------------------------#
# Dark Project Keyboard - DetectDarkProjectKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="195d", ATTRS{idProduct}=="2061", TAG+="uaccess", TAG+="Dark_Project_KD3B_V2"
#---------------------------------------------------------------#
# Openrazer Windows - DetectOpenRazerControllers
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# Openrazer - DetectOpenRazerControllers
#---------------------------------------------------------------#
#---------------------------------------------------------------#
# SRGBmods Raspberry Pi Pico LED Controller - DetectSRGBmodsControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="1123", TAG+="uaccess", TAG+="SRGBmods_Pico_LED_Controller"
#---------------------------------------------------------------#
# Zet Blade Optical - DetectZETBladeOptical
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2ea8", ATTRS{idProduct}=="2125", TAG+="uaccess", TAG+="ZET_Blade_Optical"
#---------------------------------------------------------------#
# Creative Sound BlasterX G6 - DetectCreativeDevice
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="041e", ATTRS{idProduct}=="3256", TAG+="uaccess", TAG+="Creative_SoundBlasterX_G6"
#---------------------------------------------------------------#
# Steelseries Arctis 5 - DetectSteelSeriesArctis5
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="12aa", TAG+="uaccess", TAG+="SteelSeries_Arctis_5"
#---------------------------------------------------------------#
# Steel Series Apex Tri Zone Keyboards - DetectSteelSeriesApexTZone
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="161a", TAG+="uaccess", TAG+="SteelSeries_Apex_3"
#---------------------------------------------------------------#
# Steel Series Rival 3 - DetectSteelSeriesRival3
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1710", TAG+="uaccess", TAG+="SteelSeries_Rival_300"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1714", TAG+="uaccess", TAG+="Acer_Predator_Gaming_Mouse_Rival_300"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1394", TAG+="uaccess", TAG+="SteelSeries_Rival_300_CSGO_Fade_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1716", TAG+="uaccess", TAG+="SteelSeries_Rival_300_CSGO_Fade_Edition_stm32"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="171a", TAG+="uaccess", TAG+="SteelSeries_Rival_300_CSGO_Hyperbeast_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1392", TAG+="uaccess", TAG+="SteelSeries_Rival_300_Dota_2_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1718", TAG+="uaccess", TAG+="SteelSeries_Rival_300_HP_Omen_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1710", TAG+="uaccess", TAG+="SteelSeries_Rival_300_Black_Ops_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1824", TAG+="uaccess", TAG+="SteelSeries_Rival_3_Old_Firmware"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="184c", TAG+="uaccess", TAG+="SteelSeries_Rival_3"
#---------------------------------------------------------------#
# Steel Series Rival - DetectSteelSeriesRival100
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1702", TAG+="uaccess", TAG+="SteelSeries_Rival_100"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="170c", TAG+="uaccess", TAG+="SteelSeries_Rival_100_DotA_2_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1814", TAG+="uaccess", TAG+="SteelSeries_Rival_105"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1816", TAG+="uaccess", TAG+="SteelSeries_Rival_106"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1729", TAG+="uaccess", TAG+="SteelSeries_Rival_110"
#---------------------------------------------------------------#
# Steel Series Rival - DetectSteelSeriesRival300
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1710", TAG+="uaccess", TAG+="SteelSeries_Rival_300"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1714", TAG+="uaccess", TAG+="Acer_Predator_Gaming_Mouse_Rival_300"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1394", TAG+="uaccess", TAG+="SteelSeries_Rival_300_CSGO_Fade_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1716", TAG+="uaccess", TAG+="SteelSeries_Rival_300_CSGO_Fade_Edition_stm32"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="171a", TAG+="uaccess", TAG+="SteelSeries_Rival_300_CSGO_Hyperbeast_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1392", TAG+="uaccess", TAG+="SteelSeries_Rival_300_Dota_2_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1718", TAG+="uaccess", TAG+="SteelSeries_Rival_300_HP_Omen_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1710", TAG+="uaccess", TAG+="SteelSeries_Rival_300_Black_Ops_Edition"
#---------------------------------------------------------------#
# Steel Series Rival - DetectSteelSeriesRival600
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1724", TAG+="uaccess", TAG+="SteelSeries_Rival_600"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="172e", TAG+="uaccess", TAG+="SteelSeries_Rival_600_Dota_2_Edition"
#---------------------------------------------------------------#
# Steel Series Rival - DetectSteelSeriesRival650
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="172b", TAG+="uaccess", TAG+="SteelSeries_Rival_650"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1726", TAG+="uaccess", TAG+="SteelSeries_Rival_650_Wireless"
#---------------------------------------------------------------#
# Steel Series Rival - DetectSteelSeriesRival700
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1700", TAG+="uaccess", TAG+="SteelSeries_Rival_700"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1730", TAG+="uaccess", TAG+="SteelSeries_Rival_710"
#---------------------------------------------------------------#
# Steel Series Siberia - DetectSteelSeriesHeadset
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1229", TAG+="uaccess", TAG+="SteelSeries_Siberia_350"
#---------------------------------------------------------------#
# Steel Series Sensei - DetectSteelSeriesSensei
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1720", TAG+="uaccess", TAG+="SteelSeries_Rival_310"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="171e", TAG+="uaccess", TAG+="SteelSeries_Rival_310_CSGO_Howl_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1736", TAG+="uaccess", TAG+="SteelSeries_Rival_310_PUBG_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1832", TAG+="uaccess", TAG+="SteelSeries_Sensei_TEN"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1834", TAG+="uaccess", TAG+="SteelSeries_Sensei_TEN_CSGO_Neon_Rider_Edition"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1722", TAG+="uaccess", TAG+="SteelSeries_Sensei_310"
#---------------------------------------------------------------#
# Steel Series Apex (Old) - DetectSteelSeriesApexOld
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1202", TAG+="uaccess", TAG+="SteelSeries_Apex_OGApex_Fnatic"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1206", TAG+="uaccess", TAG+="SteelSeries_Apex_350"
#---------------------------------------------------------------#
# Steel Series APEX - DetectSteelSeriesApex
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="161a", TAG+="uaccess", TAG+="SteelSeries_Apex_3"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="161c", TAG+="uaccess", TAG+="SteelSeries_Apex_5"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1612", TAG+="uaccess", TAG+="SteelSeries_Apex_7"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1618", TAG+="uaccess", TAG+="SteelSeries_Apex_7_TKL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1610", TAG+="uaccess", TAG+="SteelSeries_Apex_Pro"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1614", TAG+="uaccess", TAG+="SteelSeries_Apex_Pro_TKL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="0616", TAG+="uaccess", TAG+="SteelSeries_Apex_M750"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1202", TAG+="uaccess", TAG+="SteelSeries_Apex_OGApex_Fnatic"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1206", TAG+="uaccess", TAG+="SteelSeries_Apex_350"
#---------------------------------------------------------------#
# Steel Series APEX - DetectSteelSeriesApexTKL
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1618", TAG+="uaccess", TAG+="SteelSeries_Apex_7_TKL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1614", TAG+="uaccess", TAG+="SteelSeries_Apex_Pro_TKL"
#---------------------------------------------------------------#
# Steel Series APEX - DetectSteelSeriesApexM
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="0616", TAG+="uaccess", TAG+="SteelSeries_Apex_M750"
#---------------------------------------------------------------#
# Steel Series QCK Mat - DetectSteelSeriesMousemat
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="150a", TAG+="uaccess", TAG+="SteelSeries_QCK_Prism_Cloth_Medium"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="150d", TAG+="uaccess", TAG+="SteelSeries_QCK_Prism_Cloth_XL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="151e", TAG+="uaccess", TAG+="SteelSeries_QCK_Prism_Cloth_XL_Destiny_Ed"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1516", TAG+="uaccess", TAG+="SteelSeries_QCK_Prism_Cloth_3XL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1038", ATTRS{idProduct}=="1518", TAG+="uaccess", TAG+="SteelSeries_QCK_Prism_Cloth_4XL"
#---------------------------------------------------------------#
# Corsair Hydro - DetectCorsairHydroControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="x0c12", TAG+="uaccess", TAG+="Corsair_Hydro_Series"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="x0c13", TAG+="uaccess", TAG+="Corsair_Hydro_Series"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="x0c15", TAG+="uaccess", TAG+="Corsair_Hydro_Series"
#---------------------------------------------------------------#
# EK Loop Connect - DetectEKControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5750", TAG+="uaccess", TAG+="EK_Loop_Connect"
#---------------------------------------------------------------#
# Coolermaster Mouse Pad - DetectCoolerMasterMousemats
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0109", TAG+="uaccess", TAG+="Cooler_Master_MP750_XL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0107", TAG+="uaccess", TAG+="Cooler_Master_MP750_Large"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0105", TAG+="uaccess", TAG+="Cooler_Master_MP750_Medium"
#---------------------------------------------------------------#
# Coolermaster Master Mouse - DetectCoolerMasterMouse
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0065", TAG+="uaccess", TAG+="Cooler_Master_MM530"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0101", TAG+="uaccess", TAG+="Cooler_Master_MM711"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0141", TAG+="uaccess", TAG+="Cooler_Master_MM720"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0109", TAG+="uaccess", TAG+="Cooler_Master_MP750_XL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0107", TAG+="uaccess", TAG+="Cooler_Master_MP750_Large"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0105", TAG+="uaccess", TAG+="Cooler_Master_MP750_Medium"
#---------------------------------------------------------------#
# AMD Radeon 6000 - DetectCoolerMasterGPU
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="014d", TAG+="uaccess", TAG+="Cooler_Master_Radeon_6000_GPU"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="015b", TAG+="uaccess", TAG+="Cooler_Master_Radeon_6900_GPU"
#---------------------------------------------------------------#
# Coolermaster RGB - DetectCoolerMasterRGB
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="004f", TAG+="uaccess", TAG+="Cooler_Master_RGB"
#---------------------------------------------------------------#
# Coolermaster Master Mouse - DetectCoolerMasterMouse
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0065", TAG+="uaccess", TAG+="Cooler_Master_MM530"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0101", TAG+="uaccess", TAG+="Cooler_Master_MM711"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0141", TAG+="uaccess", TAG+="Cooler_Master_MM720"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0109", TAG+="uaccess", TAG+="Cooler_Master_MP750_XL"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0107", TAG+="uaccess", TAG+="Cooler_Master_MP750_Large"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0105", TAG+="uaccess", TAG+="Cooler_Master_MP750_Medium"
#---------------------------------------------------------------#
# Coolermaster Small ARGB - DetectCoolerMasterSmallARGB
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="1000", TAG+="uaccess", TAG+="Cooler_Master_Small_ARGB"
#---------------------------------------------------------------#
# Coolermaster ARGB - DetectCoolerMasterARGB
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="1011", TAG+="uaccess", TAG+="Cooler_Master_ARGB"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0173", TAG+="uaccess", TAG+="Cooler_Master_ARGB_Gen_2_A1"
#---------------------------------------------------------------#
# Coolermaster Masterkeys Keyboards - DetectCoolerMasterKeyboards
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="003b", TAG+="uaccess", TAG+="Cooler_Master_MasterKeys_Pro_L"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0047", TAG+="uaccess", TAG+="Cooler_Master_MasterKeys_Pro_L_White"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="003c", TAG+="uaccess", TAG+="Cooler_Master_MasterKeys_Pro_S"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0067", TAG+="uaccess", TAG+="Cooler_Master_MK570"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0089", TAG+="uaccess", TAG+="Cooler_Master_SK630"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="008d", TAG+="uaccess", TAG+="Cooler_Master_SK650"
#---------------------------------------------------------------#
# Coolermaster ARGB A1 - DetectCoolerMasterARGBGen2A1
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0173", TAG+="uaccess", TAG+="Cooler_Master_ARGB_Gen_2_A1"
#---------------------------------------------------------------#
# EVGA USB Keyboard - DetectEVGAKeyboardControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3842", ATTRS{idProduct}=="260e", TAG+="uaccess", TAG+="EVGA_Z15_Keyboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3842", ATTRS{idProduct}=="2608", TAG+="uaccess", TAG+="EVGA_Z15_Keyboard"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="3842", ATTRS{idProduct}=="260a", TAG+="uaccess", TAG+="EVGA_Z20_Keyboard"
#---------------------------------------------------------------#
# MSI Mystic Light (162 Byte) - DetectMSIMysticLightControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="1720", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS1720"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b12", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B12"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b16", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B16"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b17", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B17"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b18", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B18"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b50", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B50"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b85", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B85"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b93", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B93"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c34", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C34"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c35", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C35"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c36", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C36"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c37", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C37"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c56", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C56"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c59", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C59"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c67", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C67"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c71", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C71"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c73", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C73"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c75", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C75"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c76", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C76"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c79", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C79"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c80", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C80"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c81", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C81"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c83", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C83"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c84", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C84"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c86", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C86"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c90", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C90"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c91", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C91"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c92", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C92"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c94", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C94"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c95", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C95"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c98", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C98"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d06", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D06"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d07", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D07"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d08", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D08"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d09", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D09"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d13", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D13"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d15", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D15"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d17", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D17"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d18", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D18"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d20", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D20"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d25", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D25"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d27", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D27"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d28", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D28"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d29", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D29"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d30", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D30"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d31", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D31"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d32", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D32"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d42", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D42"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d50", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D50"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d51", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D51"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d52", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D52"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d53", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D53"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d54", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D54"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d59", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D59"
#---------------------------------------------------------------#
# MSI Mystic Light (185 Byte) - DetectMSIMysticLightControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="1720", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS1720"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b12", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B12"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b16", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B16"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b17", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B17"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b18", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B18"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b50", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B50"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b85", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B85"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7b93", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7B93"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c34", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C34"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c35", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C35"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c36", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C36"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c37", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C37"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c56", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C56"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c59", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C59"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c67", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C67"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c71", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C71"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c73", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C73"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c75", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C75"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c76", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C76"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c79", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C79"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c80", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C80"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c81", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C81"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c83", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C83"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c84", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C84"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c86", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C86"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c90", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C90"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c91", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C91"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c92", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C92"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c94", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C94"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c95", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C95"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7c98", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7C98"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d06", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D06"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d07", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D07"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d08", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D08"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d09", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D09"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d13", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D13"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d15", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D15"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d17", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D17"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d18", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D18"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d20", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D20"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d25", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D25"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d27", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D27"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d28", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D28"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d29", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D29"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d30", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D30"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d31", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D31"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d32", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D32"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d42", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D42"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d50", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D50"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d51", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D51"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d52", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D52"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d53", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D53"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d54", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D54"
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1462", ATTRS{idProduct}=="7d59", TAG+="uaccess", TAG+="MSI_Mystic_Light_MS7D59"
#---------------------------------------------------------------#
# Dygma Raise Keyboard - DetectDygmaRaiseControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="serial|hidraw", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="2201", TAG+="uaccess", TAG+="Dygma_Raise"
#---------------------------------------------------------------#
# Cougar 700K Evo Keyboard - DetectCougar700kEvo
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="060b", ATTRS{idProduct}=="7010", TAG+="uaccess", TAG+="Cougar_700K_EVO_Gaming_Keyboard"
#---------------------------------------------------------------#
# Cougar Revenger ST - DetectCougarRevengerSTControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="12cf", ATTRS{idProduct}=="0412", TAG+="uaccess", TAG+="Cougar_Revenger_ST"
#---------------------------------------------------------------#
# Thermaltake PoseidonZ - DetectPoseidonZRGBControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="264a", ATTRS{idProduct}=="3006", TAG+="uaccess", TAG+="Thermaltake_Poseidon_Z_RGB"
#---------------------------------------------------------------#
# NZXT Hue+ - DetectNZXTHuePlusControllers
#---------------------------------------------------------------#
SUBSYSTEMS=="serial|hidraw", ATTRS{idVendor}=="04d8", ATTRS{idProduct}=="00df", TAG+="uaccess", TAG+="NZXT_Hue"
'';
in {
	options.main.rgb = with util-lib; {
		openrgb = mkOptIn "Install openrgb."; # https://discourse.nixos.org/t/guide-to-setup-openrgb-on-nixos/9093
	};
	config = util-lib.mkMerge [
		{
			_condition = cfg.openrgb;
			environment.systemPackages = with pkgs; [openrgb];
			boot.kernelModules = ["i2c-dev" "i2c-piix4"];
			services.udev.extraRules = openrgb-rules;
		}
	];
}
