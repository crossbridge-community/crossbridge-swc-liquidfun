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

import org.liquidfun.display.LFRectangle;
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
public class PyramidExample extends BaseExample {

    //----------------------------------
    //  Private variables
    //----------------------------------

    private var boxes:Vector.<LFRectangle> = new Vector.<LFRectangle>();

    //----------------------------------
    //  Constructor
    //----------------------------------

    public function PyramidExample() {
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
        boxes.length = 0;
    }

    /**
     * @private
     */
    override protected function onAdded(event:Event):void {
        super.onAdded(event);

        // boxes
        const size:int = 10;
        for (var row:int = 0; row < size; row++) {
            for (var column:int = 0; column <= row; column++) {
                const nx:int = (column - row / 2) * 10;
                const ny:int = (size - row) * 10;
                var bs:LFRectangle = new LFRectangle(400 + nx, 300 + ny, 10, 10, LFGlobals.world);
                boxes.push(bs);
                addChild(bs);
            }
        }
    }

}
}
