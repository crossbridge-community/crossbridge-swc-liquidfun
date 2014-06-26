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

%module b2CircleShape

//----------------------------------
//  Extensions
//----------------------------------

%extend b2CircleShape {
    // Getter X
    float32 GetX() {
        return $self->m_p.x;
    }
    // Setter X
    void SetX(float32 posX) {
            $self->m_p.x = posX;
    }
    // Getter Y
    float32 GetY() {
        return $self->m_p.y;
    }
    // Setter Y
    void SetY(float32 posY) {
            $self->m_p.y = posY;
    }
    // Setter XY
    void SetXY(float32 posX, float32 posY) {
        $self->m_p.x = posX;
        $self->m_p.y = posY;
    }
};

//----------------------------------
//  Includes
//----------------------------------

%include "Box2D/Collision/Shapes/b2CircleShape.h"