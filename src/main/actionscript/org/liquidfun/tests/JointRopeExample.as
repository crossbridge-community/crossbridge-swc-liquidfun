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

package org.liquidfun.tests {
import flash.events.Event;

import org.liquidfun.*;
import org.liquidfun.utils.LFGlobals;

public class JointRopeExample extends BaseExample {

    public function JointRopeExample() {
    }

    override protected function onAdded(event:Event):void {
        super.onAdded(event);

        var bodyDef:BodyDef = BodyDef.create();
        bodyDef.type = LiquidFun.DYNAMIC_BODY;

        var shape:PolygonShape = PolygonShape.create();
        shape.setAsBox(15 / (LFGlobals.scale * 2), 15 / (LFGlobals.scale * 2));

        var fixtureDef:FixtureDef = FixtureDef.create();
        fixtureDef.shape = shape.swigCPtr;
        fixtureDef.density = 1.0;

        bodyDef.setXY(300 / LFGlobals.scale, 300 / LFGlobals.scale);
        var bodyA:Body = new Body();
        bodyA.swigCPtr = LFGlobals.world.createBody(bodyDef.swigCPtr);
        bodyA.createFixture(fixtureDef.swigCPtr);
        bodies.push(bodyA);

        bodyDef.setXY(500 / LFGlobals.scale, 300 / LFGlobals.scale);
        var bodyB:Body = new Body();
        bodyB.swigCPtr = LFGlobals.world.createBody(bodyDef.swigCPtr);
        bodyB.createFixture(fixtureDef.swigCPtr);
        bodies.push(bodyB);

        var v1:Vec2 = Vec2.create();
        v1.set(bodyA.getX(), bodyA.getY() - 10);
        var v2:Vec2 = Vec2.create();
        v2.set(bodyB.getX(), bodyB.getY() - 10);

        var jointDef:RopeJointDef = RopeJointDef.create();
        jointDef.bodyA = bodyA.swigCPtr;
        jointDef.bodyB = bodyB.swigCPtr;

        var joint:RopeJoint = new RopeJoint();
        joint.swigCPtr = LFGlobals.world.createJoint(jointDef.swigCPtr);

        joints.push(joint);
    }

}
}
