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

package liquidfun {
import crossbridge.liquidfun.CModule;

import flash.display.Sprite;

import flexunit.framework.Assert;

/**
 * TBD
 *
 * @author Andras Csizmadia
 */
public class PolygonShapeTest extends Sprite {

    public function PolygonShapeTest() {
        CModule.rootSprite = this;
        super();
    }

    [Before]
    public function setUp():void {
    }

    [After]
    public function tearDown():void {
    }

    [BeforeClass]
    public static function setUpBeforeClass():void {
    }

    [AfterClass]
    public static function tearDownAfterClass():void {
    }

    [Test]
    public function test_construct():void {
        /*
         m_type = e_polygon;
         m_radius = b2_polygonRadius;
         m_count = 0;
         m_centroid.SetZero();
         */
        var shape:PolygonShape = PolygonShape.create();
        Assert.assertEquals(shape.type, BaseShape.POLYGON);
        Assert.assertEquals(shape.count, 0);
        Assert.assertEquals(shape.getChildCount(), 1);
        shape.destroy();

    }

    /*[Test]
     public function test_set_vertices():void {
     var shape:PolygonShape = PolygonShape.create();
     //dynamicBox.setAsBox(1.0, 1.0);
     // <-1 -1> <1 -1> <1 1> <-1 1>
     var vertices:Vector.<Vec2> = new <Vec2>[];
     var vec:Vec2;

     vec = Vec2.create();
     vec.set(-1, -1);
     vertices.push(vec);

     vec = Vec2.create();
     vec.set(1, -1);
     vertices.push(vec);

     vec = Vec2.create();
     vec.set(1, 1);
     vertices.push(vec);

     vec = Vec2.create();
     vec.set(-1, 1);
     vertices.push(vec);

     vertices.reverse();

     var n:uint = vertices.length;
     var verticePtrsPtr:int = CModule.malloc(n * 4);
     var verticePtrs:Vector.<int> = new <int>[];
     for (var j:uint = 0; j < n; j++) {
     verticePtrs.push(vertices[j].swigCPtr);
     }
     CModule.writeIntVector(verticePtrsPtr, verticePtrs);
     // 4305024,4305016,4305008,4305000
     trace(this, CModule.readIntVector(verticePtrsPtr, verticePtrs.length));
     shape.set(verticePtrsPtr, 4);

     Assert.assertEquals(shape.getVertexCount(), 4);

     var n1:Vec2 = Vec2.create();
     var n2:Vec2 = Vec2.create();
     var n3:Vec2 = Vec2.create();
     var n4:Vec2 = Vec2.create();
     n1.swigCPtr = shape.getVertex(0);
     n2.swigCPtr = shape.getVertex(1);
     n3.swigCPtr = shape.getVertex(2);
     n4.swigCPtr = shape.getVertex(3);
     // <-1, -1> <1, -1> <1, 1> <-1, 1>
     trace(this, "<" + n1.x + " " + n1.y + ">"
     + "<" + n2.x + " " + n2.y + ">"
     + "<" + n3.x + " " + n3.y + ">"
     + "<" + n4.x + " " + n4.y + ">");

     // cleanup
     CModule.free(verticePtrsPtr);
     shape.destroy();
     }*/

}
}