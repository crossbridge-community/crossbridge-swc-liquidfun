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

public class VaryingRestitutionExample extends BaseExample {

    public function VaryingRestitutionExample() {
    }

    override protected function onAdded(event:Event):void {
        super.onAdded(event);
        const restitutions:Array = [0.0, 0.1, 0.3, 0.5, 0.75, 0.9, 1.0];

        var shape:PolygonShape = PolygonShape.create();
        shape.setAsBox(15 / (LFGlobals.scale * 2), 15 / (LFGlobals.scale * 2));

        var fixtureDef:FixtureDef = FixtureDef.create();
        fixtureDef.shape = shape.swigCPtr;

        for (var i:int = 0; i < 7; i++) {

            var bodyDef:BodyDef = BodyDef.create();
            bodyDef.type = LiquidFun.DYNAMIC_BODY;
            bodyDef.setXY((400 + (i * 16)) / LFGlobals.scale, (300) / LFGlobals.scale);

            var body:Body = new Body();
            body.swigCPtr = LFGlobals.world.createBody(bodyDef.swigCPtr);

            fixtureDef.restitution = restitutions[i];
            body.createFixture(fixtureDef.swigCPtr);

            bodies.push(body);
        }
    }

}
}
