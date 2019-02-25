.PHONY: both osr indie rpg test rpg-files

both: osr indie

osr:
	~/bin/planet-osr

indie:
	~/bin/planet-indie

rpg: rpg-files
	~/planet/opml-merge ~/planet/indie.opml ~/planet/osr.opml > ~/planet/rpg.opml
	/usr/bin/python2 ~/src/venus/planet.py -x -o ~/planet/rpg.ini

rpg-files:
	/bin/cp --recursive --no-clobber --link ~/planet/osr/* ~/planet/indie/* ~/planet/rpg

test:
	python2 ~/src/venus/planet.py test.ini
