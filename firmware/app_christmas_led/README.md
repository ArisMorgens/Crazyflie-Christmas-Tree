# Crazyflie Christmas Tree App

This firmware implements a light-show effect for a Crazyflie platform equipped with a Color LED deck.
Instead of lighting LEDs based on time or commands, this app lights the drone based on its 3D position: the Crazyflie flies through a set of virtual spheres, switching color depending on whether it is inside one or not.

The result is a positional light choreography forming a Christmas tree with ornaments.  


## How it works

When this firmware app runs:

- It generates four layers of spherical zones, arranged in rings of increasing radius as the height decreases (like ornaments on a Christmas tree).

- On each control loop (100Hz), the Crazyflie reads its estimated position (x, y, z) and vertical velocity (vz) from the estimator.

- The LED color is set according to position: It shines red when the Crazyflie is inside one of the defined spheres and green otherwise.

- The effect activates when the Crazyflie first passes near `y = Y0`, where `Y0` represents the centerline of the Christmas tree along the Y-axis.

- If the vertical velocity gets below `-0.6 m/s`, the effect gets blocked and the LED is turned off but if it gets above `+0.6 m/s`, it is unblocked and the LED is turned on again.
