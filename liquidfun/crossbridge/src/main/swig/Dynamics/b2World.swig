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

%module b2World

// ignore default constructor, use extended one
%ignore b2World(const b2Vec2& gravity);

// b2World extensions for easier access
%extend b2World {
    // Constructor without the need for creating b2Vec2
    b2World(float32 gravityX, float32 gravityY) {
        b2World* pWorld = new b2World(b2Vec2(gravityX, gravityY));
        return pWorld;
    }

    void SetGravity(float32 gravityX, float32 gravityY) {
        $self->SetGravity(b2Vec2(gravityX, gravityY));
    }
};

// Include original .h file for SWIG
%include "../../../Box2D/Box2D/Dynamics/b2World.h"