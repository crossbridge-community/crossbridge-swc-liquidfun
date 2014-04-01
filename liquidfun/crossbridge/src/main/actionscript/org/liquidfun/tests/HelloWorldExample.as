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

import org.liquidfun.display.LFCircle;
import org.liquidfun.display.LFRectangle;
import org.liquidfun.utils.LFGlobals;
import org.liquidfun.utils.RandomUtil;

//----------------------------------
//  Metadata
//----------------------------------
[SWF(backgroundColor="#666666", frameRate="60", quality="HIGH", width="800", height="600")]

/**
 * Hello LiquidFun Physics World Example
 *
 * @author Andras Csizmadia
 */
public class HelloWorldExample extends BaseExample {

    //----------------------------------
    //  Private variables
    //----------------------------------

    private var boxes:Vector.<LFRectangle> = new Vector.<LFRectangle>();

    private var circles:Vector.<LFCircle> = new Vector.<LFCircle>();

    //----------------------------------
    //  Private static constants
    //----------------------------------

    private static const MAX_ITEMS:int = 200;

    //----------------------------------
    //  Constructor
    //----------------------------------

    public function HelloWorldExample() {
    }

    /**
     * @private
     */
    override public function update():void {
        var i:int;
        var n:int;
        n = boxes.length;
        for (i = 0; i < n; i++) {
            boxes[i].update();
        }
        n = circles.length;
        for (i = 0; i < n; i++) {
            circles[i].update();
        }
    }

    /**
     * @private
     */
    override protected function onRemoved(event:Event):void {
        super.onRemoved(event);

        var i:int;
        var n:int;
        n = boxes.length;
        for (i = 0; i < n; i++) {
            LFGlobals.world.destroyBody(boxes[i].body.swigCPtr);
            removeChild(boxes[i]);
        }
        n = circles.length;
        for (i = 0; i < n; i++) {
            LFGlobals.world.destroyBody(circles[i].body.swigCPtr);
            removeChild(circles[i]);
        }
        circles.length = 0;
        boxes.length = 0;
    }

    /**
     * @private
     */
    override protected function onAdded(event:Event):void {
        super.onAdded(event);

        var wall:LFRectangle = new LFRectangle(400, 300, 200, 5, LFGlobals.world, false);
        boxes.push(wall);
        addChild(wall);

        // boxes
        for (var i:int = 0; i < MAX_ITEMS; i++) {
            var bs:LFRectangle = new LFRectangle(200 + RandomUtil.float() * 400, 10 + RandomUtil.float() * 3000, 10 + RandomUtil.float() * 5, 10 + RandomUtil.float() * 5, LFGlobals.world);
            boxes.push(bs);
            addChild(bs);
        }
        // circles
        for (var j:int = 0; j < MAX_ITEMS; j++) {
            var bc:LFCircle = new LFCircle(200 + RandomUtil.float() * 400, 10 + RandomUtil.float() * 3000, 5 + RandomUtil.float() * 5, LFGlobals.world);
            circles.push(bc);
            addChild(bc);
        }

        trace("Created " + MAX_ITEMS * 2 + " objects.");
    }

}
}
