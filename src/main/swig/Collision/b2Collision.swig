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

%module b2Collision

//----------------------------------
//  Ignores
//----------------------------------

// methods
%ignore b2CollideCircles;
%ignore b2CollidePolygonAndCircle;
%ignore b2CollidePolygons;
%ignore b2CollideEdgeAndCircle;
%ignore b2CollideEdgeAndPolygon;
%ignore b2ClipSegmentToLine;
%ignore b2TestOverlap;
%ignore b2MixFriction;
%ignore b2MixRestitution;

//----------------------------------
//  Renames
//----------------------------------

%rename(combine2) b2AABB::Combine(b2AABB const &,b2AABB const &);

//----------------------------------
//  Extensions
//----------------------------------

%extend b2AABB {
    /*LOWER BOUND*/
    // Getter X
    float32 GetLowerBoundX() {
        return $self->lowerBound.x;
    }
    // Getter Y
    float32 GetLowerBoundY() {
        return $self->lowerBound.y;
    }
    /*UPPER BOUND*/
    // Getter X
    float32 GetUpperBoundX() {
        return $self->upperBound.x;
    }
    // Getter Y
    float32 GetUpperBoundY() {
        return $self->upperBound.y;
    }
    /*CENTER*/
    // Getter X
    float32 GetCenterX() {
        return $self->GetCenter().x;
    }
    // Getter Y
    float32 GetCenterY() {
        return $self->GetCenter().y;
    }
    /*EXTENTS*/
    // Getter X
    float32 GetExtentsX() {
        return $self->GetExtents().x;
    }
    // Getter Y
    float32 GetExtentsY() {
        return $self->GetExtents().y;
    }
}

//----------------------------------
//  Includes
//----------------------------------

%include "Box2D/Collision/b2Collision.h"