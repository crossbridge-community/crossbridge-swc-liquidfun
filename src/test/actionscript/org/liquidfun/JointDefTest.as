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

public class JointDefTest extends Sprite {


    public function JointDefTest() {
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
         type = e_unknownJoint;
         userData = NULL;
         bodyA = NULL;
         bodyB = NULL;
         collideConnected = false;
         */
        var jointDef:JointDef = JointDef.create();
        // default properties
        Assert.assertFalse(jointDef.collideConnected);
        Assert.assertEquals(jointDef.type, LiquidFun.JOINT_UNKNOWN);
        // cleanup
        jointDef.destroy();
        jointDef = null;
    }

    [Test]
    public function test_get_set():void {
        var jointDef:JointDef = JointDef.create();
        // collideConnected
        Assert.assertFalse(jointDef.collideConnected);
        jointDef.collideConnected = true;
        Assert.assertTrue(jointDef.collideConnected);
        // cleanup
        jointDef.destroy();
        jointDef = null;
    }

}
}