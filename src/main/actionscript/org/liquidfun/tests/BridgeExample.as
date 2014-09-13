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
import org.liquidfun.RevoluteJoint;
import org.liquidfun.utils.LFGlobals;

public class BridgeExample extends BaseExample {

    public function BridgeExample() {
    }

    override protected function onAdded(event:Event):void {
        super.onAdded(event);

        var groundDef:BodyDef = BodyDef.create();
        var ground:Body = new Body();
        ground.swigCPtr = LFGlobals.world.createBody(groundDef.swigCPtr);

        var i:int;
        var anchor:Vec2 = Vec2.create();
        var body:Body;

        // Bridge

        var sd:PolygonShape = PolygonShape.create();
        var fixtureDef:FixtureDef = FixtureDef.create();
        sd.setAsBox(24 / LFGlobals.scale, 5 / LFGlobals.scale);
        fixtureDef.shape = sd.swigCPtr;
        fixtureDef.density = 20.0;
        fixtureDef.friction = 0.2;

        var bd:BodyDef = BodyDef.create();
        bd.type = LiquidFun.DYNAMIC_BODY;

        var jd:RevoluteJointDef = RevoluteJointDef.create();
        const numPlanks:int = 10;
        jd.lowerAngle = -15 / (180 / Math.PI);
        jd.upperAngle = 15 / (180 / Math.PI);
        jd.enableLimit = true;

        var prevBody:Body = ground;
        for (i = 0; i < numPlanks; ++i) {
            bd.setXY((100 + 22 + 44 * i) / LFGlobals.scale, 250 / LFGlobals.scale);
            body = new Body();
            body.swigCPtr = LFGlobals.world.createBody(bd.swigCPtr);
            body.createFixture(fixtureDef.swigCPtr);

            anchor.set((100 + 44 * i) / LFGlobals.scale, 250 / LFGlobals.scale);
            jd.initialize(prevBody.swigCPtr, body.swigCPtr, anchor.swigCPtr);
            LFGlobals.world.createJoint(jd.swigCPtr);

            bodies.push(body);
            prevBody = body;
        }

        anchor.set((100 + 44 * numPlanks) / LFGlobals.scale, 250 / LFGlobals.scale);
        jd.initialize(prevBody.swigCPtr, ground.swigCPtr, anchor.swigCPtr);
        var joint:RevoluteJoint = new RevoluteJoint();
        joint.swigCPtr = LFGlobals.world.createJoint(jd.swigCPtr);

        joints.push(joint);
    }

}
}
