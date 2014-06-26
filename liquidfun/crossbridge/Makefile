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

# FlashCC SDK root
$?FLASCC:=$(FLASCC_ROOT)/sdk

# C/C++ Compiler arguments
# 1. Remove all warning suppression
# 2. Adds additional warnings
# 3. Maximum optimization
# 4. Java virtual machine arguments
# Optional
# Debug: -O0 -g
$?CCOMPARGS:=-Wall -Wextra -O4 -jvmopt=-Xmx1G

# ActionScript 3.0 Compiler for AVM+ arguments
# 1. Merge the compiled source into a single output file
# 2. Emit metadata information into the bytecode
# 3. Warn on common actionscript mistakes
# 4. Produce an optimized ABC file
# 5. Turn on the inlining of functions
$?ASC2ARGS=-merge -md -warnings -optimize -inline

# SWIG Pre-Processor arguments
# 1. Remove all warning suppression, also implies -Wextra 
# 2. Adds the following additional warnings: 202,309,403,512,321,322 
# 3. Enable the optimization options: -fastdispatch -fvirtual  
# 4. Generate AS3 wrappers 
# 5. Enable C++ processing 
# 6. Follow all #include statements
# 7. Ignore missing include files
# Optional
# Compile in compact mode: -fcompact 
$?SWIGARGS:=-Wall -Wextra -O -as3 -c++ -includeall -ignoremissing

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
	########################################
	# Initializing ...
	########################################
	mkdir -p build
	mkdir -p ./../Box2D/Box2D/Dynamics/Controllers/
	cp -r ./../Contributions/Enhancements/Controllers/* ./../Box2D/Box2D/Dynamics/Controllers/
	########################################
	# Making LiquidFun ...
	########################################
	cd build && PATH="$(call unixpath,$(FLASCC)/usr/bin):$(PATH)" CC=gcc CXX=g++ CFLAGS="$(CCOMPARGS)" CXXFLAGS="$(CCOMPARGS)" cmake ./../../Box2D/ -DBOX2D_BUILD_EXAMPLES=OFF -DBOX2D_BUILD_UNITTESTS=OFF
	########################################
	# Building LiquidFun ...
	########################################
	cd build && make -j8
	########################################
	# Generating CXX ...
	########################################
	cd build && "$(FLASCC)/usr/bin/swig" $(SWIGARGS) -package org.liquidfun -I$(PWD)/src/main/swig -I$(PWD)/../Box2D -module LiquidFun -outdir . -o $(PWD)/build/LiquidFun_wrap.cxx $(PWD)/src/main/swig/LiquidFun.i
	########################################
	# Generating ABC ...
	########################################
	cd build && java -jar $(call nativepath,$(FLASCC)/usr/lib/asc2.jar) $(ASC2ARGS) -import $(call nativepath,$(FLASCC)/usr/lib/builtin.abc) -import $(call nativepath,$(FLASCC)/usr/lib/playerglobal.abc) LiquidFun.as
	########################################
	# Generating O ...
	########################################
	cp -f src/main/templates/exports.txt build/ 
	"$(FLASCC)/usr/bin/g++" $(CCOMPARGS) -I./../Box2D -c build/LiquidFun_wrap.cxx -o build/LiquidFun_wrap.o
	########################################
	# Generating Exports ...
	########################################
	"$(FLASCC)/usr/bin/nm" build/LiquidFun_wrap.o | grep ' T ' | sed 's/.*__/_/' | sed 's/.* T //' >> build/exports.txt
	########################################
	# Generating SWC ...
	########################################
	cd build && "$(FLASCC)/usr/bin/g++" $(CCOMPARGS) -flto-api=exports.txt -I./../../Box2D/ LiquidFun.abc LiquidFun_wrap.cxx Box2D/Release/libLiquidFun.a -emit-swc=org.liquidfun.core -o ../LiquidFun.swc -lAS3++ -lFlash++ 
	########################################
	# Post cleaning ...
	########################################
	rm -rf ../Box2D/Box2D/Dynamics/Controllers/
    
clean:
	rm -rf build
	rm -f LiquidFun.swc