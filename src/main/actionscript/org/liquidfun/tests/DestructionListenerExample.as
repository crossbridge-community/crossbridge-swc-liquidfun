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

public class DestructionListenerExample extends BaseExample {

    public function DestructionListenerExample() {
    }

    override protected function onAdded(event:Event):void {
        super.onAdded(event);

        var bodyDef:BodyDef = BodyDef.create();
        bodyDef.type = LiquidFun.DYNAMIC_BODY;

        var shape:CircleShape = CircleShape.create();
        shape.radius = 8 / LFGlobals.scale;

        var fixtureDef:FixtureDef = FixtureDef.create();
        fixtureDef.shape = shape.swigCPtr;
        fixtureDef.density = 1;
        fixtureDef.friction = 1;
        fixtureDef.restitution = 1;

        bodyDef.setXY(400 / LFGlobals.scale, 300 / LFGlobals.scale);

        var body:Body = new Body();
        body.swigCPtr = LFGlobals.world.createBody(bodyDef.swigCPtr);

        body.createFixture(fixtureDef.swigCPtr);

        bodies.push(body);

        var listener:DestructionListenerImpl = DestructionListenerImpl.create();
        listener.onFixtureDestroyed = function(ptr:int):void {
            trace("onFixtureDestroyed: " + ptr);
        }
        LFGlobals.world.setDestructionListener(listener.swigCPtr);

    }

}
}
