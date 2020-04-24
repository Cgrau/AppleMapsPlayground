import MapKit

final class MapKitRouteDrawable: RouteDrawable {

  private var currentRoute: MKPolyline?
  private weak var mapProvider: MapProvider?
  
  private var mapView: MKMapView? {
    return mapProvider?.mapView as? MKMapView
  }
  
  init(mapProvider: MapProvider) {
    self.mapProvider = mapProvider
  }
  
  func draw(route polyLineString: String)  {
    removeRoute()
    let polyline = Polyline(encodedPolyline: polyLineString)
    guard let route = polyline.mkPolyline else { return }
    let mkPolyline = MKPolyline(coordinates: route.coordinates, count: route.pointCount)
    self.currentRoute = mkPolyline
    self.mapView?.addOverlay(mkPolyline, level: .aboveLabels)
    self.center(routePolyline: mkPolyline)
  }
  
  func removeRoute() {
    if let currentRoute = currentRoute {
      mapView?.removeOverlay(currentRoute)
    }
  }
  
  private func center(routePolyline: MKPolyline) {
    var regionRect = routePolyline.boundingMapRect
    
    let wPadding = regionRect.size.width * 0.25
    let hPadding = regionRect.size.height * 0.25

    //Add padding to the region
    regionRect.size.width += wPadding
    regionRect.size.height += hPadding

    //Center the region on the line
    regionRect.origin.x -= wPadding / 2
    regionRect.origin.y -= hPadding / 2
    
    self.mapView?.setRegion(MKCoordinateRegion(regionRect), animated: true)
  }
}
