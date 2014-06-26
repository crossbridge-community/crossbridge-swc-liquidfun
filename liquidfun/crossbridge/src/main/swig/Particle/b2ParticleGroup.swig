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

%module b2ParticleGroup

//----------------------------------
//  Ignores
//----------------------------------

%ignore b2ParticleGroup::GetNext();
%ignore b2ParticleGroup::GetParticleSystem();
%ignore b2ParticleGroup::DestroyParticles();

//----------------------------------
//  Renames
//----------------------------------

%rename (PARTICLE_GROUP_SOLID) b2_solidParticleGroup;
%rename (PARTICLE_GROUP_RIGID) b2_rigidParticleGroup;
%rename (PARTICLE_GROUP_CAN_BE_EMPTY) b2_particleGroupCanBeEmpty;
%rename (PARTICLE_GROUP_WILL_BE_DESTROYED) b2_particleGroupWillBeDestroyed;
%rename (PARTICLE_GROUP_NEEDS_UPDATE_DEPTH) b2_particleGroupNeedsUpdateDepth;
%rename (PARTICLE_GROUP_INTERNAL_MASK) b2_particleGroupInternalMask;

//----------------------------------
//  Extensions
//----------------------------------

%extend b2ParticleGroupDef {
    /*POSITION*/
    // Getter X
    float32 GetX() {
        return $self->position.x;
    }
    // Setter X
    void SetX(float32 posX) {
            $self->position.x = posX;
    }
    // Getter Y
    float32 GetY() {
        return $self->position.y;
    }
    // Setter Y
    void SetY(float32 posY) {
            $self->position.y = posY;
    }
    // Setter XY
    void SetXY(float32 posX, float32 posY) {
        $self->position.x = posX;
        $self->position.y = posY;
    }
    /* VELOCITY */
    // Getter X
    float32 GetVX() {
        return $self->linearVelocity.x;
    }
    // Setter X
    void SetVX(float32 posX) {
            $self->linearVelocity.x = posX;
    }
    // Getter Y
    float32 GetVY() {
        return $self->linearVelocity.y;
    }
    // Setter Y
    void SetVY(float32 posY) {
            $self->linearVelocity.y = posY;
    }
    // Setter XY
    void SetVXY(float32 posX, float32 posY) {
        $self->linearVelocity.x = posX;
        $self->linearVelocity.y = posY;
    }
    /*OTHER*/
    // Setter Color
    void setColor(int32 r, int32 g, int32 b, int32 a) {
        $self->color.Set(r, g, b, a);
    }
}

%extend b2ParticleGroup {
    /*CENTER*/
    // Getter X
    float32 GetCenterX() {
        return $self->GetCenter().x;
    }
    // Getter Y
    float32 GetCenterY() {
        return $self->GetCenter().y;
    }
    /*LINEAR VELOCITY*/
    // Getter X
    float32 GetLinearVelocityX() {
        return $self->GetLinearVelocity().x;
    }
    // Getter Y
    float32 GetLinearVelocityY() {
        return $self->GetLinearVelocity().y;
    }
}

//----------------------------------
//  Includes
//----------------------------------

%include "Box2D/Particle/b2ParticleGroup.h"
