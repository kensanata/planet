.PHONY: both osr indie rpg test rpg-files

both: osr indie

osr:
	/usr/bin/python2 ~/src/venus/planet.py -x osr.ini

indie:
	/usr/bin/python2 ~/src/venus/planet.py -x indie.ini

# do not expunge this one (this one is just added to the other two)
other:
	/usr/bin/python2 ~/src/venus/planet.py other.ini

# before we run this one, merge the other data files, and opml files
rpg: rpg-files
	~/planet/opml-merge ~/planet/indie.opml ~/planet/osr.opml ~/planet/other.opml > ~/planet/rpg.opml
	/usr/bin/python2 ~/src/venus/planet.py -x -o ~/planet/rpg.ini

rpg-files:
	/bin/cp --recursive --no-clobber --link ~/planet/osr/* ~/planet/indie/* ~/planet/rpg

test:
	python2 ~/src/venus/planet.py test.ini
