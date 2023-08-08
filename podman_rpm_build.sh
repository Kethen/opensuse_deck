podman run \
	-it --rm \
	-v ./:/workdir \
	-w /workdir \
	tumbleweed \
	bash -c '

cp /workdir/rpmmacros ~/.rpmmacros
rpmbuild -bb deck-adaptation-for-opensuse.spec
'
