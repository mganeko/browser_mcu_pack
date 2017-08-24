#!/bin/sh

# with remote host debug
docker run -d -p 9222:9222 -p 3000:3000 --cap-add=SYS_ADMIN mganeko/browser_mcu_pack

# without remote host debug
#docker run -d -p 3000:3000 --cap-add=SYS_ADMIN mganeko/browser_mcu_pack



