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

%module b2CircleShape

// b2CircleShape extensions for easier access
%extend b2CircleShape {
    // Vec2 setter XY
    void SetPosition(float32 x, float32 y) {
        $self->m_p.Set(x, y);
    }
    // Vec2 getter X
    float32 GetX() {
        return $self->m_p.x;
    }
    // Vec2 getter Y
    float32 GetY() {
        return $self->m_p.y;
    }
};

// Include original .h file for SWIG
%include "../../../Box2D/Box2D/Collision/Shapes/b2CircleShape.h"