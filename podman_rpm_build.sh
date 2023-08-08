podman run \
	-it --rm \
	-v ./:/workdir \
	-w /workdir \
	tumbleweed \
	bash -c '

zypper -n install rpm-build

cp /workdir/rpmmacros ~/.rpmmacros
rpmbuild -bb deck-adaptation-for-opensuse.spec
'
