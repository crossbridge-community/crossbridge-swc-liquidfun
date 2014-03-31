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
public class Vec3Test extends Sprite {

    private var vec3:Vec3;
    private var _x:Number;
    private var _y:Number;

    public function Vec3Test() {
        CModule.rootSprite = this;
        super();
    }

    [Before]
    public function setUp():void {
        vec3 = Vec3.create();
        //trace(this, _x, _y, vec3.x, vec3.y);
        vec3.x = _x = 0.1001;
        vec3.y = _y = 0.9009;
        //trace(this, _x, _y, vec3.x, vec3.y);
    }

    [After]
    public function tearDown():void {
        vec3.destroy();
        vec3 = null;
    }

    [BeforeClass]
    public static function setUpBeforeClass():void {
    }

    [AfterClass]
    public static function tearDownAfterClass():void {
    }

    [Test]
    public function test_get_x():void {
        const diff:Number = Math.max(vec3.x, _x) - Math.min(vec3.x, _x);
        Assert.assertTrue(diff < 0.00001);
    }

    [Test]
    public function test_get_y():void {
        const diff:Number = Math.max(vec3.y, _y) - Math.min(vec3.y, _y);
        Assert.assertTrue(diff < 0.00001);
    }

    [Test]
    public function test_length():void {
        Assert.assertTrue(vec3.length() != NaN);
    }

    [Test]
    public function test_normalize():void {
        Assert.assertTrue(vec3.normalize() != NaN);
    }

}
}