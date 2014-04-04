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
//  Extensions
//----------------------------------

%extend b2Color {
    unsigned long getRGB() {
        return ((int($self->r * 255) & 0xFF) << 16)
        + ((int($self->g * 255) & 0xFF) << 8)
        + (int($self->b * 255) & 0xFF);
    }
}

//----------------------------------
//  Includes
//----------------------------------

%include "../../../Box2D/Box2D/Common/b2Draw.h"

//----------------------------------
//  Inline
//----------------------------------

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

        // Clear canvas between steps
        void Step() {
            graphics->clear();
        }

        // Draw a closed polygon provided in CCW order.
        void DrawPolygon(const b2Vec2* vertices, int32 vertexCount, const b2Color& color) {
            graphics->lineStyle(1, getRGB(color), 1);
            graphics->moveTo(vertices[0].x * scale, vertices[0].y * scale);
            for (int i = 1; i < vertexCount; ++i)
            {
                graphics->lineTo(vertices[i].x * scale, vertices[i].y * scale);
            }
            graphics->lineTo(vertices[0].x * scale, vertices[0].y * scale);
        }

        // Draw a solid closed polygon provided in CCW order.
        void DrawSolidPolygon(const b2Vec2* vertices, int32 vertexCount, const b2Color& color) {
            graphics->lineStyle(1, getRGB(color), 1);
            graphics->moveTo(vertices[0].x * scale, vertices[0].y * scale);
            graphics->beginFill(getRGB(color), 1);
            for (int i = 1; i < vertexCount; ++i)
            {
                graphics->lineTo(vertices[i].x * scale, vertices[i].y * scale);
            }
            graphics->lineTo(vertices[0].x * scale, vertices[0].y * scale);
		    graphics->endFill();
        }

        // Draw a circle.
        void DrawCircle(const b2Vec2& center, float32 radius, const b2Color& color) {
            graphics->lineStyle(1, getRGB(color), 1);
            graphics->drawCircle(center.x * scale, center.y * scale, radius * scale);
        }

        // Draw a solid circle.
        void DrawSolidCircle(const b2Vec2& center, float32 radius, const b2Vec2& axis, const b2Color& color) {
            graphics->lineStyle(1, getRGB(color), 1);
            graphics->moveTo(0,0);
            graphics->beginFill(getRGB(color), 1);
            graphics->drawCircle(center.x * scale, center.y * scale, radius * scale);
            graphics->endFill();
            graphics->moveTo(center.x * scale, center.y * scale);
            graphics->lineTo((center.x + axis.x * radius) * scale, (center.y + axis.y * radius) * scale);
        }

        // Draw a particle array
        void DrawParticles(const b2Vec2 *centers, float32 radius, const b2ParticleColor *colors, int32 count) {
            for (int i = 1; i < count; ++i)
            {
                graphics->lineStyle(1, getRGBA(colors[i]), 1);
                graphics->moveTo(0,0);
                graphics->beginFill(getRGBA(colors[i]), 1);
                graphics->drawCircle(centers[i].x * scale, centers[i].y * scale, radius * scale);
                graphics->endFill();
            }
        }

        // Draw a line segment.
        void DrawSegment(const b2Vec2& p1, const b2Vec2& p2, const b2Color& color) {
            graphics->lineStyle(1, getRGB(color), 1);
            graphics->moveTo(p1.x * scale, p1.y * scale);
            graphics->lineTo(p2.x * scale, p2.y * scale);
        }

        // Draw a transform. Choose your own length scale.
        // @param xf a transform.
        void DrawTransform(const b2Transform& xf) {
            //TODO
        }

        // b2Color RGB helper method
        unsigned int getRGB(const b2Color& color) {
            return ((int(color.r * 255) & 0xFF) << 16)
            + ((int(color.g * 255) & 0xFF) << 8)
            + (int(color.b * 255) & 0xFF);
        }

        // b2ParticleColor RGBA helper method
        unsigned int getRGBA(const b2ParticleColor& color) {
            return ((color.r & 0xFF) << 24)
            + ((color.g & 0xFF) << 16)
            + ((color.b & 0xFF) << 8)
            + (color.a & 0xFF);
        }

    };
%}