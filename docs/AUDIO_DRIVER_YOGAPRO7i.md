
### To install 

- `sof-firmware`
- `alsa-ucm-conf`

### Create or modify `/etc/modprobe.d/alsa-yoga.conf`

```plaintext
options snd_sof_intel_hda_generic hda_model=alc287-yoga9-bass-spk-pin
```

and reboot...
