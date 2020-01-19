test:
	@for f in *.json; do \
	  echo $$f; cat $$f \
	  | jq '.' \
	  | grep code | sed 's/,$$//' \
	  | sort \
	  | uniq -c; \
	done

clean:
	rm -rf osr osr.json indie indie.json rpg rpg.json
