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
import com.bit101.components.Label;
import com.bit101.components.List;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.system.System;

import net.hires.debug.Stats;

import org.liquidfun.*;
import org.liquidfun.core.CModule;
import org.liquidfun.core.vfs.ISpecialFile;
import org.liquidfun.tests.*;
import org.liquidfun.utils.LFGlobals;

//----------------------------------
//  Metadata
//----------------------------------
[SWF(backgroundColor="#333333", frameRate="60", quality="HIGH", width="1024", height="768")]

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

    private var title:Label;

    private var message:Label;

    private var stats:Stats;

    private var exampleList:List;

    private var debugDraw:DebugDraw;

    private const tests:Vector.<Class> = Vector.<Class>([
        SandboxExample,
        ApplyForceExample,
        BaseExample,
        BodyTypesExample,
        BreakableExample,
        BridgeExample,
        CantileverExample,
        ChainExample,
        CollisionFilteringExample,
        CollisionProcessingExample,
        ConfinedExample,
        ConveyorBeltExample,
        DominosExample,
        ForceExample,
        GearsExample,
        JointDistanceExample,
        JointMotorExample,
        JointMouseExample,
        JointPrismaticExample,
        JointPulleyExample,
        JointRevoluteExample,
        JointRopeExample,
        JointWeldExample,
        JointWheelExample,
        JumpExample,
        OneSidedPlatformExample,
        ParticleDrawingExample,
        ParticleElasticExample,
        ParticleRigidExample,
        ParticleSystemExample,
        PyramidExample,
        RampExample,
        RaycastingExample,
        RopeExample,
        SensorExample,
        ShapeCompoundExample,
        ShapeConvexHullExample,
        ShapeEdgeExample,
        StackCircleExample,
        StackRectangleExample,
        TheoJansenExample,
        TimeOfImpactExample,
        VaryingFrictionExample,
        VaryingRestitutionExample,
        WorldQueryExample

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

        title = new Label(this, 0, 600);
        title.width = 1024;
        title.text = "";

        message = new Label(this, 0, 620);
        message.y = 620;
        message.text = "";

        // Construct a world object, which will hold and simulate the rigid bodies.
        world = LFGlobals.world = World.create(0.0, 10.0);

        // Add FPS and Memory monitor
        stats = new Stats();
        stats.x = 955;
        addChild(stats);

        var setupList:List = new List(this, 800, 0);
        setupList.width = 155;

        exampleList = new List(this, 800, 100);
        exampleList.width = 224;
        exampleList.height = 500;
        for (var i:int = 0; i < tests.length; i++)
            exampleList.addItem({label: tests[i].toString(), data: tests[i]});
        exampleList.addEventListener(Event.SELECT, onListSelect);

        // Test b2Log trace
        world.dump();

        // Walls
        createWalls();

        // Create debug draw instance and assign to world
        debugDraw = DebugDraw.create();
        debugDraw.fillAlpha = 0.5;
        //trace(debugDraw.drawArea);
        world.setDebugDraw(debugDraw.swigCPtr);
        debugDraw.setFlags(Draw.BIT_SHAPE | Draw.BIT_JOINT | Draw.BIT_PAIR | Draw.BIT_PARTICLE);

        // Set start test
        newTest();

        // Test switching
        stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp, false, 0, true);

        // Update hook
        stage.addEventListener(Event.ENTER_FRAME, onFrameEnter, false, 0, true);
    }

    /**
     * @private
     */
    private function onListSelect(event:Event):void {
        currentIndex = tests.indexOf(exampleList.selectedItem.data);
        newTest();
    }

    /**
     * @private
     */
    private function onFrameEnter(event:Event):void {
        // Calling serviceUIRequests from the main worker allows us to service any requests
        // from background workers that want to use flash APIs that need main worker privileges.
        CModule.serviceUIRequests();
        // update world dynamics
        world.step(I_TIME, I_VELOCITY, I_POSITION, I_PARTICLE);
        // update debug draw
        debugDraw.step();
        world.drawDebugData();
    }

    /**
     * @private
     */
    private function onKeyUp(event:KeyboardEvent):void {
        // TODO
    }

    /**
     * @private
     */
    private function newTest():void {
        removeTest();
        if (currentIndex < 0) currentIndex = tests.length - 1;
        else if (currentIndex > tests.length - 1) currentIndex = 0;
        currentTest = BaseExample(addChild(new tests[currentIndex]()));
        title.text = " " + currentIndex + " : " + currentTest.toString();
    }

    /**
     * @private
     */
    private function removeTest():void {
        // remove prev. test
        if (currentTest && currentTest.parent)
            removeChild(currentTest);
        currentTest = null;
        // run gc
        System.pauseForGCIfCollectionImminent();
    }

    // ======================================================
    // Helper methods
    // ======================================================

    private function createWalls():void {
        var body:Body;

        var bodyDef:BodyDef = BodyDef.create();
        bodyDef.type = LiquidFun.STATIC_BODY;

        var fixtureDef:FixtureDef = FixtureDef.create();

        var dynamicBox:PolygonShape = PolygonShape.create();

        // b
        bodyDef.setXY(400 / LFGlobals.scale, 595 / LFGlobals.scale);
        body = new Body();
        body.swigCPtr = world.createBody(bodyDef.swigCPtr);
        dynamicBox.setAsBox(800 / (LFGlobals.scale * 2), 10 / (LFGlobals.scale * 2));
        fixtureDef.shape = dynamicBox.swigCPtr;
        body.createFixture(fixtureDef.swigCPtr);
        // l
        bodyDef.setXY(5 / LFGlobals.scale, 300 / LFGlobals.scale);
        body = new Body();
        body.swigCPtr = world.createBody(bodyDef.swigCPtr);
        dynamicBox.setAsBox(10 / (LFGlobals.scale * 2), 600 / (LFGlobals.scale * 2));
        fixtureDef.shape = dynamicBox.swigCPtr;
        body.createFixture(fixtureDef.swigCPtr);
        // r
        bodyDef.setXY(795 / LFGlobals.scale, 300 / LFGlobals.scale);
        body = new Body();
        body.swigCPtr = world.createBody(bodyDef.swigCPtr);
        dynamicBox.setAsBox(10 / (LFGlobals.scale * 2), 600 / (LFGlobals.scale * 2));
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
