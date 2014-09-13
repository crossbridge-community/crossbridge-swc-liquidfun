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

import org.liquidfun.core.CModule;

public class JointTest extends Sprite {
    // Prepare for simulation. Typically we use a time step of 1/60 of a
    // second (60Hz) and 10 iterations. This provides a high quality simulation
    // in most game scenarios.
    private static const timeStep:Number = 1.0 / 60.0;
    private static const velocityIterations:int = 6;
    private static const positionIterations:int = 2;
    private static const particleIterations:int = 1;

    private var world:World;

    public function JointTest() {
        CModule.rootSprite = this;
        super();
    }

    [Before]
    public function setUp():void {
        world = World.create(0.0, -10.0);
    }

    [After]
    public function tearDown():void {
        world.destroy();
    }

    [BeforeClass]
    public static function setUpBeforeClass():void {
    }

    [AfterClass]
    public static function tearDownAfterClass():void {
    }

    [Test]
    public function test_distance_joint():void {
        var jointDef:DistanceJointDef = DistanceJointDef.create();
        jointDef.type = LiquidFun.JOINT_DISTANCE;
        jointDef.collideConnected = false;
        var joint:DistanceJoint = new DistanceJoint();
        joint.swigCPtr = world.createJoint(jointDef.swigCPtr);
        // cleanup
        jointDef.destroy();
        world.destroyJoint(joint.swigCPtr);
    }

    [Test]
    public function test_pulley_joint():void {
        var jointDef:PulleyJointDef = PulleyJointDef.create();
        jointDef.type = LiquidFun.JOINT_PULLEY;
        jointDef.collideConnected = false;
        var joint:PulleyJoint = new PulleyJoint();
        joint.swigCPtr = world.createJoint(jointDef.swigCPtr);
        // cleanup
        jointDef.destroy();
        world.destroyJoint(joint.swigCPtr);
    }

}
}