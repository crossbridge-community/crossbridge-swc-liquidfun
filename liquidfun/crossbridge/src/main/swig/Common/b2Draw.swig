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

%module b2Draw

// Ignored classes and methods
%ignore b2Color::b2Color();

// Rename enums.
%rename (SHAPE_BIT) e_shapeBit;
%rename (JOINT_BIT) e_jointBit;
%rename (AABB_BIT) e_aabbBit;
%rename (PAIR_BIT) e_pairBit;
%rename (CENTER_OF_MASS_BIT) e_centerOfMassBit;
%rename (PARTICLE_BIT) e_particleBit;

// When using typemaps that require custom ActionScript types to be used in the generated
// AS3 wrappers you may need to import classes from custom packages.
// This can be achieved with the as3import directive that allows you to inject
// as3import annotations into the method declarations in the generated C/C++ wrapper code.
// %as3import("flash.display.Shape") DrawPolygon;

// b2Draw extensions for easier access
%extend b2Draw {
    // Draw a closed polygon provided in CCW order.
    /*void DrawPolygon(const b2Vec2* vertices, int32 vertexCount, const b2Color& color) {
        // TODO
    }*/
    // Draw a solid closed polygon provided in CCW order.
    /*void DrawSolidPolygon(const b2Vec2* vertices, int32 vertexCount, const b2Color& color) {
        // TODO
    }*/
    // Draw a circle.
    /*void DrawCircle(const b2Vec2& center, float32 radius, const b2Color& color) {
        // TODO
    }*/
    // Draw a solid circle.
    /*void DrawSolidCircle(const b2Vec2& center, float32 radius, const b2Vec2& axis, const b2Color& color) {
        // TODO
    }*/
    // Draw a particle array
    /*void DrawParticles(const b2Vec2 *centers, float32 radius, const b2ParticleColor *colors, int32 count) {
        // TODO
    }*/
    // Draw a line segment.
    /*void DrawSegment(const b2Vec2& p1, const b2Vec2& p2, const b2Color& color){
        // TODO
    }*/
}

// Include original .h file for SWIG
%include "../../../Box2D/Box2D/Common/b2Draw.h"