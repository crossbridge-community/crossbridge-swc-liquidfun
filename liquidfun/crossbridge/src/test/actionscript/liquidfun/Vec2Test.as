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

public class Vec2Test extends Sprite {

    private var vec2:Vec2;
    private var _x:Number;
    private var _y:Number;

    public function Vec2Test() {
        CModule.rootSprite = this;
        super();
    }

    [Before]
    public function setUp():void {
        vec2 = Vec2.create();
        trace(_x, _y, vec2.x, vec2.y);
        vec2.x = _x = 0.1001;
        vec2.y = _y = 0.9009;
        trace(_x, _y, vec2.x, vec2.y);
    }

    [After]
    public function tearDown():void {
        vec2.destroy();
        vec2 = null;
    }

    [BeforeClass]
    public static function setUpBeforeClass():void {
    }

    [AfterClass]
    public static function tearDownAfterClass():void {
    }

    [Test]
    public function test_get_x():void {
        const diff:Number = Math.max(vec2.x, _x) - Math.min(vec2.x, _x);
        Assert.assertTrue(diff < 0.00001);
    }

    [Test]
    public function test_get_y():void {
        const diff:Number = Math.max(vec2.y, _y) - Math.min(vec2.y, _y);
        Assert.assertTrue(diff < 0.00001);
    }

    [Test]
    public function test_isValid():void {
        Assert.assertTrue(vec2.isValid());
    }

    [Test]
    public function test_length():void {
        Assert.assertTrue(vec2.length() != NaN);
    }

    [Test]
    public function test_lengthSquared():void {
        Assert.assertTrue(vec2.lengthSquared() != NaN);
    }

    [Test]
    public function test_skew():void {
        vec2.skew();
    }

    [Test]
    public function test_normalize():void {
        Assert.assertTrue(vec2.normalize() != NaN);
    }

}
}