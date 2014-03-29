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

%module b2Draw

// Rename enums.
%rename (SHAPE_BIT) e_shapeBit;
%rename (JOINT_BIT) e_jointBit;
%rename (AABB_BIT) e_aabbBit;
%rename (PAIR_BIT) e_pairBit;
%rename (CENTER_OF_MASS_BIT) e_centerOfMassBit;
%rename (PARTICLE_BIT) e_particleBit;

// b2Draw extensions for easier access
%extend b2Draw {
    // Draw a closed polygon provided in CCW order.
    /*void DrawPolygon(const b2Vec2* vertices, int32 vertexCount, const b2Color& color) {
        // TODO
        inline_as3("trace(\"Draw::DrawPolygon\");");
    }*/
    // Draw a solid closed polygon provided in CCW order.
    /*void DrawSolidPolygon(const b2Vec2* vertices, int32 vertexCount, const b2Color& color) {
        // TODO
        inline_as3("trace(\"Draw::DrawSolidPolygon\");");
    }*/
    // Draw a circle.
    /*void DrawCircle(const b2Vec2& center, float32 radius, const b2Color& color) {
        // TODO
        inline_as3("trace(\"Draw::DrawCircle\");");
    }*/
    // Draw a solid circle.
    /*void DrawSolidCircle(const b2Vec2& center, float32 radius, const b2Vec2& axis, const b2Color& color) {
        // TODO
        inline_as3("trace(\"Draw::DrawSolidCircle\");");
    }*/
    // Draw a particle array
    /*void DrawParticles(const b2Vec2 *centers, float32 radius, const b2ParticleColor *colors, int32 count) {
        // TODO
        inline_as3("trace(\"Draw::DrawParticles\");");
    }*/
    // Draw a line segment.
    /*void DrawSegment(const b2Vec2& p1, const b2Vec2& p2, const b2Color& color){
        // TODO
        inline_as3("trace(\"Draw::DrawSegment\");");
    }*/
}
// Include original .h file for SWIG
%include "../../../Box2D/Box2D/Common/b2Draw.h"