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

%module b2PolygonShape

// Rename overloaded method
%rename(setAsBox2) b2PolygonShape::SetAsBox(float32 hx, float32 hy, const b2Vec2& center, float32 angle);

/// b2PolygonShape extensions for easier Java access
%extend b2PolygonShape {
    void SetCentroid2(float32 x, float32 y) {
        $self->m_centroid.Set(x, y);
    }

    void SetAsBox3(
            float32 hx,
            float32 hy,
            float32 centerX,
            float32 centerY,
            float32 angle) {
        $self->SetAsBox(hx, hy, b2Vec2(centerX, centerY), angle);
    }
};

/// Include original .h file for SWIG
/// The original file is simple enough we will just pull it in
%include "../../../Box2D/Box2D/Collision/Shapes/b2PolygonShape.h"