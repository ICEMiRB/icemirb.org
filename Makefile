.PHONY: github

clean:
	echo

html:
	cd site && hugo
	echo "icemirb.org" > site/public/CNAME
	touch site/public/.nojekyll

github: | clean html
	./push_dir_to_repo.py \
	  --branch master \
	  --email web@icemirb.org \
	  --committer "ICEMiRB Web Bot" \
	  --message "Update website" \
	  --force \
	     ./site/public git@github.com:icemirb/icemirb.github.io
