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
  
  func draw(route: Route)  {
    guard let mkRoute = route.value as? MKRoute else { return }
    removeRoute()
    let polyline = RoutePolyLine(coordinates: mkRoute.polyline.coordinates, count: mkRoute.polyline.pointCount)
    polyline.transportType = mkRoute.transportType
    self.currentRoute = polyline
    self.mapView?.addOverlay(polyline, level: .aboveLabels)
  }
  
  func removeRoute() {
    if let currentRoute = currentRoute {
      mapView?.removeOverlay(currentRoute)
    }
  }
}

final class RoutePolyLine: MKPolyline {
  var transportType: MKDirectionsTransportType = .walking
}
