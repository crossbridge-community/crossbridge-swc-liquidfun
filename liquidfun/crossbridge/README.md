LiquidFun Flash
===============

## Getting Started

### Tooling Version Requirements

Following are the minimum required versions for the tools and libraries you
need for building LiquidFun for Flash:

* CrossBridge SDK 1.0.1: http://sourceforge.net/projects/crossbridge/files/
* Adobe AIR SDK 4.0.0: http://www.adobe.com/devnet/air/air-sdk-download.html
* Apache Flex SDK 4.1.1: https://flex.apache.org/installer.html
* Apache Ant 1.9.3: https://ant.apache.org/bindownload.cgi
* JDK 7: http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html

### Env. Variable Requirements

In order to get the build scripts working, set the following environment variables (style is important):

* FLASCC_ROOT=\SDK_DIR\adobe-crossbridge\1.0.1
* FLASCC_AIR_ROOT=/cygdrive/c/SDK_DIR/adobe-air/4.0.0
* FLASCC_GDB_RUNTIME=/cygdrive/c/SDK_DIR/flashplayer.exe
* AIR_HOME=\SDK_DIR\adobe-air\4.0.1
* FLEX_HOME=\SDK_DIR\apache-flex\4.1.1

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

## TODO

* Implement Flash specific DebugDraw
* Implement Flash specific Contact handling (event/signal/call-method)
* Test Joint and Particle systems
* Cover all classes with unit tests
* Create more test bed examples