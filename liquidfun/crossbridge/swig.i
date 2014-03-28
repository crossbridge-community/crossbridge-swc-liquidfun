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

// @see: http://www.swig.org/Doc2.0/SWIGDocumentation.html#SWIGPlus

#ifdef SWIG
%module LiquidFun

%{
#include "AS3/AS3.h"
#include <Box2D/Box2D.h>
    
int main() {
AS3_GoAsync();
}

%}

/* c99 int types */
%include "stdint.i"

/* grabbed liquidfun java directives */

// allow const reference typemaps
%naturalvar;

///////////////////////////////////////
// Global Rename Definitions
///////////////////////////////////////

// rename classes (%$isclass)
%rename("%(strip:[b2])s") "";

// rename functions
%rename("%(lowercamelcase)s", %$isfunction) "";

// rename variables
%rename("%(regex:/^(m_|b2_)(.*)/\\2/)s", %$isvariable) "";

// rename enums
%rename("%(strip:[b2_])s", %$isenumitem) "";

///////////////////////////////////////
// Global Operator Definitions
///////////////////////////////////////

// Ignore most operators as they generate new Java or native objects.
// Note that swig will return a new Java object when a reference is returned,
// which could lead to multiple Java proxy objects pointing to the same C-
// memory.
// Alas, there doesn't seem to be any wildcard symbols other than *, which
// doesn't work in this case (operator* maps to the * operator).
%ignore operator=;
%ignore operator*=;
%ignore operator*;
%ignore operator+=;
%ignore operator+;
%ignore operator-=;
%ignore operator-;

// rename the == operator
%rename(equals) operator==;

/* grabbed default rename directives for overloaded operators. */
%rename(__add__)	     operator+;
%rename(__pos__)	     operator+();
%rename(__pos__)	     operator+() const;

%rename(__sub__)	     operator-;
%rename(__neg__)	     operator-() const;
%rename(__neg__)	     operator-();

%rename(__mul__)	     operator*;
%rename(__deref__)	     operator*();
%rename(__deref__)	     operator*() const;

%rename(__div__)	     operator/;
%rename(__mod__)	     operator%;
%rename(__logxor__)	     operator^;
%rename(__logand__)	     operator&;
%rename(__logior__)	     operator|;
%rename(__lognot__)	     operator~();
%rename(__lognot__)	     operator~() const;

%rename(__not__)	     operator!();
%rename(__not__)	     operator!() const;

%rename(__assign__)	     operator=;

%rename(__add_assign__)      operator+=;
%rename(__sub_assign__)	     operator-=;
%rename(__mul_assign__)	     operator*=;
%rename(__div_assign__)	     operator/=;
%rename(__mod_assign__)	     operator%=;
%rename(__logxor_assign__)   operator^=;
%rename(__logand_assign__)   operator&=;
%rename(__logior_assign__)   operator|=;

%rename(__lshift__)	     operator<<;
%rename(__lshift_assign__)   operator<<=;
%rename(__rshift__)	     operator>>;
%rename(__rshift_assign__)   operator>>=;

%rename(__eq__)		     operator==;
%rename(__ne__)		     operator!=;
%rename(__lt__)		     operator<;
%rename(__gt__)		     operator>;
%rename(__lte__)	     operator<=;
%rename(__gte__)	     operator>=;

%rename(__and__)	     operator&&;
%rename(__or__)		     operator||;

%rename(__preincr__)	     operator++();
%rename(__postincr__)	     operator++(int);
%rename(__predecr__)	     operator--();
%rename(__postdecr__)	     operator--(int);

%rename(__comma__)	     operator,();
%rename(__comma__)	     operator,() const;

%rename(__member_ref__)      operator->;
%rename(__member_func_ref__) operator->*;

%rename(__funcall__)	     operator();
%rename(__aref__)	     operator[];

///////////////////////////////////////
// Includes
///////////////////////////////////////

// We need to include b2Settings.h separately for swig to parse certain macros
%include "Common/b2Settings.swig"

// Include all the swig files
%include "Collision/Shapes/b2Shape.swig" // include before derived classes
%include "Collision/Shapes/b2CircleShape.swig"
%include "Collision/Shapes/b2ChainShape.swig"
%include "Collision/Shapes/b2EdgeShape.swig"
%include "Collision/Shapes/b2PolygonShape.swig"

%include "Common/b2Draw.swig"
%include "Common/b2Math.swig"

%include "Dynamics/b2Body.swig"
%include "Dynamics/b2ContactManager.swig"
%include "Dynamics/b2Fixture.swig"
%include "Dynamics/b2Island.swig"
%include "Dynamics/b2TimeStep.swig"
%include "Dynamics/b2World.swig"
%include "Dynamics/b2WorldCallbacks.swig"

%include "Particle/b2Particle.swig"
%include "Particle/b2ParticleGroup.swig"
%include "Particle/b2ParticleSystem.swig"

%include "Rope/b2Rope.swig"

///////////////////////////////////////
// Custom Bug Fixes
///////////////////////////////////////

// solves duplicate destroy() method error.
// TODO: make rename rule
%ignore b2ContactManager::Destroy(b2Contact* c);

#endif

///////////////////////////////////////
// END OF SWIG DIRECTIVES
///////////////////////////////////////

#include <Box2D/Box2D.h>