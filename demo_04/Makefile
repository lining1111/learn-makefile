.PHONY:all clean

export BUILD_ROOT = $(shell pwd)

all:
	make -C src/a_dir
	make -C src/b_dir
	make -C src/c_dir
	make -C app

clean:
	make -C src/a_dir clean
	make -C src/b_dir clean
	make -C src/c_dir clean
	make -C app clean
