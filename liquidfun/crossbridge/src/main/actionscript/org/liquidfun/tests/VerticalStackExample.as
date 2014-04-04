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

//----------------------------------
//  Metadata
//----------------------------------
[SWF(backgroundColor="#666666", frameRate="60", quality="HIGH", width="800", height="600")]

/**
 * TBD
 *
 * @author Andras Csizmadia
 */
public class VerticalStackExample extends BaseExample {

    //----------------------------------
    //  Constructor
    //----------------------------------

    public function VerticalStackExample() {
    }

    /**
     * @private
     */
    override protected function onRemoved(event:Event):void {
        super.onRemoved(event);
    }

    /**
     * @private
     */
    override protected function onAdded(event:Event):void {
        super.onAdded(event);
        // boxes
        for (var j:int = 0; j < 5; j++) {
            for (var i:int = 0; i <= 16; i++) {

                var bodyDef:BodyDef = BodyDef.create();
                bodyDef.type = LiquidFun.DYNAMIC_BODY;
                bodyDef.setXY((400 + (j * 16)) / LFGlobals.scale, (50 + (i * 16)) / LFGlobals.scale);

                var body:Body = new Body();
                body.swigCPtr = LFGlobals.world.createBody(bodyDef.swigCPtr);

                var dynamicBox:PolygonShape = PolygonShape.create();
                dynamicBox.setAsBox(15 / (LFGlobals.scale * 2), 15 / (LFGlobals.scale * 2));

                var fixtureDef:FixtureDef = FixtureDef.create();
                fixtureDef.shape = dynamicBox.swigCPtr;

                fixtureDef.density = 1.0;
                fixtureDef.friction = 0.1 + (Math.random() * 1);
                fixtureDef.restitution = 0.1 + (Math.random() * 0.5);

                body.createFixture(fixtureDef.swigCPtr);

                bodies.push(body);
            }
        }
    }

}
}
