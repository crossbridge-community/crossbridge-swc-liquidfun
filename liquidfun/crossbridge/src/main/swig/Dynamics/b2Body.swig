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

// @contributor: Andras Csizmadia <www.vpmedia.hu>

%module b2Body

// Rename constants
%rename (STATIC_BODY) b2_staticBody;
%rename (KINEMATIC_BODY) b2_kinematicBody;
%rename (DYNAMIC_BODY) b2_dynamicBody;
//%rename (BULLET_BODY) b2_bulletBody;

// Ignored classes and methods
%ignore b2Body::GetBody();
%ignore b2Body::GetContactList();
%ignore b2Body::GetFixtureList();
%ignore b2Body::GetJointList();
%ignore b2Body::GetNext();
%ignore b2Body::GetWorld();
%ignore b2Body::SetTransform(b2Vec2 const &,float32);

// Rename overloaded method
%rename(createFixture2) CreateFixture(const b2Shape* shape, float32 density);

// b2BodyDef extensions for easier access
%extend b2BodyDef {
    void SetPosition(float32 posX, float32 posY) {
        $self->position.x = posX;
        $self->position.y = posY;
    }
    void SetType(int type) {
        $self->type = (b2BodyType)type;
    }
};

// b2Body extensions for easier access
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

// Include original .h file for SWIG
%include "../../../Box2D/Box2D/Dynamics/b2Body.h"
