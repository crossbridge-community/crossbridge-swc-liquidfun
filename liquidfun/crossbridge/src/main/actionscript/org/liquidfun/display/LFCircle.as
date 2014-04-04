// Copyright (c) 2013 Adobe Systems Inc

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

package org.liquidfun.display {
import flash.geom.Matrix;

import org.liquidfun.*;
import org.liquidfun.utils.LFGlobals;

public class LFCircle extends LFBaseShape {
    public var bodyDef:BodyDef;
    public var body:Body;
    public var dynamicBox:CircleShape;
    public var fixtureDef:FixtureDef;
    public var radius:Number;
    public var matrix:Matrix = new Matrix();

    public function LFCircle(_x:Number, _y:Number, _r:Number, world:World) {
        radius = _r;
        initialize(_x, _y, _r, world);
    }

    private function initialize(_x:Number, _y:Number, _r:Number, world:World):void {

        bodyDef = BodyDef.create();
        bodyDef.type = LiquidFun.DYNAMIC_BODY;
        bodyDef.setXY(_x / LFGlobals.scale, _y / LFGlobals.scale);

        body = new Body();
        body.swigCPtr = world.createBody(bodyDef.swigCPtr);

        dynamicBox = CircleShape.create();
        dynamicBox.radius = _r / LFGlobals.scale;

        fixtureDef = FixtureDef.create();
        fixtureDef.shape = dynamicBox.swigCPtr;
        fixtureDef.density = 1.0;
        fixtureDef.friction = 0.1 + (Math.random() * 1);
        fixtureDef.restitution = 0.1 + (Math.random() * 0.5);
        body.createFixture(fixtureDef.swigCPtr);

    }

}
}