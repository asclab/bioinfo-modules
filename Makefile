all:
	find . -name setup.sh -exec ./basesetup.sh \{\} \;

clean:
	rm -rf */*/bin
	rm -rf */*/build
	rm -rf */*/lib
	rm -rf */*/man
	rm -rf */*/share
	rm -rf ngs-bundle/{bin,build,man}
	rm -rf modulefiles/*
