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

%rename (sayGoodbyeJ) b2DestructionListener::SayGoodbye(b2Joint* joint);
%rename (sayGoodbyeF) b2DestructionListener::SayGoodbye(b2Fixture* fixture);
%rename (sayGoodbyePG) b2DestructionListener::SayGoodbye(b2ParticleGroup* group);
%rename (sayGoodbyePS) b2DestructionListener::SayGoodbye(b2ParticleSystem* particleSystem, int32 index);

%rename (endContactPSF) b2ContactListener::EndContact(b2Fixture *,b2ParticleSystem *,int32);
%rename (endContactPS) b2ContactListener::EndContact(b2ParticleSystem *,int32,int32);

%rename (beginContactPSBC) b2ContactListener::BeginContact(b2ParticleSystem *,b2ParticleBodyContact *);
%rename (beginContactPSPC) b2ContactListener::BeginContact(b2ParticleSystem *,b2ParticleContact *);

%rename (shouldCollidePSF) b2ContactFilter::ShouldCollide(b2Fixture *,b2ParticleSystem *,int32);
%rename (shouldCollidePS) b2ContactFilter::ShouldCollide(b2ParticleSystem *,int32,int32);

//----------------------------------
//  Includes
//----------------------------------

%include "../../../Box2D/Box2D/Dynamics/b2WorldCallbacks.h"

//----------------------------------
//  Inline
//----------------------------------

%inline %{
    // Extended debug draw class definition
    class b2ContactListenerImpl : public b2ContactListener
    {
        private:
        public:

        b2ContactListenerImpl() {
            AS3_Trace("ContactListenerImpl::Created");
        }

        ~b2ContactListenerImpl() {
            AS3_Trace("ContactListenerImpl::Destroyed");
        }

        // @inheritDoc
        void BeginContact(b2Contact* contact) {
            // TODO
            AS3_Trace("ContactListenerImpl::BeginContact");
        }

        // @inheritDoc
        void EndContact(b2Contact* contact) {
            // TODO
            AS3_Trace("ContactListenerImpl::EndContact");
        }

        // @inheritDoc
        void BeginContact(b2ParticleSystem* particleSystem,
                                  b2ParticleBodyContact* particleBodyContact)
        {
            // TODO
            AS3_Trace("ContactListenerImpl::BeginContact");
        }

        // @inheritDoc
        void EndContact(b2Fixture* fixture,
                                b2ParticleSystem* particleSystem, int32 index)
        {
            // TODO
            AS3_Trace("ContactListenerImpl::EndContact");
        }

        // @inheritDoc
        void BeginContact(b2ParticleSystem* particleSystem,
                                  b2ParticleContact* particleContact)
        {
            // TODO
            AS3_Trace("ContactListenerImpl::BeginContact");
        }

        // @inheritDoc
        void EndContact(b2ParticleSystem* particleSystem,
                                int32 indexA, int32 indexB)
        {
            // TODO
            AS3_Trace("ContactListenerImpl::EndContact");
        }

        // @inheritDoc
        void PreSolve(b2Contact* contact, const b2Manifold* oldManifold)
        {
            // TODO
            AS3_Trace("ContactListenerImpl::PreSolve");
        }

        // @inheritDoc
        void PostSolve(b2Contact* contact, const b2ContactImpulse* impulse)
        {
            // TODO
            AS3_Trace("ContactListenerImpl::PostSolve");
        }

    };
%}


%inline %{
    // Extended debug draw class definition
    class b2DestructionListenerImpl : public b2DestructionListener
    {
        private:
        public:

        b2DestructionListenerImpl() {
            AS3_Trace("DestructionListenerImpl::Created");
        }

        ~b2DestructionListenerImpl() {
            AS3_Trace("DestructionListenerImpl::Destroyed");
        }

        void SayGoodbye(b2Joint* joint) {
            AS3_Trace("DestructionListenerImpl::SayGoodbyeJ");
        }

        void SayGoodbye(b2Fixture* fixture) {
            AS3_Trace("DestructionListenerImpl::SayGoodbyeF");
        }

        void SayGoodbye(b2ParticleGroup* group) {
            AS3_Trace("DestructionListenerImpl::SayGoodbyePG");
        }

        void SayGoodbye(b2ParticleSystem* particleSystem, int32 index) {
            AS3_Trace("DestructionListenerImpl::SayGoodbyePS");
        }
    };
%}


%inline %{
    // Extended debug draw class definition
    class b2ContactFilterImpl : public b2ContactFilter
    {
        private:
        public:

        b2ContactFilterImpl() {
            AS3_Trace("ContactFilterImpl::Created");
        }

        ~b2ContactFilterImpl() {
            AS3_Trace("ContactFilterImpl::Destroyed");
        }

        // @inheritDoc
        bool ShouldCollide(b2Fixture* fixtureA, b2Fixture* fixtureB) {
            // TODO
            return true;
        }

        // @inheritDoc
        bool ShouldCollide(b2Fixture* fixture,
                                   b2ParticleSystem* particleSystem,
                                   int32 particleIndex) {
            // TODO
            return true;
        }

        // @inheritDoc
        bool ShouldCollide(b2ParticleSystem* particleSystem,
                                   int32 particleIndexA, int32 particleIndexB) {
            // TODO
            return true;
        }

    };
%}


%inline %{
    // Extended debug draw class definition
    class b2QueryCallbackImpl : public b2QueryCallback
    {
        private:
        public:

        b2QueryCallbackImpl() {
            AS3_Trace("QueryCallbackImpl::Created");
        }

        ~b2QueryCallbackImpl() {
            AS3_Trace("QueryCallbackImpl::Destroyed");
        }

        // @inheritDoc
        bool ReportFixture(b2Fixture* fixture){
            return true;
        }

        // @inheritDoc
        bool ReportParticle(const b2ParticleSystem* particleSystem, int32 index) {
            // TODO
            return false;
        }

        // @inheritDoc
        bool ShouldQueryParticleSystem(const b2ParticleSystem* particleSystem) {
            // TODO
            return true;
        }

    };
%}


%inline %{
    // Extended debug draw class definition
    class b2RayCastCallbackImpl : public b2RayCastCallback
    {
        private:
        public:

        b2RayCastCallbackImpl() {
            AS3_Trace("RayCastCallbackImpl::Created");
        }

        ~b2RayCastCallbackImpl() {
            AS3_Trace("RayCastCallbackImpl::Destroyed");
        }

        // @inheritDoc
        float32 ReportFixture(	b2Fixture* fixture, const b2Vec2& point,
                                        const b2Vec2& normal, float32 fraction) {
            // TODO
            return 0;
        }

        // @inheritDoc
        float32 ReportParticle(const b2ParticleSystem* particleSystem,
                                       int32 index, const b2Vec2& point,
                                       const b2Vec2& normal, float32 fraction) {
            // TODO
            return 0;
        }

        // @inheritDoc
        bool ShouldQueryParticleSystem(const b2ParticleSystem* particleSystem) {
            // TODO
            return true;
        }

    };
%}
