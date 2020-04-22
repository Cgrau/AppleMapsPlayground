//http://troybrant.net/blog/2010/01/set-the-zoom-level-of-an-mkmapview/
import MapKit

final class MapKitZoomHelper {
  
  private let mercatorOffset: Double = 268435456
  private let mercatorRadius: Double = 85445659.44705395
  
  func getZoom(from mapView: MKMapView, mapWidthInPixels: CGSize) -> Float {
    let lonDelta = mapView.region.span.longitudeDelta
    let zoomScale = lonDelta * mercatorRadius * .pi / Double((180.0 * mapWidthInPixels.width))
    let zoomer = 20 - log2(zoomScale)
    return zoomer < 0 ? 0 : Float(zoomer)
  }
  
  func coordinateSpan(mapSizeInPixels: CGSize, from coordinates: CLLocationCoordinate2D, zoom: Double) -> MKCoordinateSpan {
    // convert center coordiate to pixel space
    let centerPixelX = longitudeToPixelSpaceX(longitude: coordinates.longitude)
    let centerPixelY = latitudeToPixelSpaceY(latitude: coordinates.latitude)
    
    // determine the scale value from the zoom level
    let zoomExponent = 20 - zoom
    let zoomScale: Double = pow(2, zoomExponent)
    
    // scale the map’s size in pixel space
    let scaledMapWidth = Double(mapSizeInPixels.width) * zoomScale
    let scaledMapHeight = Double(mapSizeInPixels.height) * zoomScale
    
    // figure out the position of the top-left pixel
    let topLeftPixelX = centerPixelX - (scaledMapWidth / 2)
    let topLeftPixelY = centerPixelY - (scaledMapHeight / 2)
    
    // find delta between left and right longitudes
    let minLng = pixelSpaceXToLongitude(pixelX: topLeftPixelX)
    let maxLng = pixelSpaceXToLongitude(pixelX: topLeftPixelX + scaledMapWidth)
    let longitudeDelta = maxLng - minLng
    
    // find delta between top and bottom latitudes
    let minLat = pixelSpaceYToLatitude(pixelY: topLeftPixelY)
    let maxLat = pixelSpaceYToLatitude(pixelY: topLeftPixelY + scaledMapHeight)
    let latitudeDelta = -1 * (maxLat - minLat)
    
    // create and return the lat/lng span
    let span = MKCoordinateSpan(latitudeDelta: latitudeDelta,
                                longitudeDelta: longitudeDelta)
    return span
  }
  
  private func longitudeToPixelSpaceX(longitude: Double) -> Double {
    return round(mercatorOffset + mercatorRadius * longitude * .pi / 180.0)
  }
  
  private func latitudeToPixelSpaceY(latitude: Double) -> Double {
    let multiplier = logf((1 + sinf(Float(latitude * .pi / 180.0))) / (1 - sinf(Float(latitude * .pi / 180.0))))
    return round(mercatorOffset - mercatorRadius * Double(multiplier) / 2.0)
  }
  
  private func pixelSpaceXToLongitude(pixelX: Double) -> Double {
    return ((round(pixelX) - mercatorOffset) / mercatorRadius) * 180.0 / .pi
  }
  
  private func pixelSpaceYToLatitude(pixelY: Double) -> Double {
    return (.pi / 2.0 - 2.0 * atan(exp((round(pixelY) - mercatorOffset) / mercatorRadius))) * 180.0 / .pi
  }
}
