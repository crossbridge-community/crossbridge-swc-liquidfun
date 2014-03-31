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
import crossbridge.liquidfun._wrap_polygonRadius;

import flash.display.Sprite;

import flexunit.framework.Assert;

/**
 * TBD
 *
 * @author Andras Csizmadia
 */
public class EdgeShapeTest extends Sprite {

    public function EdgeShapeTest() {
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
         m_type = e_edge;
         m_radius = b2_polygonRadius;
         m_vertex0.x = 0.0f;
         m_vertex0.y = 0.0f;
         m_vertex3.x = 0.0f;
         m_vertex3.y = 0.0f;
         m_hasVertex0 = false;
         m_hasVertex3 = false;
         */
        var shape:EdgeShape = EdgeShape.create();
        Assert.assertEquals(shape.type, BaseShape.EDGE);
        Assert.assertEquals(shape.getType(), BaseShape.EDGE);
        Assert.assertEquals(shape.radius, 0.009999999776482582);
        Assert.assertEquals(shape.hasVertex0, false);
        Assert.assertEquals(shape.hasVertex3, false);
        Assert.assertEquals(shape.getChildCount(), 1);
        shape.destroy();
    }

    [Test]
    public function test_set():void {
        var shape:EdgeShape = EdgeShape.create();
        shape.set(1,1,2,2);
        shape.destroy();
    }

}
}