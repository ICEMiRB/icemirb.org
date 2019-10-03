.PHONY: github

html:
	cd site && hugo
	echo "icemirb.org" > site/public/CNAME
	touch site/public/.nojekyll

clean:
	rm -rf site/public

serve:
	@cd site && hugo --i18n-warnings server -D

github: | clean html
	./push_dir_to_repo.py \
	  --branch master \
	  --email web@icemirb.org \
	  --committer "ICEMiRB Web Bot" \
	  --message "Update website" \
	  --force \
	     ./site/public git@github.com:ICEMiRB/icemirb.github.io.git
