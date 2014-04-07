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

import org.liquidfun.Body;

import org.liquidfun.Fixture;
import org.liquidfun.Vec2;
import org.liquidfun.RayCastInput;
import org.liquidfun.RayCastOutput;
import org.liquidfun.utils.LFGlobals;

public class RaycastingExample extends BaseExample {

    public var laser:Body;

    public function RaycastingExample() {
    }
    
    override public function onFrameStep(event:Event):void {
            /*var p1:Vec2 = laser.getWorldPoint(new Vec2(30.1 / LFGlobals.scale, 0));
            var p2:Vec2 = laser.getWorldPoint(new Vec2(130.1 / LFGlobals.scale, 0));

            var f:Fixture = LFGlobals.world.rayCastOne(p1, p2);
            var lambda:Number = 1;
            if (f)
            {
                var input:RayCastInput = new RayCastInput();
                input.p1 = p1.swigCPtr;
                input.p2 = p2.swigCPtr;
                var output:RayCastOutput = new RayCastOutput();
                f.rayCast(output.swigCPtr, input.swigCPtr, 0);
                lambda = output.fraction;
            }
            graphics.lineStyle(1,0xff0000,1);
            graphics.moveTo(p1.x * LFGlobals.scale, p1.y * LFGlobals.scale);
            graphics.lineTo( 	(p2.x * lambda + (1 - lambda) * p1.x) * LFGlobals.scale,
                            (p2.y * lambda + (1 - lambda) * p1.y) * LFGlobals.scale);
            */
    }

    override protected function onAdded(event:Event):void {
        super.onAdded(event);        
    }

}
}
