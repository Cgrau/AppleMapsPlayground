//MapKitProvider
import MapKit
final class MapKitProvider: NSObject, MapProvider, MKMapViewDelegate {
  
  weak var delegate: MapProviderDelegate?
  
  lazy var mapView: UIView = {
    let view = MKMapView()
    view.showsCompass = false
    view.isRotateEnabled = false
    view.mapType = .mutedStandard
    return view
  }()
  
  var zoomLevel = ZoomLevel.none
  let zoomHelper = MapKitZoomHelper()
  
  override init() {
    super.init()
    
    guard let mapView = mapView as? MKMapView else { fatalError() }
    mapView.delegate = self
    registerAnnotationViews(for: mapView)
    showUserLocation()
  }

  private func showUserLocation() {
    guard let mapView = mapView as? MKMapView else { fatalError() }
    mapView.userLocation.title = ""
    mapView.showsUserLocation = true
  }
}

extension MapKitProvider {
  
  private func registerAnnotationViews(for mapView: MKMapView) {
//    mapView.register(CityAnnotationView.self, forAnnotationViewWithReuseIdentifier: CityAnnotationView.reuseIdentifier)
//    mapView.register(RoundTripAnnotationView.self, forAnnotationViewWithReuseIdentifier: RoundTripAnnotationView.reuseIdentifier)
  }

}

extension MapKitProvider {
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    return touch.view is MKAnnotationView == false
  }
}
