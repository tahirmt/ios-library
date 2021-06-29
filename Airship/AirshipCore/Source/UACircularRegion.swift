/* Copyright Airship and Contributors */


/**
 * A  circular region defines a radius, and latitude and longitude from its center.
 */
@objc
public class UACircularRegion : NSObject {

    let radius : Double
    let latitude: Double
    let longitude: Double

    /**
     * Default constructor.
     *
     * @param radius The radius of the circular region in meters.
     * @param latitude The latitude of the circular region's center point in degress.
     * @param longitude The longitude of the circular region's center point in degrees.
     *
     * @return Circular region object or `nil` if error occurs
     */
    @objc
    public init?(radius: Double, latitude: Double, longitude: Double) {
        guard UACircularRegion.isValid(radius: radius) else {
            return nil
        }

        guard UAEventUtils.isValid(latitude: latitude) else {
            return nil
        }

        guard UAEventUtils.isValid(longitude: longitude) else {
            return nil
        }

        self.radius = radius
        self.latitude = latitude
        self.longitude = longitude
        super.init()
    }

    /**
     * Factory method for creating a circular region.
     *
     * @param radius The radius of the circular region in meters.
     * @param latitude The latitude of the circular region's center point in degress.
     * @param longitude The longitude of the circular region's center point in degrees.
     *
     * @return Circular region object or `nil` if error occurs
     */
    @objc(circularRegionWithRadius:latitude:longitude:)
    public class func circularRegion(radius: Double, latitude: Double, longitude: Double) -> UACircularRegion? {
        return UACircularRegion(radius: radius, latitude: latitude, longitude: longitude)
    }

    class func isValid(radius: Double) -> Bool {
        guard radius >= 0.1 && radius <= 100000 else {
            AirshipLogger.error("Invalid radius \(radius). Must be between .1 and 100000")
            return false
        }
        return true
    }
}
