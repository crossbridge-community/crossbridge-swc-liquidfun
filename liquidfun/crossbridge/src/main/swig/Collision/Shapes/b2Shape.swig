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

%module b2Shape

//----------------------------------
//  Ignores
//----------------------------------

// possibly memory leak
%ignore b2Shape::Clone;

//----------------------------------
//  Renames
//----------------------------------

%rename (CIRCLE) e_circle;
%rename (EDGE) e_edge;
%rename (POLYGON) e_polygon;
%rename (CHAIN) e_chain;
%rename (TYPE_COUNT) e_typeCount;
%rename (BaseShape) b2Shape;

//----------------------------------
//  Extensions
//----------------------------------

%extend b2MassData {
    // Center getter X
    float32 GetCenterX() {
        return $self->center.x;
    }
    // Center getter Y
    float32 GetCenterY() {
        return $self->center.y;
    }
};

//----------------------------------
//  Includes
//----------------------------------

%include "Box2D/Collision/Shapes/b2Shape.h"