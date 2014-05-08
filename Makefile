all:
	find . -name setup.sh -exec ./basesetup.sh \{\} \;

clean:
	rm -rf */*/bin
	rm -rf */*/build
	rm -rf */*/man
	rm -rf modulefiles/*
