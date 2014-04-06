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
// @see: http://www.ibiblio.org/gferg/ldp/GCC-Inline-Assembly-HOWTO.html
// @see: http://www.adobe.com/devnet-docs/flascc/README.html
// @see: http://www.adobe.com/devnet-docs/flascc/docs/Reference.html
// @see: http://www.adobe.com/devnet-docs/flascc/docs/capidocs/as3.html
// @see: https://github.com/adobe-flash/crossbridge/wiki/_pages

///////////////////////////////////////
// START OF SWIG
///////////////////////////////////////

#ifdef SWIG

%module LiquidFun

///////////////////////////////////////
// Core Start
///////////////////////////////////////

%{

///////////////////////////////////////
// Includes
///////////////////////////////////////

// CrossBridge
#include <AS3/AS3++.h>
#include <Flash++.h>

// Box2D Core
#include <Box2D/Box2D.h>

// Box2D Extras
#include <Box2D/Rope/b2Rope.h>

// Box2D Contributions
//#include <Box2D/Dynamics/Controllers/b2Controller.h>

///////////////////////////////////////
// Main
///////////////////////////////////////

// We still need a main function for the SWC. this function must be called
// so that all the static init code is executed before any library functions
// are used.
//
// The main function for a library must throw an exception so that it does
// not return normally. Returning normally would cause the static
// destructors to be executed leaving the library in an unuseable state.
int main() {
    #ifdef __FLASHPLAYER__
    // AS3++ Trace
    AS3_Trace("LiquidFun loaded.");
    // Flash++ Trace
    //AS3::local::var s = AS3::local::internal::new_String("LiquidFun loaded.");
    //AS3::local::internal::trace(s);
    #endif
    AS3_GoAsync();
}

%}

///////////////////////////////////////
// Core End
///////////////////////////////////////

// overwrite AS3 swig wrapper behaviour
%apply int {unsigned char, signed char};

///////////////////////////////////////
// Features
///////////////////////////////////////

// @see: http://www.swig.org/Doc2.0/Customization.html#Customization_feature_flags

// enable compact default arguments feature
// dev: does not seem make any difference with current project (wrappers are identical)
// %feature("compactdefaultargs");

// generate directors for all classes that have virtual methods
// dev: does not seem make any difference with current project (wrappers are identical)
// %feature("director");

// allow const reference typemaps
%naturalvar;

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

// ignore operators
%ignore operator=;
%ignore operator*=;
%ignore operator*;
%ignore operator+=;
%ignore operator+;
%ignore operator-=;
%ignore operator-;
%ignore operator/;
%ignore operator!=;
%ignore operator==;
%ignore operator();

///////////////////////////////////////
// Includes
///////////////////////////////////////

// LiquidFun (Order is mandatory!)
%include "Common/b2Settings.swig"
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
%include "Collision/b2BroadPhase.swig"
%include "Collision/b2Distance.swig"
%include "Collision/b2DynamicTree.swig"
%include "Collision/b2TimeOfImpact.swig"
%include "Collision/Shapes/b2Shape.swig"
%include "Collision/Shapes/b2CircleShape.swig"
%include "Collision/Shapes/b2ChainShape.swig"
%include "Collision/Shapes/b2EdgeShape.swig"
%include "Collision/Shapes/b2PolygonShape.swig"

%include "Dynamics/b2TimeStep.swig"

%include "Particle/b2Particle.swig"
%include "Particle/b2ParticleGroup.swig"
%include "Particle/b2ParticleSystem.swig"

%include "Dynamics/b2Body.swig"
%include "Dynamics/b2ContactManager.swig"
%include "Dynamics/b2Fixture.swig"
%include "Dynamics/b2Island.swig"
%include "Dynamics/b2WorldCallbacks.swig"
%include "Dynamics/b2World.swig"

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

// Extras
%include "Rope/b2Rope.swig"

// Contributions
//%include "Dynamics/Controllers/b2Controller.swig"

// Debug Draw
%include "Common/b2Draw.swig"

#endif

///////////////////////////////////////
// END OF SWIG
///////////////////////////////////////

#include <Box2D/Box2D.h>