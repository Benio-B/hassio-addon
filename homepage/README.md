# Homepage

### Run
During the first run, all config files will be created in `/addon_configs/d68a9646_homepage`.
You can create a symlink to `/config/addons_config` with `ln -s /addon_configs/d68a9646_homepage /config/addons_config/homepage`

### Configuration
You can change the port number. By default, homepage is available on port 3030.
You need to allow some hosts:
  - You can use `*` to allow any hosts (not recommended)
  - Use a comma-separated list with port: 192.168.1.67:3030,localhost,homepage.example.com

All config files are stored in `/addon_configs/xxxx-homepage` and can be updated here. If the addon is uninstalled, the files are retained; don't forget to delete them if necessary.

### More info 
- About Homepage [here](https://gethomepage.dev)
- About others addons [here](https://github.com/Benio-B/hassio-addon)
