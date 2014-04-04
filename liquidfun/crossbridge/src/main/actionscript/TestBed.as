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
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.system.System;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.ui.Keyboard;

import net.hires.debug.Stats;

import org.liquidfun.*;
import org.liquidfun.core.CModule;
import org.liquidfun.core.vfs.ISpecialFile;
import org.liquidfun.tests.BaseExample;
import org.liquidfun.tests.PyramidExample;
import org.liquidfun.tests.RigidParticlesExample;
import org.liquidfun.tests.SandboxExample;
import org.liquidfun.tests.SphereStackExample;
import org.liquidfun.tests.VaryingRestitutionExample;
import org.liquidfun.tests.VerticalStackExample;
import org.liquidfun.utils.LFGlobals;

//----------------------------------
//  Metadata
//----------------------------------
[SWF(backgroundColor="#666666", frameRate="60", quality="HIGH", width="800", height="600")]

/**
 * TestBed Example
 *
 * @author Andras Csizmadia
 */
public class TestBed extends Sprite implements ISpecialFile {

    //----------------------------------
    //  Private variables
    //----------------------------------

    private var currentTest:BaseExample;

    private var currentIndex:int;

    private var world:World;

    private var message:TextField;

    private var stats:Stats;

    private var debugDraw:DebugDraw;

    private const tests:Vector.<Class> = Vector.<Class>([
        SandboxExample
        , VaryingRestitutionExample
        , PyramidExample
        , VerticalStackExample
        , SphereStackExample
        , RigidParticlesExample
    ]);

    //----------------------------------
    //  Private static constants
    //----------------------------------

    private static const I_TIME:Number = 1.0 / 60.0;

    private static const I_VELOCITY:int = 10;

    private static const I_POSITION:int = 4;

    private static const I_PARTICLE:int = 1;

    //----------------------------------
    //  Constructor
    //----------------------------------

    public function TestBed() {
        CModule.rootSprite = this;
        addEventListener(Event.ADDED_TO_STAGE, onAdded, false, 0, true);
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
        //trace(CModule.activeConsole);

        message = new TextField();
        message.width = 800;
        addChild(message);
        var tf:TextFormat = new TextFormat("Arial", 11, 0xFFFFFF);
        tf.align = TextFormatAlign.CENTER;
        message.defaultTextFormat = tf;
        message.text = "Switch Test: SPACE | Switch Stats: S | Clear Forces: C";

        // Construct a world object, which will hold and simulate the rigid bodies.
        world = LFGlobals.world = World.create(0.0, 10.0);

        // Add FPS and Memory monitor
        stats = new Stats();
        stats.x = 10;
        addChild(stats);

        // Test b2Log trace
        world.dump();

        /*
         wall = new LFRectangle(400, 600, 800, 5, world, false);
         boxes.push(wall);
         addChild(wall);*/

        // Bottom
        createRectangle(400, 595, 800, 5, LFGlobals.world, false);

        // Left
        createRectangle(5, 300, 10, 600, LFGlobals.world, false);

        // Right
        createRectangle(795, 300, 10, 600, LFGlobals.world, false);

        // Create debug draw instance and assign to world
        debugDraw = DebugDraw.create();
        //trace(debugDraw.drawArea);
        world.setDebugDraw(debugDraw.swigCPtr);
        debugDraw.setFlags(Draw.BIT_SHAPE
                | Draw.BIT_JOINT
                | Draw.BIT_PAIR
                | Draw.BIT_CENTER_OF_MASS
                | Draw.BIT_PARTICLE);

        // Set first test
        nextTest();

        // Test switching
        stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp, false, 0, true);

        // Update hook
        stage.addEventListener(Event.ENTER_FRAME, onFrameEnter, false, 0, true);
    }

    /**
     * @private
     */
    private function onFrameEnter(event:Event):void {
        // Calling serviceUIRequests from the main worker allows us to service any requests
        // from background workers that want to use flash APIs that need main worker privileges.
        CModule.serviceUIRequests();
        // update physics world
        //startTime = getTimer();
        // update world dynamics
        world.step(I_TIME, I_VELOCITY, I_POSITION, I_PARTICLE);
        // draw debug if enabled
        debugDraw.step();
        world.drawDebugData();
        // update current test
        if (currentTest && currentTest.parent)
            currentTest.update();
        //message.text = "TimeDelta : " + (getTimer() - startTime) + "ms";
    }

    /**
     * @private
     */
    private function onKeyUp(event:KeyboardEvent):void {
        if (event.keyCode == Keyboard.SPACE) {
            nextTest();
        } else if (event.keyCode == Keyboard.C) {
            world.clearForces();
        } else if (event.keyCode == Keyboard.S) {
            stats.visible = !stats.visible;
        } else if (event.keyCode == Keyboard.D) {
            world.dump();
        }
    }

    /**
     * @private
     */
    private function nextTest():void {
        // remove prev. test
        if (currentTest && currentTest.parent)
            removeChild(currentTest);
        currentTest = null;
        // run gc
        System.pauseForGCIfCollectionImminent();
        // add new test
        currentTest = BaseExample(addChild(new tests[currentIndex++]()));
        if (currentIndex > tests.length - 1) currentIndex = 0;
        // debug log
        trace("nextTest", currentIndex, currentTest);
    }

    // ======================================================
    // Helper methods
    // ======================================================

    public static function createRectangle(_x:Number, _y:Number, _w:Number, _h:Number, world:World, isDynamic:Boolean = true):void {
        var bodyDef:BodyDef = BodyDef.create();
        bodyDef.type = isDynamic ? LiquidFun.DYNAMIC_BODY : LiquidFun.STATIC_BODY;
        bodyDef.setXY(_x / LFGlobals.scale, _y / LFGlobals.scale);

        var body:Body = new Body();
        body.swigCPtr = world.createBody(bodyDef.swigCPtr);

        var dynamicBox:PolygonShape = PolygonShape.create();
        dynamicBox.setAsBox(_w / (LFGlobals.scale * 2), _h / (LFGlobals.scale * 2));

        var fixtureDef:FixtureDef = FixtureDef.create();
        fixtureDef.shape = dynamicBox.swigCPtr;

        body.createFixture(fixtureDef.swigCPtr);
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
        var str:String = CModule.readString(buf, nbyte);
        trace(this, "write", str);
        return nbyte;
    }

    /**
     * The PlayerKernel implementation will use this function to handle
     * C IO read requests to the file "/dev/tty" (e.g. reads from stdin
     * will expect this function to provide the data).
     */
    public function read(fd:int, buf:int, nbyte:int, errnoPtr:int):int {
        var str:String = CModule.readString(buf, nbyte);
        trace(this, "read", str);
        return 0;
    }

    /**
     * The PlayerKernel implementation will use this function to handle
     * C fcntl requests to the file "/dev/tty"
     * See the ISpecialFile documentation for more information about the
     * arguments and return value.
     */
    public function fcntl(fd:int, com:int, data:int, errnoPtr:int):int {
        return 0;
    }

    /**
     * The PlayerKernel implementation will use this function to handle
     * C ioctl requests to the file "/dev/tty"
     * See the ISpecialFile documentation for more information about the
     * arguments and return value.
     */
    public function ioctl(fd:int, com:int, data:int, errnoPtr:int):int {
        return 0;
    }

}
}
