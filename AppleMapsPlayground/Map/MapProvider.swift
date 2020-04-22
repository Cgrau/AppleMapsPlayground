import UIKit

protocol MapProvider: class, UIGestureRecognizerDelegate {
  var delegate: MapProviderDelegate? { get set }
  var mapView: UIView { get }
}
