import UIKit
import CoreLocation
import SnapKit

protocol MainViewDelegate: class, AutoMockable {
  func didTapButton()
  func mapView(_ mapView: MapView, mapCameraDidChange zoom: Float, coordinate: CLLocationCoordinate2D)
}

private enum ViewLayout {
  static let mapBottomInset = CGFloat(6.0)
  static let horizontalSpacing: CGFloat = 8
}

class MainView: View {
  
  private var mapProvider: MapProvider?
  weak var delegate: MainViewDelegate?
  
  private var routeDrawable: RouteDrawable?
  
  private var mapView: UIView? {
    return mapProvider?.mapView
  }
  
  override func setupView() {
    
  }
  
  override func setupConstraints() {
    
  }
  
  func setupProviders(mapProvider: MapProvider,
                      routeDrawable: RouteDrawable) {
    self.mapProvider = mapProvider
    self.mapProvider?.delegate = self
    self.routeDrawable = routeDrawable
    setupMap()
  }
  
  private func setupMap() {
    guard let mapView = mapView else { return }
    addSubview(mapView)
    sendSubviewToBack(mapView)
    mapView.layoutMargins = UIEdgeInsets(top: 0, left: ViewLayout.horizontalSpacing, bottom: -ViewLayout.mapBottomInset, right: ViewLayout.horizontalSpacing)
    mapView.snp.makeConstraints { make in
      make.edges.equalTo(self)
    }
    addPolyline()
  }
  
  private func addPolyline() {
    let polyLineString = "sdq{Fc}iLj@zR|W~TryCzvC??do@jkKeiDxjIccLhiFqiE`uJqe@rlCy~B`t@sK|i@"
    routeDrawable?.draw(route: polyLineString)
  }
}

extension MainView: MapProviderDelegate {
    
  func mapProvider(_ mapProvider: MapProvider, cameraDidChange zoom: Float, with coordinate: CLLocationCoordinate2D) {
//    delegate?.mapView(self, mapCameraDidChange: zoom, coordinate: coordinate)
  }
  
  func mapProviderDidDeselectAnnotation(_ mapProvider: MapProvider) {
    
  }
  
  func mapProviderDidSelectAnnotation(_ mapProvider: MapProvider) {
    
  }
}
