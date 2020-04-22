import CoreLocation

protocol MapProviderDelegate: class {
  func mapProvider(_ mapProvider: MapProvider, cameraDidChange zoom: Float, with coordinate: CLLocationCoordinate2D)
  func mapProviderDidSelectAnnotation(_ mapProvider: MapProvider)
  func mapProviderDidDeselectAnnotation(_ mapProvider: MapProvider)
}
