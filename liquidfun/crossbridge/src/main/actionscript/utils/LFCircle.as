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

package utils {
import flash.display.Sprite;
import flash.geom.Matrix;

public class LFCircle extends Sprite {
    private var bodyDef:BodyDef;
    private var bodyDefPos:Vec2;
    private var body:Body;
    private var dynamicBox:CircleShape;
    private var fixtureDef:FixtureDef;
    private var radius:Number;
    private var matrix:Matrix = new Matrix();

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
        bodyDef.type = LiquidFun.dynamicBody;
        bodyDefPos = Vec2.create()
        bodyDefPos.set(_x / LFGlobals.SCALE, _y / LFGlobals.SCALE);
        bodyDef.position = bodyDefPos.swigCPtr;
        body = new Body();
        body.swigCPtr = world.createBody(bodyDef.swigCPtr);

        dynamicBox = CircleShape.create();
        dynamicBox.radius = _r * 0.1;

        fixtureDef = FixtureDef.create();
        fixtureDef.shape = dynamicBox.swigCPtr;
        fixtureDef.density = 1.0;
        fixtureDef.friction = 0.3;
        body.createFixture(fixtureDef.swigCPtr);
    }

    public function update():void {
        bodyDefPos.swigCPtr = body.getPosition();
        matrix.identity();
        matrix.translate(bodyDefPos.x * LFGlobals.SCALE, stage.stageHeight - (bodyDefPos.y * LFGlobals.SCALE));
        transform.matrix = matrix;
    }
}
}