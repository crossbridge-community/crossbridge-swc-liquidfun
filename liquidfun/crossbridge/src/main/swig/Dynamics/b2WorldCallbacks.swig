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

%module b2WorldCallbacks;

//----------------------------------
//  Renames
//----------------------------------

%rename (SayGoodbyeToJoint) b2DestructionListener::SayGoodbye(b2Joint* joint);
%rename (SayGoodbyeToFixture) b2DestructionListener::SayGoodbye(b2Fixture* fixture);
%rename (SayGoodbyeToParticleGroup) b2DestructionListener::SayGoodbye(b2ParticleGroup* group);
%rename (SayGoodbyeToParticleSystem) b2DestructionListener::SayGoodbye(b2ParticleSystem* particleSystem, int32 index);
%rename (EndContact2) b2ContactListener::EndContact(b2Fixture *,b2ParticleSystem *,int32);
%rename (EndContact3) b2ContactListener::EndContact(b2ParticleSystem *,int32,int32);
%rename (BeginContact2) b2ContactListener::BeginContact(b2ParticleSystem *,b2ParticleBodyContact *);
%rename (BeginContact3) b2ContactListener::BeginContact(b2ParticleSystem *,b2ParticleContact *);
%rename (ShouldCollide2) b2ContactFilter::ShouldCollide(b2Fixture *,b2ParticleSystem *,int32);
%rename (ShouldCollide3) b2ContactFilter::ShouldCollide(b2ParticleSystem *,int32,int32);

//----------------------------------
//  Includes
//----------------------------------

%include "../../../Box2D/Box2D/Dynamics/b2WorldCallbacks.h"