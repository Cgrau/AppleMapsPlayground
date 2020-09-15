import MapKit

//final class MapKitOverlayDrawable: OverlayDrawable {
//  
//  private var currentArea: MKPolygon?
//  private weak var mapProvider: MapProvider?
//  
//  private var mapView: MKMapView? {
//    return mapProvider?.mapView as? MKMapView
//  }
//
//  init(mapProvider: MapProvider) {
//    self.mapProvider = mapProvider
//  }
//  
//  func drawArea(with coordinates: [CLLocationCoordinate2D]) {
//    removeArea()
//    let area = MKPolygon(coordinates: coordinates, count: coordinates.count)
//    currentArea = area
//    mapView?.addOverlay(area)
//  }
//  
//  func removeArea() {
//    if let currentArea = currentArea {
//      mapView?.removeOverlay(currentArea)
//    }
//  }
//}
