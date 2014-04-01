//
//=BEGIN MIT LICENSE
//
// Copyright (c) 2014 Andras Csizmadia
// http://www.vpmedia.hu
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
//=END MIT LICENSE
//

package org.liquidfun {
import flash.display.Sprite;
import flash.net.LocalConnection;
import flash.system.System;
import flash.utils.Dictionary;

public class CoreTest extends Sprite {

    private var dictionary:Dictionary = new Dictionary(true);

    public function CoreTest() {
        CModule.rootSprite = this;
        super();
    }

    [Before]
    public function setUp():void {
    }

    [After]
    public function tearDown():void {
    }

    [BeforeClass]
    public static function setUpBeforeClass():void {
    }

    [AfterClass]
    public static function tearDownAfterClass():void {
    }

    /*[Test]
     public function test_memory_leak():void {
     gc();
     trace(this, Number((System.totalMemoryNumber * 0.000000954).toFixed(3)) + " Mb");
     for (var i:int = 0; i < 100000; i++) {
     var vector:Vec2 = Vec2.create();
     dictionary[vector] = true;
     vector.destroy();
     vector = null;
     }
     gc();
     trace(this, Number((System.totalMemoryNumber * 0.000000954).toFixed(3)) + " Mb");
     for (var o:* in dictionary) {
     trace(this, o);
     }
     }*/

    /**
     * Call Garbage Collector
     */
    public static function gc():void {
        // mark & sweep
        System.pauseForGCIfCollectionImminent(0);
        System.pauseForGCIfCollectionImminent(0);
        // Call debugger supported GC
        try {
            // mark & sweep
            System.gc();
            System.gc();
        } catch (error:Error) {
        }
        // unsupported hack that seems to force a *full* GC
        try {
            var lc1:LocalConnection = new LocalConnection();
            var lc2:LocalConnection = new LocalConnection();
            lc1.connect('name');
            lc2.connect('name');
        } catch (error:Error) {
        }
    }


}
}