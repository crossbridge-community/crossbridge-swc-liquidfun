crossbridge-swc-liquidfun
=========================

[![Build Status](https://travis-ci.org/crossbridge-community/liquidfun.svg?branch=master)](https://travis-ci.org/crossbridge-community/liquidfun)

## Getting Started

### Tooling Version Requirements

Following are the minimum required versions for the tools and libraries you
need for building LiquidFun for Flash:

* CrossBridge SDK: http://sourceforge.net/projects/crossbridge-community/files/
* Adobe AIR SDK: http://www.adobe.com/devnet/air/air-sdk-download.html
* Apache Flex SDK: https://flex.apache.org/installer.html
* Apache Ant: https://ant.apache.org/bindownload.cgi
* JDK: http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html

### Env. Variable Requirements

In order to get the build scripts working, set the following environment variables (style is important):

* FLASCC_ROOT=\SDK_DIR\adobe-crossbridge\
* FLASCC_AIR_ROOT=/cygdrive/c/SDK_DIR/adobe-air/
* FLASCC_GDB_RUNTIME=/cygdrive/c/SDK_DIR/flashplayer.exe
* AIR_HOME=\SDK_DIR\adobe-air\
* FLEX_HOME=\SDK_DIR\apache-flex\

## Assembling

#### Flash SWC Library 

    >build.bat

#### Example SWF + Unit Test + Documentation

    >ant -f assemble.xml clean build test document

## Releases

### Library SWC

[Download](https://dl.dropboxusercontent.com/u/1375050/LiquidFun.swc)

### TestBed SWF

[Download](https://dl.dropboxusercontent.com/u/1375050/TestBed.swf)

### TestBed APK

[Download](https://dl.dropboxusercontent.com/u/1375050/TestBed.apk)
