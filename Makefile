all:
	find . -name 'setup.sh' -exec \{\} \;

clean:
	rm -rf */*/{bin,build,man}
	rm -rf modulefiles/*
