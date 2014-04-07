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
    // Extended class definition
    class b2ContactListenerImpl : public b2ContactListener
    {
        private:
        public:
            void (*onBeginContact)(b2Contact*);
            void (*onEndContact)(b2Contact*);
            void (*onBeginPSContact)(b2ParticleSystem*, b2ParticleBodyContact*);
            void (*onEndPSContact)(b2Fixture*, b2ParticleSystem*, int32);
            void (*onBeginParticleContact)(b2ParticleSystem*, b2ParticleContact*);
            void (*onEndParticleContact)(b2ParticleSystem*, int32, int32);
            void (*onPreSolve)(b2Contact*, const b2Manifold*);
            void (*onPostSolve)(b2Contact*, const b2ContactImpulse*);

        b2ContactListenerImpl() {
            AS3_Trace("ContactListenerImpl::Created");
        }

        ~b2ContactListenerImpl() {
            AS3_Trace("ContactListenerImpl::Destroyed");
        }

        // @inheritDoc
        void BeginContact(b2Contact* contact) {
            if(onBeginContact != NULL)
                onBeginContact(contact);
        }

        // @inheritDoc
        void EndContact(b2Contact* contact) {
            if(onEndContact != NULL)
                onEndContact(contact);
        }

        // @inheritDoc
        void BeginContact(b2ParticleSystem* particleSystem, b2ParticleBodyContact* particleBodyContact) {
            if(onBeginPSContact != NULL)
                onBeginPSContact(particleSystem, particleBodyContact);
        }

        // @inheritDoc
        void EndContact(b2Fixture* fixture, b2ParticleSystem* particleSystem, int32 index) {
            if(onEndPSContact != NULL)
                onEndPSContact(fixture, particleSystem, index);
        }

        // @inheritDoc
        void BeginContact(b2ParticleSystem* particleSystem, b2ParticleContact* particleContact) {
            if(onBeginParticleContact != NULL)
                onBeginParticleContact(particleSystem, particleContact);
        }

        // @inheritDoc
        void EndContact(b2ParticleSystem* particleSystem, int32 indexA, int32 indexB) {
            if(onEndParticleContact != NULL)
                onEndParticleContact(particleSystem, indexA, indexB);
        }

        // @inheritDoc
        void PreSolve(b2Contact* contact, const b2Manifold* oldManifold) {
            if(onPreSolve != NULL)
                onPreSolve(contact, oldManifold);
        }

        // @inheritDoc
        void PostSolve(b2Contact* contact, const b2ContactImpulse* impulse) {
            if(onPostSolve != NULL)
                onPostSolve(contact, impulse);
        }

    };
%}


%inline %{
    // Extended class definition
    class b2DestructionListenerImpl : public b2DestructionListener
    {
        private:
        public:
            void (*onJointDestroyed)(b2Joint*);
            void (*onFixtureDestroyed)(b2Fixture*);
            void (*onParticleGroupDestroyed)(b2ParticleGroup*);
            void (*onParticleSystemDestroyed)(b2ParticleSystem*, int32);

        b2DestructionListenerImpl() {
            AS3_Trace("DestructionListenerImpl::Created");
        }

        ~b2DestructionListenerImpl() {
            AS3_Trace("DestructionListenerImpl::Destroyed");
        }

        void SayGoodbye(b2Joint* joint) {
            if(onJointDestroyed != NULL)
                onJointDestroyed(joint);
        }

        void SayGoodbye(b2Fixture* fixture) {
            if(onFixtureDestroyed != NULL)
                onFixtureDestroyed(fixture);
        }

        void SayGoodbye(b2ParticleGroup* group) {
            if(onParticleGroupDestroyed != NULL)
                onParticleGroupDestroyed(group);
        }

        void SayGoodbye(b2ParticleSystem* particleSystem, int32 index) {
            if(onParticleSystemDestroyed != NULL)
                onParticleSystemDestroyed(particleSystem, index);
        }
    };
%}


