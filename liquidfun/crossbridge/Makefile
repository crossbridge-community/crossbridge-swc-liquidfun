# Purpose: FlasCC library makefile
# Author: Andras Csizmadia
# Version: 1.0.0
# Platform: Windows
# Runtime: Cygwin with FlasCC

# FlashCC SDK root
FLASCC:=$(FLASCC_ROOT)/sdk

# ASC2 Compiler arguments
$?AS3COMPILERARGS=java $(JVMARGS) -jar $(call nativepath,$(FLASCC)/usr/lib/asc2.jar) -merge -md

# C/C++ Compiler arguments
# Debug: -O0 -g
CCOMPARGS:=-Wall -Wextra -Wno-write-strings -Wno-trigraphs -O4 -jvmopt=-Xmx1G

# Path helper
$?UNAME=$(shell uname -s)
ifneq (,$(findstring CYGWIN,$(UNAME)))
	$?nativepath=$(shell cygpath -at mixed $(1))
	$?unixpath=$(shell cygpath -at unix $(1))
else
	$?nativepath=$(abspath $(1))
	$?unixpath=$(abspath $(1))
endif

compile:
	@echo "------- crossbridge.LiquidFun :: compile --------"
	# Create build folder
	mkdir -p build
	# Run CMake on Box2D
	cd build && PATH="$(call unixpath,$(FLASCC)/usr/bin):$(PATH)" CC=gcc CXX=g++ CFLAGS="$(CCOMPARGS)" CXXFLAGS="$(CCOMPARGS)" cmake ../../Box2D/ -DBOX2D_BUILD_EXAMPLES=OFF -DBOX2D_BUILD_UNITTESTS=OFF
	# Run Make on Box2D
	cd build && make -j8
	# Generate the SWIG wrappers (Filter non-major warnings -w201,302,401,501,502)
	cd build && "$(FLASCC)/usr/bin/swig" -Wextra -as3 -c++ -I../../Box2D/ -I../src/main/swig -module LiquidFun -outdir . -includeall -ignoremissing -o ./LiquidFun_wrap.cxx ../src/main/swig/LiquidFun.i &> LiquidFun-swig.log
	# Compile the SWIG AS3 wrappers
	cd build && $(AS3COMPILERARGS) -import $(call nativepath,$(FLASCC)/usr/lib/builtin.abc) -import $(call nativepath,$(FLASCC)/usr/lib/playerglobal.abc) LiquidFun.as
	# Generate exports
	cp -f src/main/templates/exports.txt build/ 
	"$(FLASCC)/usr/bin/g++" $(CCOMPARGS) -I../Box2D/ -c build/LiquidFun_wrap.cxx -o build/LiquidFun_wrap.o
	"$(FLASCC)/usr/bin/nm" build/LiquidFun_wrap.o | grep ' T ' | sed 's/.*__/_/' | sed 's/.* T //' >> build/exports.txt
	# Compile the SWIG C++ wrappers
	cd build && "$(FLASCC)/usr/bin/g++" $(CCOMPARGS) -flto-api=exports.txt -I../../Box2D/ LiquidFun.abc LiquidFun_wrap.cxx Box2D/Release/libLiquidFun.a -lFlash++ -lAS3++ -emit-swc=crossbridge.liquidfun -o ../LiquidFun.swc

clean:
	rm -rf build
	rm -f LiquidFun.swc