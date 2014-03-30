/*
 * Copyright (c) 2014 Google, Inc.
 *
 * This software is provided 'as-is', without any express or implied
 * warranty.  In no event will the authors be held liable for any damages
 * arising from the use of this software.
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 * 1. The origin of this software must not be misrepresented; you must not
 * claim that you wrote the original software. If you use this software
 * in a product, an acknowledgment in the product documentation would be
 * appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 * misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 */

%module b2Particle

// Ignore methods that generate new objects
%ignore b2ParticleColor::GetColor;
%ignore b2ParticleColor::b2ParticleColor();
%ignore b2ParticleColor::b2ParticleColor(b2Color const &);

// b2ParticleColor extensions for easier access
/*%extend b2ParticleColor {
    void testMethod() {
     }
}*/

// b2ParticleDef extensions for easier access
%extend b2ParticleDef {
    void setPosition(float32 x, float32 y) {
        $self->position.Set(x, y);
    }

    void setColor(int32 r, int32 g, int32 b, int32 a) {
        $self->color.Set(r, g, b, a);
    }
}

// Include original .h file for SWIG
%include "../../../Box2D/Box2D/Particle/b2Particle.h"