%inline %{
    // Extended class definition
    class b2ContactFilterImpl : public b2ContactFilter
    {
        private:
        public:
            bool (*onContactFixture)(b2Fixture*, b2Fixture*);
            bool (*onContactParticleSystem)(b2Fixture*, b2ParticleSystem*, int32);
            bool (*onContactParticle)(b2ParticleSystem*, int32, int32);

        b2ContactFilterImpl() {
            AS3_Trace("ContactFilterImpl::Created");
        }

        ~b2ContactFilterImpl() {
            AS3_Trace("ContactFilterImpl::Destroyed");
        }

        // @inheritDoc
        bool ShouldCollide(b2Fixture* fixtureA, b2Fixture* fixtureB) {
            if(onContactFixture != NULL)
                return onContactFixture(fixtureA, fixtureB);
            return true;
        }

        // @inheritDoc
        bool ShouldCollide(b2Fixture* fixture,
                                   b2ParticleSystem* particleSystem,
                                   int32 particleIndex) {
            if(onContactParticleSystem != NULL)
                return onContactParticleSystem(fixture, particleSystem, particleIndex);
            return true;
        }

        // @inheritDoc
        bool ShouldCollide(b2ParticleSystem* particleSystem,
                                   int32 particleIndexA, int32 particleIndexB) {
            if(onContactParticle != NULL)
                return onContactParticle(particleSystem, particleIndexA, particleIndexB);
            return true;
        }

    };
%}


%inline %{
    // Extended class definition
    class b2QueryCallbackImpl : public b2QueryCallback
    {
        private:
        public:
            bool (*onQueryFixture)(b2Fixture*);
            bool (*onQueryParticle)(const b2ParticleSystem*, int32);
            bool (*onQueryParticleSystem)(const b2ParticleSystem*);

        b2QueryCallbackImpl() {
            AS3_Trace("QueryCallbackImpl::Created");
        }

        ~b2QueryCallbackImpl() {
            AS3_Trace("QueryCallbackImpl::Destroyed");
        }

        // @inheritDoc
        bool ReportFixture(b2Fixture* fixture){
            if(onQueryFixture != NULL)
                return onQueryFixture(fixture);
            return true;
        }

        // @inheritDoc
        bool ReportParticle(const b2ParticleSystem* particleSystem, int32 index) {
            if(onQueryParticle != NULL)
                return onQueryParticle(particleSystem, index);
            return false;
        }

        // @inheritDoc
        bool ShouldQueryParticleSystem(const b2ParticleSystem* particleSystem) {
            if(onQueryParticleSystem != NULL)
                return onQueryParticleSystem(particleSystem);
            return true;
        }

    };
%}


%inline %{
    // Extended class definition
    class b2RayCastCallbackImpl : public b2RayCastCallback
    {
        private:
        public:
            float32 (*onRayCastFixture)(b2Fixture*, const b2Vec2&, const b2Vec2&, float32);
            float32 (*onRayCastParticle)(const b2ParticleSystem*, int32, const b2Vec2&, const b2Vec2&, float32);
            float32 (*onRayCastParticleSystem)(const b2ParticleSystem*);

        b2RayCastCallbackImpl() {
            AS3_Trace("RayCastCallbackImpl::Created");
        }

        ~b2RayCastCallbackImpl() {
            AS3_Trace("RayCastCallbackImpl::Destroyed");
        }

        // @inheritDoc
        float32 ReportFixture(	b2Fixture* fixture, const b2Vec2& point,
                                const b2Vec2& normal, float32 fraction) {
            if(onRayCastFixture != NULL)
                return onRayCastFixture(fixture, point, normal, fraction);
            return 0;
        }

        // @inheritDoc
        float32 ReportParticle(const b2ParticleSystem* particleSystem, int32 index, const b2Vec2& point,
                                       const b2Vec2& normal, float32 fraction) {
            if(onRayCastParticle != NULL)
                return onRayCastParticle(particleSystem, index, point, normal, fraction);
            return 0;
        }

        // @inheritDoc
        bool ShouldQueryParticleSystem(const b2ParticleSystem* particleSystem) {
            if(onRayCastParticleSystem != NULL)
                return onRayCastParticleSystem(particleSystem);
            return true;
        }

    };
%}
