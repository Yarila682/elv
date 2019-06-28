all: clean elv

elv:
	~/v/compiler/v -o elv src/main.v
	./elv

clean:
	-rm -f elv
