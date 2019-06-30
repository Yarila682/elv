VROOT=`cat ${HOME}/.vlang/VROOT`

all: clean elv

elv:
	${VROOT}/v -o elv src/main.v
	./elv

clean:
	-rm -f elv
