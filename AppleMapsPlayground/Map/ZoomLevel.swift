enum ZoomLevel: Float {
  case location = 16.0
  case userLocation = 14.0
  case cluster = 12.0
  case city = 5.0
  case none = 1
  
  static func level(with zoom: Float) -> ZoomLevel {
    switch zoom {
    case ..<1.1:
      return .none
    case 1.1...6.0:
      return .city
    case 6.0...13.0:
      return .cluster
    case 13.0...16.0:
      return .userLocation
    default:
      return .location
    }
  }
}

protocol Zoom: class {
  var currentZoom: ZoomLevel { get set }
}

final class DefaultZoom: Zoom {
  var currentZoom: ZoomLevel = .none
}
