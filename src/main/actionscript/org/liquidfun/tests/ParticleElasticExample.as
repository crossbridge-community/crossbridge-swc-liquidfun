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

import org.liquidfun.*;
import org.liquidfun.utils.LFGlobals;

public class ParticleElasticExample extends BaseExample {

    public function ParticleElasticExample() {
    }

    override protected function onAdded(event:Event):void {
        super.onAdded(event);

        var particleSystemDef:ParticleSystemDef = ParticleSystemDef.create();
        particleSystemDef.dampingStrength = 0.2;
        particleSystemDef.radius = 25 / LFGlobals.scale;

        var particleSystem:ParticleSystem = new ParticleSystem();
        particleSystem.swigCPtr = LFGlobals.world.createParticleSystem(particleSystemDef.swigCPtr);

        var particleShape:CircleShape = CircleShape.create();
        particleShape.radius = 150 / LFGlobals.scale;

        var particleGroupDef:ParticleGroupDef = ParticleGroupDef.create();
        particleGroupDef.shape = particleShape.swigCPtr;
        particleGroupDef.flags = LiquidFun.PARTICLE_ELASTIC;
        //particleGroupDef.angle = 1;
        particleGroupDef.groupFlags = LiquidFun.PARTICLE_GROUP_SOLID;
        //particleGroupDef.setVXY(0,1);
        particleGroupDef.setXY(400 / LFGlobals.scale, 300 / LFGlobals.scale);
        particleGroupDef.setColor(255, 255, 255, 255);

        var particleGroup:ParticleGroup = new ParticleGroup();
        particleGroup.swigCPtr = particleSystem.createParticleGroup(particleGroupDef.swigCPtr);

        systems.push(particleSystem);

        trace(particleSystem.getParticleCount() + "/" + particleSystem.getParticleGroupCount() + "/" + particleSystem.getMaxParticleCount())

    }

}
}
