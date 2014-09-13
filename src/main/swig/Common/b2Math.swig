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

%module b2Math

//----------------------------------
//  Ignores
//----------------------------------

%ignore b2Mat22;
%ignore b2Mat33;
%ignore b2Cross;
%ignore b2Rot;
%ignore b2Dot;
%ignore b2Mul;
%ignore b2MulT;
%ignore b2Abs;
%ignore b2Transform::b2Transform(b2Vec2 const &,b2Rot const &);
%ignore b2Vec2::b2Vec2(float32,float32);
%ignore b2Vec3::b2Vec3(float32,float32,float32);
%ignore b2Vec4::b2Vec4(float32,float32,float32,float32);

//----------------------------------
//  Extensions
//----------------------------------

%extend b2Vec2 {
    // TODO
}

%extend b2Transform {
    /*POSITION*/
    // Getter X
    float32 getX() {
        return $self->p.x;
    }
    // Getter Y
    float32 getY() {
        return $self->p.y;
    }
    /*ROTATION*/
    // Getter Sin
    float32 getRotSin() {
        return $self->q.s;
    }
    // Getter Cos
    float32 getRotCos() {
        return $self->q.c;
    }
}

//----------------------------------
//  Includes
//----------------------------------

%include "Box2D/Common/b2Math.h"