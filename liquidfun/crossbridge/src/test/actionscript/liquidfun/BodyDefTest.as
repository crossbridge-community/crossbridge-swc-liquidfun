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

/**
 * TBD
 *
 * @author Andras Csizmadia
 */
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
    public function test_construct():void {
        /*
         userData = NULL;
         position.Set(0.0f, 0.0f);
         angle = 0.0f;
         linearVelocity.Set(0.0f, 0.0f);
         angularVelocity = 0.0f;
         linearDamping = 0.0f;
         angularDamping = 0.0f;
         allowSleep = true;
         awake = true;
         fixedRotation = false;
         bullet = false;
         type = b2_staticBody;
         active = true;
         gravityScale = 1.0f;
         */
        var bodyDef:BodyDef = BodyDef.create();
        // default properties
        Assert.assertEquals(bodyDef.getX(), 0);
        Assert.assertEquals(bodyDef.getY(), 0);
        Assert.assertEquals(bodyDef.angle, 0);
        Assert.assertEquals(bodyDef.getVX(), 0);
        Assert.assertEquals(bodyDef.getVY(), 0);
        Assert.assertEquals(bodyDef.angularVelocity, 0);
        Assert.assertEquals(bodyDef.linearDamping, 0);
        Assert.assertEquals(bodyDef.angularDamping, 0);
        Assert.assertEquals(bodyDef.allowSleep, true);
        Assert.assertEquals(bodyDef.awake, true);
        Assert.assertEquals(bodyDef.fixedRotation, false);
        Assert.assertEquals(bodyDef.bullet, false);
        Assert.assertEquals(bodyDef.type, LiquidFun.STATIC_BODY);
        Assert.assertEquals(bodyDef.active, true);
        Assert.assertEquals(bodyDef.gravityScale, 1);
        // cleanup
        bodyDef.destroy();
        bodyDef = null;
    }

    [Test]
    public function test_reconstruct():void {
        var bodyDef:BodyDef = BodyDef.create();
        // assert default value
        Assert.assertEquals(bodyDef.type, LiquidFun.STATIC_BODY);
        // modify first
        bodyDef.type = LiquidFun.DYNAMIC_BODY;
        // destroy first
        bodyDef.destroy();
        // create second
        bodyDef = BodyDef.create();
        // assert default value
        Assert.assertEquals(bodyDef.type, LiquidFun.STATIC_BODY);
        // cleanup
        bodyDef.destroy();
        bodyDef = null;
    }

    [Test]
    public function test_get_set():void {
        var bodyDef:BodyDef = BodyDef.create();
        // position
        bodyDef.setX(10);
        bodyDef.setY(20);
        Assert.assertEquals(bodyDef.getX(), 10);
        Assert.assertEquals(bodyDef.getY(), 20);
        bodyDef.setXY(30, 40);
        Assert.assertEquals(bodyDef.getX(), 30);
        Assert.assertEquals(bodyDef.getY(), 40);
        // active
        bodyDef.active = true;
        Assert.assertTrue(bodyDef.active);
        // allowSleep
        bodyDef.allowSleep = true;
        Assert.assertTrue(bodyDef.allowSleep);
        // angle
        bodyDef.angle = 1;
        Assert.assertEquals(bodyDef.angle, 1);
        // angularDamping
        bodyDef.angularDamping = 1;
        Assert.assertEquals(bodyDef.awake, 1);
        // angularVelocity
        bodyDef.angularVelocity = 1;
        Assert.assertEquals(bodyDef.angularVelocity, 1);
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