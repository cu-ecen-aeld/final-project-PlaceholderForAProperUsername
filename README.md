# Project Overview

## Overview
---
In this project, a simple heart rate monitor will be implemented. A MAX30101 sensor 
will be used to measure the heart rate. The result will be displayed on a common
16x2 LCD.

![Block Diagram](block_diagram.jpg)
## Target Build System
---
Yocto

## Hardware Platform
---
Raspberry Pi 4

## Open Source Projects Used
---
N/A

## Previously Discussed Content
---
N/A

## New Content
---
Drivers for the MAX30101 sensor to measure the heart rate and for the 16x2 LCD
to display the data. 
A daemon to frequently get the measurement data and forward it to 16x2 LCD.

## Shared Material
---

## Source Code Organization
---
