test:
	(for f in *.json; do cat $f | jq '.'; done) | grep message | sort | uniq -c
