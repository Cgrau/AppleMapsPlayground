import UIKit
import CoreLocation

class MainViewController: UIViewController, MainUI {
  
  var mainView: MainView?
  
  var presenter: MainPresenter?
  
  override func loadView() {
    mainView?.delegate = self
    view = mainView
  }
  
  func showSomething() {
    
  }
}

extension MainViewController: MainViewDelegate {
  
  func didTapButton() {
    //call presenter
  }
  
  func mapView(_ mapView: MapView, mapCameraDidChange zoom: Float, coordinate: CLLocationCoordinate2D) {
    
  }
}
