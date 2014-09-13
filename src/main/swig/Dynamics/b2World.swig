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

%module b2World

//----------------------------------
//  Ignores
//----------------------------------

%ignore b2World(const b2Vec2& gravity);
%ignore b2World::Step(float32,int32,int32);
%ignore b2World::GetBodyList();
%ignore b2World::GetContactList();
%ignore b2World::GetJointList();
%ignore b2World::GetParticleSystemList();
%ignore b2World::SetGravity(b2Vec2 const &);
%ignore b2World::GetGravity();

//----------------------------------
//  Extensions
//----------------------------------

%extend b2World {
    // Constructor without the need for creating b2Vec2
    b2World(float32 gravityX, float32 gravityY) {
        b2World* pWorld = new b2World(b2Vec2(gravityX, gravityY));
        return pWorld;
    }
    // Setter XY
    void SetGravity(float32 gravityX, float32 gravityY) {
        $self->SetGravity(b2Vec2(gravityX, gravityY));
    }
    // Getter X
    float32 GetGravityX() {
        return $self->GetGravity().x;
    }
    // Getter Y
    float32 GetGravityY() {
        return $self->GetGravity().y;
    }
    // Legacy API support
    void QueryPoint(b2QueryCallback* callback, int x, int y) {
        b2AABB aabb;
        aabb.lowerBound.Set(x - b2_linearSlop, y - b2_linearSlop);
        aabb.upperBound.Set(x + b2_linearSlop, y + b2_linearSlop);
        $self->QueryAABB(callback, aabb);
    }
    // Getter for debug draw
    // Dev: Cannot expose private var
    /*bool HasDebugDraw() {
        return $self->m_debugDraw != NULL;
    }*/
};

//----------------------------------
//  Includes
//----------------------------------

%include "Box2D/Dynamics/b2World.h"