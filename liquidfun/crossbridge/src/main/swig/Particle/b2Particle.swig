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

%module b2Particle

// Ignore methods that generate new objects
%ignore b2ParticleColor::GetColor;
%ignore b2ParticleColor::b2ParticleColor();
%ignore b2ParticleColor::b2ParticleColor(b2Color const &);
%ignore b2ParticleColor::Set(b2Color const &);
%ignore b2ParticleHandle;

// solves:
// Warning 401: Nothing known about base class 'b2TypedIntrusiveListNode< b2ParticleHandle >'. Ignored.
// Warning 401: Maybe you forgot to instantiate 'b2TypedIntrusiveListNode< b2ParticleHandle >' using %template.
// @see: http://www.swig.org/Doc2.0/SWIGPlus.html#SWIGPlus_nn30
// generates make error with code 139
// %template(typedIntrusiveParticleHandleList) b2TypedIntrusiveListNode<b2ParticleHandle>;

// b2ParticleColor extensions for easier access
%extend b2ParticleColor {
   /* void testMethod() {}*/
}

// b2ParticleDef extensions for easier access
%extend b2ParticleDef {
    void setPosition(float32 x, float32 y) {
        $self->position.Set(x, y);
    }

    void setColor(int32 r, int32 g, int32 b, int32 a) {
        $self->color.Set(r, g, b, a);
    }
}

// Include original .h file for SWIG
%include "../../../Box2D/Box2D/Particle/b2Particle.h"
