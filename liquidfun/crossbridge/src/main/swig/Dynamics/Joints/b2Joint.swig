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

%module b2Joint

//----------------------------------
//  Ignores
//----------------------------------

%ignore b2Joint::GetNext();
%ignore b2Jacobian;

//----------------------------------
//  Renames
//----------------------------------

%rename (UNKNOWN_JOINT) e_unknownJoint;
%rename (REVOLUTE_JOINT) e_revoluteJoint;
%rename (PRISMATIC_JOINT) e_prismaticJoint;
%rename (DISTANCE_JOINT) e_distanceJoint;
%rename (PULLEY_JOINT) e_pulleyJoint;
%rename (MOUSE_JOINT) e_mouseJoint;
%rename (GEAR_JOINT) e_gearJoint;
%rename (WHEEL_JOINT) e_wheelJoint;
%rename (WELD_JOINT) e_weldJoint;
%rename (FRICTION_JOINT) e_frictionJoint;
%rename (ROPE_JOINT) e_ropeJoint;
%rename (MOTOR_JOINT) e_motorJoint;
%rename (INACTIVE_LIMIT) e_inactiveLimit;
%rename (LOWER_LIMIT) e_atLowerLimit;
%rename (UPPER_LIMIT) e_atUpperLimit;
%rename (EQUAL_LIMITS) e_equalLimits;

//----------------------------------
//  Overrides
//----------------------------------

// When a derived C++ class implements a virtual function as public
// that was declared protected/private in the base class you will need
// to suppress the usual use of the "override" keyword.

%as3suppressoverride b2DistanceJoint::~b2DistanceJoint;
%as3suppressoverride b2FrictionJoint::~b2FrictionJoint;
%as3suppressoverride b2GearJoint::~b2GearJoint;
%as3suppressoverride b2MotorJoint::~b2MotorJoint;
%as3suppressoverride b2MouseJoint::~b2MouseJoint;
%as3suppressoverride b2PrismaticJoint::~b2PrismaticJoint;
%as3suppressoverride b2PulleyJoint::~b2PulleyJoint;
%as3suppressoverride b2RevoluteJoint::~b2RevoluteJoint;
%as3suppressoverride b2RopeJoint::~b2RopeJoint;
%as3suppressoverride b2WeldJoint::~b2WeldJoint;
%as3suppressoverride b2WheelJoint::~b2WheelJoint;

//----------------------------------
//  Includes
//----------------------------------

%include "../../../Box2D/Box2D/Dynamics/Joints/b2Joint.h"