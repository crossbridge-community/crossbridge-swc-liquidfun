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

%module b2Body

//----------------------------------
//  Ignores
//----------------------------------

%ignore b2Body::GetBody();
%ignore b2Body::GetContactList();
%ignore b2Body::GetFixtureList();
%ignore b2Body::GetJointList();
%ignore b2Body::GetNext();
%ignore b2Body::GetWorld();
%ignore b2Body::SetTransform(b2Vec2 const &,float32);
%ignore b2Body::SetLinearVelocity(b2Vec2 const &);

//----------------------------------
//  Renames
//----------------------------------

%rename (STATIC_BODY) b2_staticBody;
%rename (KINEMATIC_BODY) b2_kinematicBody;
%rename (DYNAMIC_BODY) b2_dynamicBody;
//%rename (BULLET_BODY) b2_bulletBody;
%rename(createFixtureWithDensity) CreateFixture(const b2Shape* shape, float32 density);

//----------------------------------
//  Extensions
//----------------------------------

%extend b2BodyDef {
    /* CORE */
    void Identity() {
        $self->userData = NULL;
        $self->position.Set(0.0f, 0.0f);
        $self->angle = 0.0f;
        $self->linearVelocity.Set(0.0f, 0.0f);
        $self->angularVelocity = 0.0f;
        $self->linearDamping = 0.0f;
        $self->angularDamping = 0.0f;
        $self->allowSleep = true;
        $self->awake = true;
        $self->fixedRotation = false;
        $self->bullet = false;
        $self->type = b2_staticBody;
        $self->active = true;
        $self->gravityScale = 1.0f;
    }
    /*POSITION*/
    // Getter X
    float32 GetX() {
        return $self->position.x;
    }
    // Setter X
    void SetX(float32 posX) {
            $self->position.x = posX;
    }
    // Getter Y
    float32 GetY() {
        return $self->position.y;
    }
    // Setter Y
    void SetY(float32 posY) {
            $self->position.y = posY;
    }
    // Setter XY
    void SetXY(float32 posX, float32 posY) {
        $self->position.x = posX;
        $self->position.y = posY;
    }
    /* VELOCITY */
    // Getter X
    float32 GetVX() {
        return $self->linearVelocity.x;
    }
    // Setter X
    void SetVX(float32 posX) {
            $self->linearVelocity.x = posX;
    }
    // Getter Y
    float32 GetVY() {
        return $self->linearVelocity.y;
    }
    // Setter Y
    void SetVY(float32 posY) {
            $self->linearVelocity.y = posY;
    }
    // Setter XY
    void SetVXY(float32 posX, float32 posY) {
        $self->linearVelocity.x = posX;
        $self->linearVelocity.y = posY;
    }
};

%extend b2Body {
    /*TYPE*/
    // Getter Static
    bool isStatic() {
        return $self->GetType() == b2_staticBody;
    }
    // Getter Dynamic
    bool isDynamic() {
        return $self->GetType() == b2_dynamicBody;
    }
    // Getter Kinematic
    bool isKinematic() {
        return $self->GetType() == b2_kinematicBody;
    }
    /* POSITION */
    // Getter X
    float32 GetX() {
        return $self->GetPosition().x;
    }
    // Getter Y
    float32 GetY() {
        return $self->GetPosition().y;
    }
    /* WORLD CENTER */
    // Getter X
    float32 GetWorldCenterX() {
        return $self->GetWorldCenter().x;
    }
    // Getter Y
    float32 GetWorldCenterY() {
        return $self->GetWorldCenter().y;
    }
    /* LOCAL CENTER */
    // Getter X
    float32 GetLocalCenterX() {
        return $self->GetLocalCenter().x;
    }
    // Getter Y
    float32 GetLocalCenterY() {
        return $self->GetLocalCenter().y;
    }
    /* TRANSFORM */
    // Setter
    void SetTransform(float32 posX, float32 posY, float32 angle) {
        $self->SetTransform(b2Vec2(posX, posY), angle);
    }
    // Getter X
    float32 GetTransformX() {
        return $self->GetTransform().p.x;
    }
    // Getter Y
    float32 GetTransformY() {
        return $self->GetTransform().p.y;
    }
    // Getter A
    float32 GetTransformA() {
        return $self->GetTransform().q.GetAngle();
    }
    /* LINEAR VELOCITY */
    // Setter
    void SetLinearVelocity(float32 x, float32 y) {
        $self->SetLinearVelocity(b2Vec2(x, y));
    }
    // Getter X
    float32 GetLinearVelocityX() {
        return $self->GetLinearVelocity().x;
    }
    // Getter Y
    float32 GetLinearVelocityY() {
        return $self->GetLinearVelocity().y;
    }
    /*WORLD POINT*/
    // Getter X
    float32 GetWorldPointX(const b2Vec2& localPoint) {
        return $self->GetWorldPoint(localPoint).x;
    }
    // Getter Y
    float32 GetWorldPointY(const b2Vec2& localPoint) {
        return $self->GetWorldPoint(localPoint).y;
    }
    /*WORLD VECTOR*/
    // Getter X
    float32 GetWorldVectorX(const b2Vec2& localVector) {
        return $self->GetWorldVector(localVector).x;
    }
    // Getter Y
    float32 GetWorldVectorY(const b2Vec2& localVector) {
        return $self->GetWorldVector(localVector).y;
    }
    /*LOCAL POINT*/
    // Getter X
    float32 GetLocalPointX(const b2Vec2& localPoint) {
        return $self->GetLocalPoint(localPoint).x;
    }
    // Getter Y
    float32 GetLocalPointY(const b2Vec2& localPoint) {
        return $self->GetLocalPoint(localPoint).y;
    }
    /*LOCAL VECTOR*/
    // Getter X
    float32 GetLocalVectorX(const b2Vec2& localVector) {
        return $self->GetLocalVector(localVector).x;
    }
    // Getter Y
    float32 GetLocalVectorY(const b2Vec2& localVector) {
        return $self->GetLocalVector(localVector).y;
    }
    /*LinearVelocityFromWorldPoint*/
    // TODO
    /*LinearVelocityFromLocalPoint*/
    // TODO
};

//----------------------------------
//  Includes
//----------------------------------

%include "../../../Box2D/Box2D/Dynamics/b2Body.h"
