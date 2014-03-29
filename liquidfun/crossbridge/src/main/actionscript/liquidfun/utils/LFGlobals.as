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

package liquidfun.utils {
/**
 * Holds static Box2D definition objects that can be reused for performance.
 * Body, shape, fixture & joint defs that can be reused for performance.
 */
public class LFGlobals {

    public static var scale:int = 30;

    public static var world:World;

    public static var bodyDef:BodyDef;

    public static var fixtureDef:FixtureDef;

    //

    public static var polygonShape:PolygonShape;

    public static var circleShape:CircleShape;

    public static var edgeShape:EdgeShape;

    //

    public static var distanceJoint:DistanceJointDef;

    public static var gearJoint:GearJointDef;

    public static var mouseJoint:MouseJointDef;

    public static var prismaticJoint:PrismaticJointDef;

    public static var pulleyJoint:PulleyJointDef;

    public static var revoluteJoint:RevoluteJointDef;

    public static var weldJoint:WeldJointDef;

    public static var frictionJoint:FrictionJointDef;

    public static var ropeJoint:RopeJointDef;

    public function LFGlobals() {
    }

    private static const isInitialized:Boolean = initialize();


    /**
     * Create static definition objects. Can be re-called to re-initialize.
     */
    public static function initialize():Boolean {
        if (bodyDef) {
            destroy();
        }
        bodyDef = BodyDef.create();
        fixtureDef = FixtureDef.create();
        polygonShape = PolygonShape.create();
        circleShape = CircleShape.create();
        edgeShape = EdgeShape.create();
        distanceJoint = DistanceJointDef.create();
        gearJoint = GearJointDef.create();
        mouseJoint = MouseJointDef.create();
        prismaticJoint = PrismaticJointDef.create();
        pulleyJoint = PulleyJointDef.create();
        revoluteJoint = RevoluteJointDef.create();
        weldJoint = WeldJointDef.create();
        frictionJoint = FrictionJointDef.create();
        ropeJoint = RopeJointDef.create();

        return true;
    }

    /**
     * Destroy all definitions.
     */
    public static function destroy():Boolean {
        if (!bodyDef) {
            return false;
        }
        bodyDef.destroy();
        fixtureDef.destroy();
        polygonShape.destroy();
        circleShape.destroy();
        edgeShape.destroy();
        distanceJoint.destroy();
        gearJoint.destroy();
        mouseJoint.destroy();
        prismaticJoint.destroy();
        pulleyJoint.destroy();
        revoluteJoint.destroy();
        weldJoint.destroy();
        frictionJoint.destroy();
        ropeJoint.destroy();

        bodyDef = null;
        fixtureDef = null;
        polygonShape = null;
        circleShape = null;
        edgeShape = null;
        distanceJoint = null;
        gearJoint = null;
        mouseJoint = null;
        prismaticJoint = null;
        pulleyJoint = null;
        revoluteJoint = null;
        weldJoint = null;
        frictionJoint = null;
        ropeJoint = null;

        return true;
    }
}

}