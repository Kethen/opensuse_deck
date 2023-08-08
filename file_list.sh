cd overlay
find * | while read -r LINE; do if ! [ -d $LINE ]; then echo -n "/"; echo "$LINE"; fi; done
