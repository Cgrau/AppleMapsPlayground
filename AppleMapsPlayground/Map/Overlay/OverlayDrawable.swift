import CoreLocation

protocol OverlayDrawable: class {
  func drawArea(with coordinates: [CLLocationCoordinate2D])
  func removeArea()
}
