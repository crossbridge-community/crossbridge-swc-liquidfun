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
import flash.events.Event;
import flash.geom.Matrix;

import org.liquidfun.*;
import org.liquidfun.utils.LFGlobals;

public class LFRectangle extends LFBaseShape {
    public var bodyDef:BodyDef;
    public var body:Body;
    public var dynamicBox:PolygonShape;
    public var fixtureDef:FixtureDef;
    public var w:Number;
    public var h:Number;
    public var matrix:Matrix = new Matrix();

    public function LFRectangle(_x:Number, _y:Number, _w:Number, _h:Number, world:World, isDynamic:Boolean = true) {
        w = _w;
        h = _h;
        initialize(_x, _y, _w, _h, world, isDynamic);
    }

    private function initialize(_x:Number, _y:Number, _w:Number, _h:Number, world:World, isDynamic:Boolean):void {
        graphics.lineStyle(0.25, Math.random() * uint.MAX_VALUE);
        graphics.beginFill(Math.random() * uint.MAX_VALUE, 0.2);
        graphics.drawRect(0, 0, _w, _h);
        graphics.endFill();

        bodyDef = BodyDef.create();
        bodyDef.type = isDynamic ? LiquidFun.DYNAMIC_BODY : LiquidFun.STATIC_BODY;
        bodyDef.setXY(_x / LFGlobals.scale, _y / LFGlobals.scale);

        body = new Body();
        body.swigCPtr = world.createBody(bodyDef.swigCPtr);

        dynamicBox = PolygonShape.create();
        dynamicBox.setAsBox(_w / (LFGlobals.scale * 2), _h / (LFGlobals.scale * 2));

        fixtureDef = FixtureDef.create();
        fixtureDef.shape = dynamicBox.swigCPtr;

        fixtureDef.density = 1.0;
        fixtureDef.friction = 0.1 + (Math.random() * 1);
        fixtureDef.restitution = 0.1 + (Math.random() * 0.5);

        body.createFixture(fixtureDef.swigCPtr);

        //trace(/*bodyDefPos.x, bodyDefPos.y,*/body.getX(),body.getY())
        update();
    }

    public function update():void {
        matrix.identity();
        matrix.translate(-w * 0.5, -h * 0.5);
        matrix.rotate(-body.getAngle());
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