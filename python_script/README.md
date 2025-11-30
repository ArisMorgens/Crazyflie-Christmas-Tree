# Python Script

This Python script commands a swarm of Crazyflies to perform a coordinated spiral choreography resembling a Christmas tree outline in 3D space.
Each drone takes off to a different height, flies in spiraling circular layers, and changes radius as it rises and descends, forming the visual structure of a cone when viewed from outside.
Designed to be used together with the [app_christmas_led](/firmware/app_christmas_led/).

## How it works

- Connects to multiple Crazyflies simultaneously using cflib’s high-level commander.

- Assigns each drone a unique starting height, starting x position (radius), starting yaw orientation and rotation direction (CW/CCW).

- Commands the full swarm to:
    - Arm and takeoff
    - Move to its spiral starting position
    - Fly circular and semi-circular tracks while ascending/descending
    - Land

Here's how the first circle looks like:
![Trajectories](/media/ChristmasTreeTrajectories.png)