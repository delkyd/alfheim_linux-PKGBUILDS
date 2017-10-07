#!/bin/bash
firejail --profile=/etc/firejail/chromium.profile '/opt/ungoogled-chromium-bundle/chrome' --no-sandbox --proxy-server="socks5://localhost:9050" --host-resolver-rules="MAP * 0.0.0.0, EXCLUDE localhost, EXCLUDE *.local"