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

import flexunit.framework.Assert;

import org.liquidfun.core.CModule;

public class FixtureDefTest extends Sprite {

    public function FixtureDefTest() {
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

    [Test]
    public function test_construct():void {
        /*
         shape = NULL;
         userData = NULL;
         friction = 0.2f;
         restitution = 0.0f;
         density = 0.0f;
         isSensor = false;
         */
        var fixtureDef:FixtureDef = FixtureDef.create();
        // default properties
        Assert.assertEquals(fixtureDef.friction, 0.20000000298023224);
        Assert.assertEquals(fixtureDef.restitution, 0);
        Assert.assertEquals(fixtureDef.density, 0);
        Assert.assertEquals(fixtureDef.isSensor, false);
        // cleanup
        fixtureDef.destroy();
        fixtureDef = null;
    }

    [Test]
    public function test_get_set():void {
        var fixtureDef:FixtureDef = FixtureDef.create();
        // friction
        fixtureDef.friction = 1;
        Assert.assertEquals(fixtureDef.friction, 1);
        // restitution
        fixtureDef.restitution = 1;
        Assert.assertEquals(fixtureDef.restitution, 1);
        // density
        fixtureDef.density = 1;
        Assert.assertEquals(fixtureDef.density, 1);
        // isSensor
        fixtureDef.isSensor = true;
        Assert.assertEquals(fixtureDef.isSensor, true);
        // cleanup
        fixtureDef.destroy();
        fixtureDef = null;
    }

    [Test]
    public function test_identity():void {
        var fixtureDef:FixtureDef = FixtureDef.create();
        Assert.assertEquals(fixtureDef.restitution, 0);
        fixtureDef.restitution = 1;
        Assert.assertEquals(fixtureDef.restitution, 1);
        fixtureDef.identity();
        Assert.assertEquals(fixtureDef.restitution, 0);
        // cleanup
        fixtureDef.destroy();
        fixtureDef = null;
    }

}
}