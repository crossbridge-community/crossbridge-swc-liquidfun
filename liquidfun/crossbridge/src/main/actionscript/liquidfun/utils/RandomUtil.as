// ======================================================
// The following code is from Grant Skinner's Rndm.as
// ======================================================
//
package liquidfun.utils {
public class RandomUtil {

    //----------------------------------
    //  Private static variables
    //----------------------------------

    private static var _currentSeed:uint = 1234;

    public function RandomUtil() {
    }

    /**
     * @private
     * @return a number between 0-1 exclusive.
     */
    public static function float():Number {
        return (_currentSeed = (_currentSeed * 16807) % 2147483647) / 0x7FFFFFFF + 0.000000000233;
    }
}
}
