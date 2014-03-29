LiquidFun Flash
===============

## Getting Started

### Version Requirements

Following are the minimum required versions for the tools and libraries you
need for building LiquidFun for Flash:

-   CrossBridge SDK 1.0.1: http://sourceforge.net/projects/crossbridge/files/
-   Adobe AIR SDK 4.0.0: http://www.adobe.com/devnet/air/air-sdk-download.html
-   Apache Flex SDK 4.1.1: https://flex.apache.org/installer.html
-   Apache Ant 1.9.3: https://ant.apache.org/bindownload.cgi
-   JDK 7: http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html

### Building

#### Flash SWC Library 

Set the following env. variables and run 'build.bat':

* FLASCC_ROOT=c:\Work\sdks\adobe-crossbridge\1.0.1 (Windows style path)
* FLASCC_AIR_ROOT=/cygdrive/c/Work/sdks/adobe-air/4.0.0 (Cygwin style path)
* FLASCC_GDB_RUNTIME=/cygdrive/c/Work/tools/flashplayer.exe (Cygwin style path)

#### Example SWF + Unit Test + Documentation

Set the following env. variables and run 'ant -f assemble.xml clean build test document':

* AIR_HOME=c:\Work\sdks\adobe-air\4.0.1 (Windows style path)
* FLEX_HOME=c:\Work\sdks\apache-flex\4.1.1 (Windows style path)

### Code Changes

* b2Joint.h: Destroyer method declaration changed from Protected to Public

### Comments

Work in progress, only tested on Windows 7 x64 platform (MacOS supported, Linux not supported due tooling requirements).

## Release

### Pre-Compiled Library SWC

* https://dl.dropboxusercontent.com/u/1375050/LiquidFun.swc

### Pre-Compiled TestBed SWF

* https://dl.dropboxusercontent.com/u/1375050/TestBed.swf

## Learning SWIG and CrossBridge

* http://www.swig.org/Doc2.0/SWIGDocumentation.html#SWIGPlus
* http://www.ibiblio.org/gferg/ldp/GCC-Inline-Assembly-HOWTO.html
* http://www.adobe.com/devnet-docs/flascc/README.html
* http://www.adobe.com/devnet-docs/flascc/docs/Reference.html
* http://www.adobe.com/devnet-docs/flascc/docs/capidocs/as3.html
* https://github.com/adobe-flash/crossbridge/wiki/_pages
* http://bruce-lab.blogspot.hu/2014/01/crossbridgeflascc-resources-collection.html

## TODO

* Expose as much part of the API as possible.
* Create Flash specific b2Draw wrapper (flash.display.Shape).
* Create Flash specific b2Log wrapper (trace).
* Cover all classes with unit tests.
* Improve TestBed with all CPP like examples.