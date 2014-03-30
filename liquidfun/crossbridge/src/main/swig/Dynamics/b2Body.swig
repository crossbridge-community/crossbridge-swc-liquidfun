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

%module b2Body

//----------------------------------
//  Ignores
//----------------------------------

%ignore b2Body::GetBody();
%ignore b2Body::GetContactList();
%ignore b2Body::GetFixtureList();
%ignore b2Body::GetJointList();
%ignore b2Body::GetNext();
%ignore b2Body::GetWorld();
%ignore b2Body::SetTransform(b2Vec2 const &,float32);

//----------------------------------
//  Renames
//----------------------------------

%rename (STATIC_BODY) b2_staticBody;
%rename (KINEMATIC_BODY) b2_kinematicBody;
%rename (DYNAMIC_BODY) b2_dynamicBody;
//%rename (BULLET_BODY) b2_bulletBody;
%rename(createFixture2) CreateFixture(const b2Shape* shape, float32 density);

//----------------------------------
//  Extensions
//----------------------------------

%extend b2BodyDef {
    void SetPosition(float32 posX, float32 posY) {
        $self->position.x = posX;
        $self->position.y = posY;
    }
    void SetType(int type) {
        $self->type = (b2BodyType)type;
    }
};

%extend b2Body {
    float32 GetX() {
        return $self->GetPosition().x;
    }

    float32 GetY() {
        return $self->GetPosition().y;
    }

    void SetTransform(float32 posX, float32 posY, float32 angle) {
        $self->SetTransform(b2Vec2(posX, posY), angle);
    }
};

//----------------------------------
//  Includes
//----------------------------------

%include "../../../Box2D/Box2D/Dynamics/b2Body.h"
