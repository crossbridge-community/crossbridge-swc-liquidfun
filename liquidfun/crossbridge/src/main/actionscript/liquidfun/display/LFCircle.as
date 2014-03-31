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

package liquidfun.display {
import flash.events.Event;
import flash.geom.Matrix;

import liquidfun.utils.*;

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
        graphics.lineStyle(0.25, Math.random() * uint.MAX_VALUE);
        graphics.beginFill(Math.random() * uint.MAX_VALUE, 0.2);
        graphics.drawCircle(0, 0, _r);
        graphics.endFill();

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

        update();
    }

    public function update():void {
        matrix.identity();
        matrix.translate(body.getX() * LFGlobals.scale, 600 - (body.getY() * LFGlobals.scale));
        transform.matrix = matrix;
    }

    override protected function onRemoved(event:Event):void {
        super.onRemoved(event);
        bodyDef.destroy();
        bodyDef = null;
        fixtureDef.destroy();
        fixtureDef = null;
        dynamicBox.destroy();
        dynamicBox = null;
        matrix = null;
        body = null;
    }
}
}