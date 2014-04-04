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

package org.liquidfun.tests {
import flash.events.Event;

import org.liquidfun.CircleShape;
import org.liquidfun.LiquidFun;
import org.liquidfun.ParticleGroup;
import org.liquidfun.ParticleGroupDef;
import org.liquidfun.ParticleSystem;
import org.liquidfun.ParticleSystemDef;
import org.liquidfun.utils.LFGlobals;

public class ParticlesExample extends BaseExample {

    public function ParticlesExample() {
    }

    override protected function onAdded(event:Event):void {
        super.onAdded(event);

        var particleSystemDef:ParticleSystemDef = ParticleSystemDef.create();
        particleSystemDef.dampingStrength = 0.2;
        particleSystemDef.radius = 1 / LFGlobals.scale;

        var particleSystem:ParticleSystem = new ParticleSystem();
        LFGlobals.world.createParticleSystem(particleSystemDef.swigCPtr);

        var particleShape:CircleShape = CircleShape.create();
        particleShape.radius = 10 / LFGlobals.scale;

        var particleGroupDef:ParticleGroupDef = ParticleGroupDef.create();
        particleGroupDef.shape = particleShape.swigCPtr;
        particleGroupDef.flags = LiquidFun.PARTICLE_ELASTIC;
        particleGroupDef.angle = -0.5;
        particleGroupDef.groupFlags = LiquidFun.PARTICLE_GROUP_SOLID;
        particleGroupDef.angularVelocity = 2;
        particleGroupDef.setXY(400 / LFGlobals.scale, 300 / LFGlobals.scale);
        particleGroupDef.setColor(0, 0, 255, 255);
        var particleGroup:ParticleGroup = new ParticleGroup();
        particleGroup.swigCPtr = particleSystem.createParticleGroup(particleGroupDef.swigCPtr);

        trace(particleSystem.getParticleCount());

    }

}
}
