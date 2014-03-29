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

%module b2Math

// b2Vec2 extensions for easier access
%extend b2Vec2 {
}

// b2Transform extensions for easier access
%extend b2Transform {
    // Vec2 getter X
    float32 getX() {
        return $self->p.x;
    }
    // Vec2 getter Y
    float32 getY() {
        return $self->p.y;
    }
    // TBD
    float32 getRotSin() {
        return $self->q.s;
    }
    // TBD
    float32 getRotCos() {
        return $self->q.c;
    }
}

// Include original .h file for SWIG
%include "../../../Box2D/Box2D/Common/b2Math.h"