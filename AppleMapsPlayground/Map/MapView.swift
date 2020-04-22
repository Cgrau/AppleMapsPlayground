import CoreLocation

protocol MapView: class, AutoMockable {
  
  func setupProviders(mapProvider: MapProvider,
                      routeDrawableProvider: RouteDrawable,
                      overlayDrawable: OverlayDrawable)
  func change(zoom: Float)
  func centerMap(in coordinate: CLLocationCoordinate2D, with zoom: Float?, offSet: Double?)
  func draw(route: Route)
  func removeRoute()
}
