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

%module b2Fixture

//----------------------------------
//  Ignores
//----------------------------------

%ignore b2FixtureProxy;
%ignore b2Fixture::GetBody();
%ignore b2Fixture::GetNext();
%ignore b2Fixture::GetShape();

//----------------------------------
//  Extensions
//----------------------------------

%extend b2FixtureDef {
    /*CORE*/
    void Identity() {
        $self->shape = NULL;
        $self->userData = NULL;
        $self->friction = 0.2f;
        $self->restitution = 0.0f;
        $self->density = 0.0f;
        $self->isSensor = false;
    }
    /*FILTER*/
    // Setter for all sub-properties
    void SetFilterBits(uint16 categoryBits, uint16 maskBits, int16 groupIndex) {
        $self->filter.categoryBits = categoryBits;
        $self->filter.maskBits = maskBits;
        $self->filter.groupIndex = groupIndex;
    }
    // Setter for Category
    void SetFilterCategoryBits(uint16 categoryBits) {
        $self->filter.categoryBits = categoryBits;
    }
    // Setter for Mask
    void SetFilterMaskBits(uint16 maskBits) {
        $self->filter.maskBits = maskBits;
    }
    // Setter for Group Index
    void SetFilterGroupBits(int16 groupIndex) {
        $self->filter.groupIndex = groupIndex;
    }
}

%extend b2Fixture {
    uint16 GetFilterCategoryBits() {
        return $self->GetFilterData().categoryBits;
    }
    uint16 GetFilterMaskBits() {
        return $self->GetFilterData().maskBits;
    }
    int16 GetFilterGroupIndex() {
        return $self->GetFilterData().groupIndex;
    }
};

//----------------------------------
//  Includes
//----------------------------------

%include "../../../Box2D/Box2D/Dynamics/b2Fixture.h"
