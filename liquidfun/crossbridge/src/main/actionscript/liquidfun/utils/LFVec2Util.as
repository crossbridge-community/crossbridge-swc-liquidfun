/*
 * =BEGIN CLOSED LICENSE
 *
 * Copyright (c) 2013 Andras Csizmadia
 * http://www.vpmedia.eu
 *
 * For information about the licensing and copyright please
 * contact Andras Csizmadia at andras@vpmedia.eu
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * =END CLOSED LICENSE
 */
package liquidfun.utils {
public class LFVec2Util {
    public function LFVec2Util() {
        throw new Error("Static helper class");
    }

    [Inline]
    public static function setZero(v:Vec2):void {
        v.set(0, 0);
    }

    [Inline]
    public static function setXY(v:Vec2, x:Number = 0, y:Number = 0):void {
        v.set(x, y);
    }

    [Inline]
    public static function setV(v:Vec2, b:Vec2):void {
        v.set(b.x, b.y);
    }

    [Inline]
    public static function negative(v:Vec2):void {
        v.set(-v.x, -v.y);
    }

    [Inline]
    public static function create(x:Number, y:Number, r:Number = 0):Vec2 {
        const result:Vec2 = Vec2.create();
        if (!r)
            result.set(x, y);
        else {
            var cos:Number = Math.cos(r);
            var sin:Number = Math.sin(r);
            result.set(x * cos - y * sin, x * sin + y * cos);
        }
        return result;
    }

    [Inline]
    public static function clone(v:Vec2):Vec2 {
        if (v == null)
            return Vec2.create();
        return create(v.x, v.y);
    }

    [Inline]
    public static function add(v:Vec2, b:Vec2):void {
        v.set(v.x + b.x, v.y + b.y);
    }

    [Inline]
    public static function subtract(v:Vec2, b:Vec2):void {
        v.set(v.x - b.x, v.y - b.y);
    }

    [Inline]
    public static function multiply(v:Vec2, a:Number):void {
        v.set(v.x * a, v.y * a);
    }

    /*public static function MulM(A:b2Mat22) : void
     {
     var tX:Number = x;
     x = A.col1.x * tX + A.col2.x * y;
     y = A.col1.y * tX + A.col2.y * y;
     }*/

    /* public static function MulTM(A:b2Mat22) : void
     {
     var tX:Number = b2Math.Dot(this, A.col1);
     y = b2Math.Dot(this, A.col2);
     x = tX;
     }*/

    [Inline]
    public static function crossVF(v:Vec2, s:Number):void {
        const tX:Number = v.x;
        v.set(s * v.y, -s * tX);
    }

    [Inline]
    public static function crossFV(v:Vec2, s:Number):void {
        const tX:Number = v.x;
        v.set(-s * v.y, s * tX);
    }

    [Inline]
    public static function minV(v:Vec2, b:Vec2):void {
        v.set(v.x < b.x ? v.x : b.x, v.y < b.y ? v.y : b.y);
    }

    [Inline]
    public static function maxV(v:Vec2, b:Vec2):void {
        v.x = v.x > b.x ? v.x : b.x;
        v.y = v.y > b.y ? v.y : b.y;
    }

    [Inline]
    public static function abs(v:Vec2):void {
        if (v.x < 0) v.x = -v.x;
        if (v.y < 0) v.y = -v.y;
    }

    [Inline]
    public static function getDistance(v:Vec2, b:Vec2):Number {
        const xd:Number = v.x - b.x;
        const yd:Number = v.y - b.y;
        return Math.sqrt(xd * xd + yd * yd);
    }

    [Inline]
    public static function getLength(v:Vec2):Number {
        return Math.sqrt(v.x * v.x + v.y * v.y);
    }

    [Inline]
    public static function getLengthSquared(v:Vec2):Number {
        return (v.x * v.x + v.y * v.y);
    }

    [Inline]
    public static function normalize(v:Vec2):void {
        const length:Number = Math.sqrt(v.x * v.x + v.y * v.y);
        if (length < Number.MIN_VALUE) {
            return;
        }
        const invLength:Number = 1.0 / length;
        v.set(v.x * invLength, v.y * invLength);
    }


    [Inline]
    public static function perpDot(a:Vec2, b:Vec2):Number {
        return -a.y * b.x + a.x * b.y;
    }

    [Inline]
    public static function rotate(v:Vec2, r:Number):void {
        const cos:Number = Math.cos(r);
        const sin:Number = Math.sin(r);
        v.set(v.x * cos - v.y * sin, v.x * sin + v.y * cos);
    }

    [Inline]
    public static function winding(a:Vec2, b:Vec2, c:Vec2):Number {
        var bb:Vec2 = clone(b);
        var cc:Vec2 = clone(c);
        subtract(bb, a);
        subtract(cc, b);
        return perpDot(bb, cc); // < 0 = right > 0 = left
    }

    /// Check the orientation of vertices. If they are in the wrong direction, flip them. Returns true if the vertecies need to be flipped.
    public static function checkVertexDirection(v:Vector.<Vec2>):Boolean {
        if (v.length > 2) {
            var wind:Number = 0;
            var i:int = 0;
            while (wind == 0 && i < (v.length - 2)) {
                wind = winding(v[i], v[i + 1], v[i + 2]);
                ++i;
            }
            if (wind < 0) {
                return false;
            }
        }
        return true;
    }

    /// If the vertices are in the wrong direction, flips them. Returns true if they were ok to start with, false if they were flipped.
    public static function ensureCorrectVertexDirection(v:Vector.<Vec2>):Boolean {
        if (!checkVertexDirection(v)) {
            reverseVertices(v);
            return false;
        }
        return true;
    }

    /// Reverses the direction of a vector.
    [Inline]
    public static function reverseVertices(v:Vector.<Vec2>):void {
        var low:uint = 0;
        var high:uint = v.length - 1;
        var tmp:Number;
        while (high > low) {
            tmp = v[low].x;
            v[low].x = v[high].x;
            v[high].x = tmp;
            tmp = v[low].y;
            v[low].y = v[high].y;
            v[high].y = tmp;
            ++low;
            --high;
        }
    }


}
}
