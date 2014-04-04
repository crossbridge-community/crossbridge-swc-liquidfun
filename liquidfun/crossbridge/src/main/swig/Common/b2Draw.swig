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

%module b2Draw

//----------------------------------
//  Ignores
//----------------------------------

// duplicates constructor with parameters (r,g,b)
%ignore b2Color::b2Color();

//----------------------------------
//  Renames
//----------------------------------

%rename (BIT_SHAPE) e_shapeBit;
%rename (BIT_JOINT) e_jointBit;
%rename (BIT_AABB) e_aabbBit;
%rename (BIT_PAIR) e_pairBit;
%rename (BIT_CENTER_OF_MASS) e_centerOfMassBit;
%rename (BIT_PARTICLE) e_particleBit;

//----------------------------------
//  Includes
//----------------------------------

%include "../../../Box2D/Box2D/Common/b2Draw.h"

//----------------------------------
//  Inline
//----------------------------------

/*%{
    #include <Flash++.h>
%}*/

%inline %{
    // Extended debug draw class definition
    class b2DebugDraw : public b2Draw
    {
        private:
            AS3::ui::flash::display::Graphics graphics;
            AS3::ui::flash::display::Shape canvas;
        public:
            int scale;
            //AS3::ui::var drawArea;

        b2DebugDraw() {
            AS3_Trace("b2DebugDraw::Created");
            scale = 30;
            AS3::ui::flash::display::Stage stage = AS3::ui::internal::get_Stage();
            canvas = AS3::ui::flash::display::Shape::_new();
            graphics = canvas->graphics;
            stage->addChild(canvas);
            // dev: Client error => Variable $astype is not defined.
            // drawArea = canvas;
        }

        ~b2DebugDraw() {
            AS3_Trace("b2DebugDraw::Destroyed");
        }

        // Draw a closed polygon provided in CCW order.
        void DrawPolygon(const b2Vec2* vertices, int32 vertexCount, const b2Color& color) {
            AS3_Trace("DrawPolygon");
            for (int i = 0; i < vertexCount; ++i, ++vertices)
            {
                //vertices->x
                //vertices->y
            }

        }

        // Draw a solid closed polygon provided in CCW order.
        void DrawSolidPolygon(const b2Vec2* vertices, int32 vertexCount, const b2Color& color) {
            AS3_Trace("DrawSolidPolygon");
            for (int i = 0; i < vertexCount; ++i, ++vertices)
            {
                //vertices->x
                //vertices->y
            }
        }

        // Draw a circle.
        void DrawCircle(const b2Vec2& center, float32 radius, const b2Color& color) {
            AS3_Trace("DrawCircle");
            //graphics.drawCircle(center.x, center.y, radius);
        }

        // Draw a solid circle.
        void DrawSolidCircle(const b2Vec2& center, float32 radius, const b2Vec2& axis, const b2Color& color) {
            AS3_Trace("DrawSolidCircle");
            //graphics.drawCircle(center.x, center.y, radius);
        }

        // Draw a particle array
        void DrawParticles(const b2Vec2 *centers, float32 radius, const b2ParticleColor *colors, int32 count) {
            AS3_Trace("DrawParticles");
        }

        // Draw a line segment.
        void DrawSegment(const b2Vec2& p1, const b2Vec2& p2, const b2Color& color) {
            AS3_Trace("DrawSegment");
            //graphics.moveTo(p1.x, p1.y);
            //graphics.lineTo(p2.x, p2.y);
        }

        // Draw a transform. Choose your own length scale.
        // @param xf a transform.
        void DrawTransform(const b2Transform& xf) {
            AS3_Trace("DrawTransform");
        }

    };
%}