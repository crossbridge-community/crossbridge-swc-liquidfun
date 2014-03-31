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

package liquidfun {
import crossbridge.liquidfun.CModule;

import flash.display.Sprite;

import flexunit.framework.Assert;

public class BodyDefTest extends Sprite {


    public function BodyDefTest() {
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
    public function test_constructor():void {
        var bodyDef:BodyDef = BodyDef.create();
        bodyDef.setPosition(10, 10);
        // active
        bodyDef.active = true;
        Assert.assertTrue(bodyDef.active);
        // allowSleep
        bodyDef.allowSleep = true;
        Assert.assertTrue(bodyDef.allowSleep);
        // angle
        bodyDef.angle = 0;
        // angularDamping
        bodyDef.angularDamping = 0;
        // angularVelocity
        bodyDef.angularVelocity = 0;
        // awake
        bodyDef.awake = true;
        Assert.assertTrue(bodyDef.awake);
        // bullet
        bodyDef.bullet = true;
        Assert.assertTrue(bodyDef.bullet);
        // fixedRotation
        bodyDef.fixedRotation = true;
        Assert.assertTrue(bodyDef.fixedRotation);
        // cleanup
        bodyDef.destroy();
        bodyDef = null;
    }

}
}