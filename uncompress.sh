#!/bin/sh
#uncompress beta

case $1 in
	zip | .zip)
		unzip $2
		;;
	tar | .tar)
		tar -xf $2
		;;
	targz | tar.gz | .tar.gz)
		tar -xzf $2
		;;
	tarbz2 | tar.bz2 | .tar.bz2)
		tar -xjf $2
		;;
	tarxz | tar.xz | .tar.xz)
		tar -xJf $2
		;;
	*)
		echo unknown archive type
		;;
esac
