#
#=BEGIN MIT LICENSE
#
# Copyright (c) 2014 Andras Csizmadia
# http://www.vpmedia.hu
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
#=END MIT LICENSE
#

# Purpose: FlasCC library makefile
# Author: Andras Csizmadia
# Version: 1.0.0
# Platform: Windows
# Runtime: Cygwin with FlasCC

# @see: http://www.adobe.com/devnet-docs/flascc/README.html

# FlashCC SDK root
FLASCC:=$(FLASCC_ROOT)/sdk

# ASC2 Compiler arguments
$?AS3COMPILERARGS=java $(JVMARGS) -jar $(call nativepath,$(FLASCC)/usr/lib/asc2.jar) -merge -md

# C/C++ Compiler arguments
# Debug: -O0 -g
CCOMPARGS:=-Wall -Wextra -Wno-write-strings -Wno-trigraphs -O4 -jvmopt=-Xmx1G -DSWIGFL=ON

# Path helper
$?UNAME=$(shell uname -s)
ifneq (,$(findstring CYGWIN,$(UNAME)))
	$?nativepath=$(shell cygpath -at mixed $(1))
	$?unixpath=$(shell cygpath -at unix $(1))
else
	$?nativepath=$(abspath $(1))
	$?unixpath=$(abspath $(1))
endif

init:
	@echo "------- crossbridge.LiquidFun :: init --------"
	mkdir -p build
	cd build && PATH="$(call unixpath,$(FLASCC)/usr/bin):$(PATH)" CC=gcc CXX=g++ CFLAGS="$(CCOMPARGS)" CXXFLAGS="$(CCOMPARGS)" cmake ../../Box2D/ -DBOX2D_BUILD_EXAMPLES=OFF -DBOX2D_BUILD_UNITTESTS=OFF
	make compile

compile:
	@echo "------- crossbridge.LiquidFun :: compile --------"
	cd build && PATH="$(call unixpath,$(FLASCC)/usr/bin):$(PATH)" make -j8
	cp -f src/main/swig/swig.i build/
	make package

package:
	@echo "------- crossbridge.LiquidFun :: package --------"
	# Generate the SWIG wrappers
    # Optional: Filter non-major warnings -w201,302,401,501,502
	cd build && "$(FLASCC)/usr/bin/swig" -DSWIGFL=ON -Wextra -as3 -c++ -I../../Box2D/ -I../src/main/swig -module LiquidFun -outdir . -includeall -ignoremissing swig.i &> swig.log
	# Compile the SWIG AS3 wrappers
	cd build && $(AS3COMPILERARGS) -import $(call nativepath,$(FLASCC)/usr/lib/builtin.abc) -import $(call nativepath,$(FLASCC)/usr/lib/playerglobal.abc) LiquidFun.as
	# Compile the SWIG C++ wrappers
	cd build && "$(FLASCC)/usr/bin/g++" $(CCOMPARGS) -I../../Box2D/ LiquidFun.abc swig_wrap.cxx Box2D/Release/libLiquidFun.a -emit-swc=crossbridge.liquidfun -o ../LiquidFun.swc

clean:
	rm -rf build
	rm -f *.swf *.swc *.abc