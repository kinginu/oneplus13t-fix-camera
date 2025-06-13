# OnePlus 13T Camera Fix for OxygenOS 15

A module to fix camera functionality and correct battery capacity for the OnePlus 13T after updating to or converting to OxygenOS 15.

<a href="https://www.buymeacoffee.com/kinginu" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 220px !important;" ></a>

## What This Module Does
This module resolves camera and battery capacity issues on a OnePlus 13T running OxygenOS. It works by replacing the odm.img from the flashed OxygenOS firmware with the odm.img from the original ColorOS firmware. This will corrects the hardware mismatches that cause the camera and battery reporting problems.


## What Works
After applying this fix, the following functionality should be restored or corrected:

- Correct battery capacity reporting in system settings.
- Main Camera (Photo & Video)
- Front Camera (Photo & Video)

## What Doesn't Work
At present, no major functions are known to be broken by this fix.
Please report any discovered issues.

## Important Notes
- Prerequisites: You will likely need an unlocked bootloader and root access (e.g., Magisk) to apply this fix.
- Signal/Network Issues: To fix any cellular network problems after conversion, you will need the "Fix Signal Oneplus 13T" patch available at this XDA Forums thread: https://xdaforums.com/t/rom-pkx110-oxygenos-convert-oneplus-13t-to-13s.4743853/