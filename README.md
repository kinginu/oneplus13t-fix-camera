# OnePlus 13T Camera Fix for OxygenOS

A module to fix camera functionality and correct battery capacity for the OnePlus 13T after converting to OxygenOS.

<a href="https://www.buymeacoffee.com/kinginu" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 220px !important;" ></a>

## What This Module Does
This module resolves camera and battery capacity issues on a OnePlus 13T running OxygenOS. It works by replacing the odm.img from the flashed OxygenOS firmware with the odm.img from the original ColorOS firmware. This will corrects the hardware mismatches that cause the camera and battery reporting problems.

## Help Us Improve
Some users have reported that this module works perfectly, while others are experiencing issues.  
To help us identify what causes the module to fail on certain setups, **please submit a report** whether it works for you or not.

[Submit a Compatibility Report](https://github.com/kinginu/oneplus13t-fix-camera/issues/new?template=report-template.yml)

The more reports we receive, the easier it will be to improve this fix for everyone.  
**Thank you for contributing!**

## What Works
After applying this fix, the following functionality should be restored or corrected:

- Correct battery capacity reporting in system settings.
- Main Camera (Photo & Video)
- Front Camera (Photo & Video)

## What Doesn't Work
At present, no major functions are known to be broken by this fix.
Please report any discovered issues.

## Known Issue: Photos Turn Black After Capture (KernelSU / APatch)
If a captured photo looks fine for about a second and then fades to pure black — while **Pro mode, video recording, and third-party camera apps work normally** — your root manager is hiding this module's files from the camera app.

KernelSU and APatch unmount module files for apps that are not granted root (the "Umount modules" feature). The camera app's multi-frame post-processing then reads the original OxygenOS files instead of the ones provided by this module, fails, and saves a black image.

**Fix (no root grant needed):**
1. Open the KernelSU / APatch manager app.
2. Find the camera app (`com.oplus.camera`) in the app list and open its App Profile.
3. Uncheck **Umount modules** and save.
4. Restart the camera app (or reboot).

If the gallery shows the same behavior, repeat the steps for the Photos/Gallery app.
Granting root to the camera app also works, but disabling "Umount modules" alone is the safer option.

## Important Notes
- Prerequisites: You will likely need an unlocked bootloader and root access (e.g., Magisk, KernelSU) to apply this fix.
- Signal/Network Issues: To fix any cellular network problems after conversion, you will need the "Fix Signal Oneplus 13T" patch available at this XDA Forums thread: https://xdaforums.com/t/rom-pkx110-oxygenos-convert-oneplus-13t-to-13s.4743853/
