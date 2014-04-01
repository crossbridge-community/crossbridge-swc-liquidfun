package org.liquidfun.utils {
import org.liquidfun.Draw;

public class LFDebugDraw extends Draw {
    public function LFDebugDraw() {
        super();
    }

    override public function drawPolygon(vertices:int, vertexCount:int, color:int):void {
        trace(this, "drawPolygon");
    }

    override public function drawSolidPolygon(vertices:int, vertexCount:int, color:int):void {
        trace(this, "drawSolidPolygon");
    }

    override public function drawCircle(center:int, radius:Number, color:int):void {
        trace(this, "drawCircle");
    }

    override public function drawSolidCircle(center:int, radius:Number, axis:int, color:int):void {
        trace(this, "drawSolidCircle");
    }
}
}
