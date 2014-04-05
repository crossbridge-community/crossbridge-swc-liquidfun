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
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;

import org.liquidfun.Body;
import org.liquidfun.Joint;
import org.liquidfun.ParticleSystem;
import org.liquidfun.utils.LFGlobals;

//----------------------------------
//  Metadata
//----------------------------------
[SWF(backgroundColor="#666666", frameRate="60", quality="HIGH", width="800", height="600")]

/**
 * Hello LiquidFun Physics World Example
 *
 * @author Andras Csizmadia
 */
public class BaseExample extends Sprite {

    private static var _currentSeed:uint = 1234;

    protected var bodies:Vector.<Body> = new Vector.<Body>();

    protected var joints:Vector.<Joint> = new Vector.<Joint>();

    protected var systems:Vector.<ParticleSystem> = new Vector.<ParticleSystem>();

    //----------------------------------
    //  Constructor
    //----------------------------------

    public function BaseExample() {
        addEventListener(Event.ADDED_TO_STAGE, onAdded, false, 0, true);
    }

    /**
     * @private
     */
    protected function onAdded(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, onAdded);
        addEventListener(Event.REMOVED_FROM_STAGE, onRemoved, false, 0, true);
    }

    /**
     * @private
     */
    protected function onRemoved(event:Event):void {
        removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
        try {
            for (var s:int = 0; s < systems.length; s++) {
                LFGlobals.world.destroyParticleSystem(systems[s].swigCPtr);
            }
            systems.length = 0;

            for (var j:int = 0; j < joints.length; j++) {
                LFGlobals.world.destroyJoint(joints[j].swigCPtr);
            }
            joints.length = 0;

            for (var i:int = 0; i < bodies.length; i++) {
                LFGlobals.world.destroyBody(bodies[i].swigCPtr);
            }
            bodies.length = 0;
        } catch(error:Error) {
            trace(this, error);
        }

    }

    /**
     * @private
     */
    public function onFrameStep(event:Event):void {
        // abstract
    }

    /**
     * @private
     */
    public function onKeyUp(event:KeyboardEvent):void {
        // abstract
    }

    /**
     * @private
     * @return a number between 0-1 exclusive.
     */
    public static function randomFloat():Number {
        return (_currentSeed = (_currentSeed * 16807) % 2147483647) / 0x7FFFFFFF + 0.000000000233;
    }
}
}
