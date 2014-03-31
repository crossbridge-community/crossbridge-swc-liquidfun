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
public class ParticleSystemDefTest extends Sprite {


    public function ParticleSystemDefTest() {
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
         radius = 1.0f;
         pressureStrength = 0.05f;
         dampingStrength = 1.0f;
         elasticStrength = 0.25f;
         springStrength = 0.25f;
         viscousStrength = 0.25f;
         surfaceTensionPressureStrength = 0.2f;
         surfaceTensionNormalStrength = 0.2f;
         repulsiveStrength = 1.0f;
         powderStrength = 0.5f;
         ejectionStrength = 0.5f;
         staticPressureStrength = 0.2f;
         staticPressureRelaxation = 0.2f;
         staticPressureIterations = 8;
         colorMixingStrength = 0.5f;
         destroyByAge = true;
         lifetimeGranularity = 1.0f / 60.0f;
         */
        var particleSystemDef:ParticleSystemDef = ParticleSystemDef.create();
        // default properties
        Assert.assertEquals(particleSystemDef.radius, 1);
        Assert.assertEquals(particleSystemDef.pressureStrength, 0.05000000074505806);
        Assert.assertEquals(particleSystemDef.dampingStrength, 1);
        Assert.assertEquals(particleSystemDef.elasticStrength, 0.25);
        Assert.assertEquals(particleSystemDef.viscousStrength, 0.25);
        // cleanup
        particleSystemDef.destroy();
        particleSystemDef = null;
    }

    [Test]
    public function test_get_set():void {
        var particleSystemDef:ParticleSystemDef = ParticleSystemDef.create();
        // colorMixingStrength
        particleSystemDef.colorMixingStrength = 1;
        // cleanup
        particleSystemDef.destroy();
        particleSystemDef = null;
    }

}
}