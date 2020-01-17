test:
	@for f in *.json; do \
	  echo $$f; cat $$f \
	  | jq '.' \
	  | grep code | sed 's/,$$//' \
	  | sort \
	  | uniq -c; \
	done
