#!/bin/bash

if [ $(find /home/lede/source -maxdepth 0 -type d -empty 2>/dev/null) ]; then
	echo cloning repository
	sudo chown lede:lede /home/lede/source
	git clone https://git.lede-project.org/source.git /home/lede/source
	cd /home/lede/source
	git fetch --tags
	git checkout v17.01.3
	./scripts/feeds update -a
	./scripts/feeds install -a
fi

echo done
exec $@
