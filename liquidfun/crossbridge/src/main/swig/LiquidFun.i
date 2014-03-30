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

// @see: http://www.swig.org/Doc2.0/SWIGDocumentation.html#SWIGPlus
// @see: http://www.ibiblio.org/gferg/ldp/GCC-Inline-Assembly-HOWTO.html
// @see: http://www.adobe.com/devnet-docs/flascc/README.html
// @see: http://www.adobe.com/devnet-docs/flascc/docs/Reference.html
// @see: http://www.adobe.com/devnet-docs/flascc/docs/capidocs/as3.html
// @see: https://github.com/adobe-flash/crossbridge/wiki/_pages

#ifdef SWIG
%module LiquidFun

///////////////////////////////////////
// Core Start
///////////////////////////////////////

%{

///////////////////////////////////////
// Includes
///////////////////////////////////////

// Flash headers
#include <AS3/AS3.h>
#include <Flash++.h>
// Module headers
#include <Box2D/Box2D.h>

///////////////////////////////////////
// Main
///////////////////////////////////////

int main() {
    AS3_Trace("LiquidFun loaded.");
    // We still need a main function for the SWC. this function must be called
    // so that all the static init code is executed before any library functions
    // are used.
    //
    // The main function for a library must throw an exception so that it does
    // not return normally. Returning normally would cause the static
    // destructors to be executed leaving the library in an unuseable state.
    AS3_GoAsync();
}

%}

///////////////////////////////////////
// Core End
///////////////////////////////////////

%apply int {unsigned char, signed char};

///////////////////////////////////////
// Features
///////////////////////////////////////

// @see: http://www.swig.org/Doc2.0/Customization.html#Customization_feature_flags

// enable compact default arguments feature
%feature("compactdefaultargs");

///////////////////////////////////////
// Renames
///////////////////////////////////////

// @see: http://www.swig.org/Doc2.0/SWIGPlus.html#SWIGPlus_ambiguity_resolution_renaming

// strip prefixes from everything
// @see: http://perldoc.perl.org/perlre.html
%rename("%(regex:/^(m_|b2_|b2)(.*)/\\2/)s") "";

// rename functions
%rename("%(lowercamelcase)s", %$isfunction) "";

///////////////////////////////////////
// Operators
///////////////////////////////////////

// @see: http://www.swig.org/Doc2.0/SWIGPlus.html#SWIGPlus_ambiguity_resolution_renaming

// Ignore most operators as they generate new AS3 or native objects.
// Note that swig will return a new AS3 object when a reference is returned,
// which could lead to multiple AS3 proxy objects pointing to the same C-
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

// This directive tells swig to pull in type information from CrossBridge library
// for the types declared in stdint.h and math.h.
%include "stdint.i"
%include "math.i"

// LiquidFun (Order is mandatory!)
%include "Common/b2Settings.swig"
%include "Common/b2Draw.swig"
%include "Common/b2Math.swig"
%include "Common/b2Stat.swig"
%include "Common/b2Timer.swig"
%include "Common/b2GrowableStack.swig"
%include "Common/b2IntrusiveList.swig"
%include "Common/b2FreeList.swig"
%include "Common/b2TrackedBlock.swig"
%include "Common/b2BlockAllocator.swig"
%include "Common/b2SlabAllocator.swig"
%include "Common/b2StackAllocator.swig"

%include "Collision/b2Collision.swig"
%include "Collision/b2Distance.swig"
%include "Collision/b2DynamicTree.swig"
%include "Collision/b2TimeOfImpact.swig"
%include "Collision/Shapes/b2Shape.swig"
%include "Collision/Shapes/b2CircleShape.swig"
%include "Collision/Shapes/b2ChainShape.swig"
%include "Collision/Shapes/b2EdgeShape.swig"
%include "Collision/Shapes/b2PolygonShape.swig"

%include "Dynamics/b2Body.swig"
%include "Dynamics/b2ContactManager.swig"
%include "Dynamics/b2Fixture.swig"
%include "Dynamics/b2Island.swig"
%include "Dynamics/b2TimeStep.swig"
%include "Dynamics/b2World.swig"
%include "Dynamics/b2WorldCallbacks.swig"

%include "Dynamics/Contacts/b2Contact.swig"

%include "Dynamics/Joints/b2Joint.swig"
%include "Dynamics/Joints/b2DistanceJoint.swig"
%include "Dynamics/Joints/b2FrictionJoint.swig"
%include "Dynamics/Joints/b2GearJoint.swig"
%include "Dynamics/Joints/b2MotorJoint.swig"
%include "Dynamics/Joints/b2MouseJoint.swig"
%include "Dynamics/Joints/b2PrismaticJoint.swig"
%include "Dynamics/Joints/b2PulleyJoint.swig"
%include "Dynamics/Joints/b2RevoluteJoint.swig"
%include "Dynamics/Joints/b2RopeJoint.swig"
%include "Dynamics/Joints/b2WeldJoint.swig"
%include "Dynamics/Joints/b2WheelJoint.swig"

%include "Particle/b2Particle.swig"
%include "Particle/b2ParticleGroup.swig"
%include "Particle/b2ParticleSystem.swig"

%include "Rope/b2Rope.swig"

#endif

///////////////////////////////////////
// END OF SWIG DIRECTIVES
///////////////////////////////////////

#include <Box2D/Box2D.h>