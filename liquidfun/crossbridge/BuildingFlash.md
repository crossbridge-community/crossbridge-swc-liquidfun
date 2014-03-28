# Building for Flash

### Version Requirements

Following are the minimum required versions for the tools and libraries you
need for building LiquidFun for Flash:

-   CrossBridge SDK 1.0.1: http://sourceforge.net/projects/crossbridge/files/
-   Adobe AIR SDK 4.0.0: http://www.adobe.com/devnet/air/air-sdk-download.html
-   Apache Flex SDK 4.1.1: https://flex.apache.org/installer.html

### Building

In order to assemble the SWC library set the following env. variables and run 'build.bat':

* FLASCC_ROOT=c:\Work\sdks\adobe-crossbridge\1.0.1 (Windows style path)
* FLASCC_AIR_ROOT=/cygdrive/c/Work/sdks/adobe-air/4.0.0 (Cygwin style path)
* FLASCC_GDB_RUNTIME=/cygdrive/c/Work/tools/flashplayer.exe (Cygwin style path)

In order to assemble the SWF example(s) and run unit tests set the following env. variables and run 'ant -f assemble.xml':

* AIR_HOME=c:\Work\sdks\adobe-air\4.0.1 (Windows style path)
* FLEX_HOME=c:\Work\sdks\apache-flex\4.1.1 (Windows style path)

### Running Unit Tests

* FlexUnit documentation: https://cwiki.apache.org/confluence/display/FLEX/FlexUnit+Setting+up+a+project

### Code Changes

* b2Joint.h: Destroyer method declaration changed from Protected to Public

### Learning CrossBridge

* https://github.com/adobe-flash/crossbridge/wiki/_pages
* http://bruce-lab.blogspot.hu/2014/01/crossbridgeflascc-resources-collection.html

### Comments

Work in progress, only tested on Windows 7 x64 platform (MacOS supported, Linux not supported due tooling requirements.