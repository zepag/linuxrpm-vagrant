#!/bin/bash
vagrant package --output dockerbox.box
mkdir -p dockerbox/
tar xvzf dockerbox.box -C dockerbox/
rm -f dockerbox.box
TIMESTAMP="$(date +'%Y%m%d-%H%M%S')"
tar cvzf dockerbox-${TIMESTAMP}.tar.gz dockerbox/box* && rm -fR dockerbox/
