## CPH2723_16.0.9.401-r2 (2026-08-20)

* Stop masking the stock esim HAL with the eid binary. The bind mount came from /data (nosuid), so init could never exec it (nosuid_transition denial) and vendor.oplus.hardware.esim@1.0-service was stuck in a crash loop. The stock esim binary and its ndk library both exist on /odm and run fine; the working IOplusEsim HAL is also required for the eSIM management flow in Settings (see https://github.com/kinginu/oneplus13t-esim).

## CPH2723_16.0.9.401 (2026-08-05)

* Update ODM blobs from COS: PKX110_16.0.9.401

## CPH2723_16.0.8.301-r2 (2026-07-27)

* Fix permission setup in post-fs-data.sh (set_perm_recursive is unavailable in boot scripts; permissions are now set explicitly)
* Restore execute permission and the original SELinux context for the eid service binary mounted over the esim service
* Document the KernelSU/APatch "Umount modules" workaround for photos turning black after capture (README & issue template)

## CPH2723_16.0.8.301 (2026-06-30)

* Update ODM blobs from COS: PKX110_16.0.8.300

## CPH2723_16.0.7.200 (2026-06-02)

* Update ODM blobs from COS: PKX110_16.0.7.200

## CPH2723_16.0.5.700 (2026-03-18)

* Update ODM blobs from COS: PKX110_16.0.5.701

## CPH2723_16.0.3.501 (2026-01-19)

* Update ODM blobs from COS: PKX_110_16.0.3.501

## CPH2723_16.0.2.400 (2025-12-22)

* Update ODM blobs from COS: PKX110_16.0.2.400

## v1.1.1 (2025-11-18)

Source: PKX110_16.0.1.301

## v1.1.0 (2025-11-10)

* update to OOS16

## v1.0.9 (2025-08-14)

* fix workflow

## v1.0.8 (2025-08-14)

* updated odm files from COS 15.0.0.500

## 1.0.7 (2025-08-03)

- Mount `/odm/bin/hw/vendor.oplus.hardware.eid@1.0-service` to `/odm/bin/hw/vendor.oplus.hardware.esim@1.0-service` to fix the unlinked executable.