.PHONY: osr indie

osr:
	~/bin/planet-osr

indie:
	~/bin/planet-indie

.PHONY: test
test:
	python2 ~/src/venus/planet.py test.ini

