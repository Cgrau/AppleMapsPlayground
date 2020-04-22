import MapKit

protocol RouteDrawable: class {
  func draw(route: Route)
  func removeRoute()
}

struct Route {
  let value: MKRoute?
}
