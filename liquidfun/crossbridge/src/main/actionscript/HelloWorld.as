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

package {
import crossbridge.liquidfun.CModule;
import crossbridge.liquidfun.vfs.ISpecialFile;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;

import net.hires.debug.Stats;

import utils.LFCircle;
import utils.LFRectangle;

//----------------------------------
//  Metadata
//----------------------------------
[SWF(backgroundColor="#666666", frameRate="60", quality="HIGH", width="800", height="600")]

/**
 * Hello LiquidFun Physics World Example
 *
 * @author Andras Csizmadia
 */
public class HelloWorld extends Sprite implements ISpecialFile {

    //----------------------------------
    //  Private variables
    //----------------------------------

    private var world:World;

    private var boxes:Vector.<LFRectangle> = new Vector.<LFRectangle>();

    private var circles:Vector.<LFCircle> = new Vector.<LFCircle>();

    //----------------------------------
    //  Private static constants
    //----------------------------------

    private static const I_TIME:Number = 1.0 / 60.0;

    private static const I_VELOCITY:int = 10;

    private static const I_POSITION:int = 4;

    private static const I_PARTICLE:int = 2;

    private static const MAX_ITEMS:int = 200;

    //----------------------------------
    //  Private static variables
    //----------------------------------

    private static var _currentSeed:uint = 1234;

    //----------------------------------
    //  Constructor
    //----------------------------------

    public function HelloWorld() {
        CModule.rootSprite = this
        addEventListener(Event.ADDED_TO_STAGE, onAdded, false, 0, true);
    }

    /**
     * @private
     */
    private function onFrameEnter(e:Event):void {
        // Calling serviceUIRequests from the main worker allows us to service any requests
        // from background workers that want to use flash APIs that need main worker privileges.
        CModule.serviceUIRequests();
        // update physics world
        world.step(I_TIME, I_VELOCITY, I_POSITION, I_PARTICLE);
        // update custom entities
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
    private function onAdded(event:Event):void {
        // Allow to only add once
        removeEventListener(Event.ADDED_TO_STAGE, onAdded);

        // Initialize the Stage
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;

        // Initialize CrossBridge module
        CModule.vfs.console = this;
        CModule.startAsync(this);
        CModule.activeConsole = this;

        // Add FPS and Memory monitor
        addChild(new Stats());

        // Construct a world object, which will hold and simulate the rigid bodies.
        world = World.create(0.0, -10.0)

        var wall:LFRectangle;
        /*
         wall = new LFRectangle(400, 600, 800, 5, world, false);
         boxes.push(wall);
         addChild(wall);*/

        // Bottom
        wall = new LFRectangle(400, 5, 800, 5, world, false);
        boxes.push(wall);
        addChild(wall);

        // Left
        wall = new LFRectangle(5, 300, 10, 600, world, false);
        boxes.push(wall);
        addChild(wall);

        // Right
        wall = new LFRectangle(795, 300, 10, 600, world, false);
        boxes.push(wall);
        addChild(wall);

        // Extra
        wall = new LFRectangle(400, 300, 200, 5, world, false);
        boxes.push(wall);
        addChild(wall);

        // boxes
        for (var i:int = 0; i < MAX_ITEMS; i++) {
            var bs:LFRectangle = new LFRectangle(200 + random() * 400, 10 + random() * 3000, 10 + random() * 5, 10 + random() * 5, world);
            boxes.push(bs);
            addChild(bs);
        }
        // circles
        for (var j:int = 0; j < MAX_ITEMS; j++) {
            var bc:LFCircle = new LFCircle(200 + random() * 400, 10 + random() * 3000, 5 + random() * 5, world);
            circles.push(bc);
            addChild(bc);
        }

        trace("Created " + MAX_ITEMS * 2 + " objects.");

        // Update hook
        addEventListener(Event.ENTER_FRAME, onFrameEnter, false, 0, true);
    }

    // ======================================================
    // ISpecialFile implementation
    // ======================================================

    /**
     * The PlayerKernel implementation will use this function to handle
     * C IO write requests to the file "/dev/tty" (e.g. output from
     * printf will pass through this function).
     */
    public function write(fd:int, buf:int, nbyte:int, errnoPtr:int):int {
        var str:String = CModule.readString(buf, nbyte)
        trace(str)
        return nbyte
    }

    /**
     * The PlayerKernel implementation will use this function to handle
     * C IO read requests to the file "/dev/tty" (e.g. reads from stdin
     * will expect this function to provide the data).
     */
    public function read(fd:int, buf:int, nbyte:int, errnoPtr:int):int {
        return 0
    }

    /**
     * The PlayerKernel implementation will use this function to handle
     * C fcntl requests to the file "/dev/tty"
     * See the ISpecialFile documentation for more information about the
     * arguments and return value.
     */
    public function fcntl(fd:int, com:int, data:int, errnoPtr:int):int {
        return 0
    }

    /**
     * The PlayerKernel implementation will use this function to handle
     * C ioctl requests to the file "/dev/tty"
     * See the ISpecialFile documentation for more information about the
     * arguments and return value.
     */
    public function ioctl(fd:int, com:int, data:int, errnoPtr:int):int {
        return 0
    }

    // ======================================================
    // The following code is from Grant Skinner's Rndm.as
    // ======================================================

    /**
     * @private
     * @return a number between 0-1 exclusive.
     */
    private function random():Number {
        return (_currentSeed = (_currentSeed * 16807) % 2147483647) / 0x7FFFFFFF + 0.000000000233;
    }

}
}
