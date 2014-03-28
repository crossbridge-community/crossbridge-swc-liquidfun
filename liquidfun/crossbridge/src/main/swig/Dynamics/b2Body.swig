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

 // @contributor: Andras Csizmadia <www.vpmedia.eu>

%module b2Body

/// b2BodyDef class
// Ignore userData
//%ignore b2BodyDef::userData;

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

// Ignore userData
//%ignore b2Body::m_userData;
//%ignore b2Body::GetUserData;
//%ignore b2Body::SetUserData;

// Rename overloaded method
%rename(createFixture2) CreateFixture(const b2Shape* shape, float32 density);

// b2Body extensions for easier access
%extend b2Body {
    float32 GetPosX() {
        return $self->GetPosition().x;
    }

    float32 GetPosY() {
        return $self->GetPosition().y;
    }

    void SetTransform(float32 posX, float32 posY, float32 angle) {
        $self->SetTransform(b2Vec2(posX, posY), angle);
    }
};

/// Include original .h file for SWIG
/// The original file is simple enough we will just pull it in
%include "../../../Box2D/Box2D/Dynamics/b2Body.h"
