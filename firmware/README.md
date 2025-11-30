# Firmware

We're using an app to control the Color LED decks based on the Crazyflie's 3D position.


Clone the [crazyflie-firmware](https://github.com/bitcraze/crazyflie-firmware) repository and add the [app_christmas_led](/firmware/app_christmas_led/) folder in [crazyflie-firmware/examples](https://github.com/bitcraze/crazyflie-firmware/tree/master/examples/). Then navigate to the app's folder:
```
cd examples/app_christmas_led
```
For building and flashing the firmware to a swarm of Crazyflies, modify and run the [cload-all.sh](/firmware/app_christmas_led/cload-all.sh).

## Configure the firmware

Based on your platform, use its default configuration by running the following command:

#### Crazyflie 2.0, Crazyflie 2.1(+)
```
make cf2_defconfig
```
#### Crazyflie 2.1 Brushless
```
make cf21bl_defconfig
```
#### Crazyflie Bolt
```
make bolt_defconfig
```

## Build the firmware
Build the firmware on Linux by running this command:
```
make -j$(nproc)
```

## Flash the firmware

#### Manually entering bootloader mode

* Turn the Crazyflie off
* Start the Crazyflie in bootloader mode by pressing the power button for 3 seconds. Both the blue LEDs will blink.
* In your terminal, run
```
make cload
```

#### Automatically enter bootloader mode
* Make sure the Crazyflie is on
* In your terminal, run `CLOAD_CMDS="-w [CRAZYFLIE_URI]" make cload`
* or run `cfloader flash build/[BINARY_FILE] stm32-fw -w [CRAZYFLIE_URI]`
with [BINARY_FILE] being the binary file (**cf2.bin** for Crazyflie 2.x, **cf21bl.bin** for Crazyflie 2.1 Brushless etc.) and [CRAZYFLIE_URI] being the uri of the Crazyflie.


## Test the app
After flasing the firmware to the Crazyflie and connecting to `cfclient`, the debug prints should appear in the Console tab.

```
SYS: Crazyflie 2.1 Brushless is up and running!
SYS: Build 76:b19bd8e304d8 (2025.09.1 +76) MODIFIED
SYS: I am 0x3736343230345115004D0043 and I have 1024KB of flash!
CFGBLK: v1, verification [OK]
DECK_DISCOVERY: Backend found: onewire
DECK_DISCOVERY: Backend found: deckctrl
DECK_CORE: 0 deck(s) found
IMU: BMI088: Using I2C interface.
IMU: BMI088 Gyro connection [OK].
IMU: BMI088 Accel connection [OK]
IMU: BMP390 I2C connection [OK]
ESTIMATOR: Using Complementary (1) estimator
CONTROLLER: Using PID (1) controller
MTR-DRV: Using brushless motor driver
SYS: About to run tests in system.c.
SYS: NRF51 version: 2025.02 (C21B)
EEPROM: I2C connection [OK].
STORAGE: Storage check [OK].
IMU: BMI088 gyro self-test [OK]
SYS: Self test passed!
STAB: Wait for sensor calibration...
SYS: Free heap: 17936 bytes
Starting Christmas LED sphere app...
Generating 4 spheres with offset=45.0 deg for trajectory (height=2.0, radius=0.40)
Generating 8 spheres with offset=22.500 deg for trajectory (height=1.50, radius=0.80)
Generating 12 spheres with offset=45.0 deg for trajectory (height=1.0, radius=1.20)
Generating 16 spheres with offset=22.500 deg for trajectory (height=0.50, radius=1.60)
Total spheres created: 40
STAB: Starting stabilizer loop
```
