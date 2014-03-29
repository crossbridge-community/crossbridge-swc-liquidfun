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

%module b2Joint

// Rename constants
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

// AS3 specific override
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

// Include original .h file for SWIG
%include "../../../Box2D/Box2D/Dynamics/Joints/b2Joint.h"