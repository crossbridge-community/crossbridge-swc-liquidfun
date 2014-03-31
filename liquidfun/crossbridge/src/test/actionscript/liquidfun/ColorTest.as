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

public class ColorTest extends Sprite {

    public function ColorTest() {
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
    public function test_reconstruct():void {
        var color:Color = Color.create(255, 254, 253);
        Assert.assertEquals(color.r, 255);
        Assert.assertEquals(color.g, 254);
        Assert.assertEquals(color.b, 253);
        color.destroy();
        // Destroy does not clear color values
        /*Assert.assertEquals(color.r, 0);
         Assert.assertEquals(color.g, 0);
         Assert.assertEquals(color.b, 0);*/
        color = Color.create(252, 251, 250);
        Assert.assertEquals(color.r, 252);
        Assert.assertEquals(color.g, 251);
        Assert.assertEquals(color.b, 250);
        // cleanup
        color.destroy();
        color = null;
    }

    [Test]
    public function test_destroy_twice():void {
        var color:Color = Color.create(255, 254, 253);
        color.destroy();
        // cleanup
        color.destroy();
        color = null;
    }

    [Test]
    public function test_construct_zero():void {
        var color:Color = Color.create(0, 0, 0);
        Assert.assertEquals(color.r, 0);
        Assert.assertEquals(color.g, 0);
        Assert.assertEquals(color.b, 0);
        // cleanup
        color.destroy();
        color = null;
    }

    [Test]
    public function test_construct_salmon():void {
        var color:Color = Color.create(0xFA, 0x80, 0x72);
        Assert.assertEquals(color.r, 0xFA);
        Assert.assertEquals(color.g, 0x80);
        Assert.assertEquals(color.b, 0x72);
        // cleanup
        color.destroy();
        color = null;
    }
}
}