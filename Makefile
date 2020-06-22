.PHONY: update

update:
	git submodule update --recursive --checkout --remote --jobs 8
