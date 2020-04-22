// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
@testable import AppleMapsPlayground
import CoreLocation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














class MainViewDelegateMock: NSObject, MainViewDelegate {

    //MARK: - didTapButton

    private(set) var didTapButtonCallsCount = 0
    var didTapButtonCalled: Bool {
        return didTapButtonCallsCount > 0
    }
    var didTapButtonClosure: (() -> Void)?

    func didTapButton() {
        didTapButtonCallsCount += 1
        didTapButtonClosure?()
    }

    //MARK: - mapView

    private(set) var mapViewMapCameraDidChangeCoordinateCallsCount = 0
    var mapViewMapCameraDidChangeCoordinateCalled: Bool {
        return mapViewMapCameraDidChangeCoordinateCallsCount > 0
    }
    private(set) var mapViewMapCameraDidChangeCoordinateReceivedArguments: (mapView: MapView, zoom: Float, coordinate: CLLocationCoordinate2D)?
    private(set) var mapViewMapCameraDidChangeCoordinateReceivedInvocations: [(mapView: MapView, zoom: Float, coordinate: CLLocationCoordinate2D)] = []
    var mapViewMapCameraDidChangeCoordinateClosure: ((MapView, Float, CLLocationCoordinate2D) -> Void)?

    func mapView(_ mapView: MapView, mapCameraDidChange zoom: Float, coordinate: CLLocationCoordinate2D) {
        mapViewMapCameraDidChangeCoordinateCallsCount += 1
        mapViewMapCameraDidChangeCoordinateReceivedArguments = (mapView: mapView, zoom: zoom, coordinate: coordinate)
        mapViewMapCameraDidChangeCoordinateReceivedInvocations.append((mapView: mapView, zoom: zoom, coordinate: coordinate))
        mapViewMapCameraDidChangeCoordinateClosure?(mapView, zoom, coordinate)
    }

}
class MapViewMock: NSObject, MapView {

    //MARK: - setupProviders

    private(set) var setupProvidersMapProviderRouteDrawableProviderOverlayDrawableCallsCount = 0
    var setupProvidersMapProviderRouteDrawableProviderOverlayDrawableCalled: Bool {
        return setupProvidersMapProviderRouteDrawableProviderOverlayDrawableCallsCount > 0
    }
    private(set) var setupProvidersMapProviderRouteDrawableProviderOverlayDrawableReceivedArguments: (mapProvider: MapProvider, routeDrawableProvider: RouteDrawable, overlayDrawable: OverlayDrawable)?
    private(set) var setupProvidersMapProviderRouteDrawableProviderOverlayDrawableReceivedInvocations: [(mapProvider: MapProvider, routeDrawableProvider: RouteDrawable, overlayDrawable: OverlayDrawable)] = []
    var setupProvidersMapProviderRouteDrawableProviderOverlayDrawableClosure: ((MapProvider, RouteDrawable, OverlayDrawable) -> Void)?

    func setupProviders(mapProvider: MapProvider,                      routeDrawableProvider: RouteDrawable,                      overlayDrawable: OverlayDrawable) {
        setupProvidersMapProviderRouteDrawableProviderOverlayDrawableCallsCount += 1
        setupProvidersMapProviderRouteDrawableProviderOverlayDrawableReceivedArguments = (mapProvider: mapProvider, routeDrawableProvider: routeDrawableProvider, overlayDrawable: overlayDrawable)
        setupProvidersMapProviderRouteDrawableProviderOverlayDrawableReceivedInvocations.append((mapProvider: mapProvider, routeDrawableProvider: routeDrawableProvider, overlayDrawable: overlayDrawable))
        setupProvidersMapProviderRouteDrawableProviderOverlayDrawableClosure?(mapProvider, routeDrawableProvider, overlayDrawable)
    }

    //MARK: - change

    private(set) var changeZoomCallsCount = 0
    var changeZoomCalled: Bool {
        return changeZoomCallsCount > 0
    }
    private(set) var changeZoomReceivedZoom: Float?
    private(set) var changeZoomReceivedInvocations: [Float] = []
    var changeZoomClosure: ((Float) -> Void)?

    func change(zoom: Float) {
        changeZoomCallsCount += 1
        changeZoomReceivedZoom = zoom
        changeZoomReceivedInvocations.append(zoom)
        changeZoomClosure?(zoom)
    }

    //MARK: - centerMap

    private(set) var centerMapInWithOffSetCallsCount = 0
    var centerMapInWithOffSetCalled: Bool {
        return centerMapInWithOffSetCallsCount > 0
    }
    private(set) var centerMapInWithOffSetReceivedArguments: (coordinate: CLLocationCoordinate2D, zoom: Float?, offSet: Double?)?
    private(set) var centerMapInWithOffSetReceivedInvocations: [(coordinate: CLLocationCoordinate2D, zoom: Float?, offSet: Double?)] = []
    var centerMapInWithOffSetClosure: ((CLLocationCoordinate2D, Float?, Double?) -> Void)?

    func centerMap(in coordinate: CLLocationCoordinate2D, with zoom: Float?, offSet: Double?) {
        centerMapInWithOffSetCallsCount += 1
        centerMapInWithOffSetReceivedArguments = (coordinate: coordinate, zoom: zoom, offSet: offSet)
        centerMapInWithOffSetReceivedInvocations.append((coordinate: coordinate, zoom: zoom, offSet: offSet))
        centerMapInWithOffSetClosure?(coordinate, zoom, offSet)
    }

    //MARK: - draw

    private(set) var drawRouteCallsCount = 0
    var drawRouteCalled: Bool {
        return drawRouteCallsCount > 0
    }
    private(set) var drawRouteReceivedRoute: Route?
    private(set) var drawRouteReceivedInvocations: [Route] = []
    var drawRouteClosure: ((Route) -> Void)?

    func draw(route: Route) {
        drawRouteCallsCount += 1
        drawRouteReceivedRoute = route
        drawRouteReceivedInvocations.append(route)
        drawRouteClosure?(route)
    }

    //MARK: - removeRoute

    private(set) var removeRouteCallsCount = 0
    var removeRouteCalled: Bool {
        return removeRouteCallsCount > 0
    }
    var removeRouteClosure: (() -> Void)?

    func removeRoute() {
        removeRouteCallsCount += 1
        removeRouteClosure?()
    }

}
