import UIKit

protocol MainProvider {
  func getMainViewController() -> UIViewController
}

class DefaultMainProvider : MainProvider {
  func getMainViewController() -> UIViewController {
    let viewController = MainViewController()
    let view = mapContainerView()
    viewController.mainView = view
    let navigator = mainNavigator(from: viewController)
    let interactor = mainInteractor()
    let presenter = mainPresenter(from: viewController,
                                  navigator: navigator,
                                  interactor: interactor)
    
    viewController.presenter = presenter
    return viewController
  }
  
  private var mainView: MainView {
    return MainView()
  }
  
  private func mainPresenter(from: UIViewController,
                             navigator: MainNavigator,
                             interactor: MainInteractor) -> MainPresenter {
    let presenter = DefaultMainPresenter(interactor: interactor, navigator: navigator)
    interactor.delegate = presenter
    presenter.ui = from as? MainViewController
    
    return presenter
  }
  
  private func mainNavigator(from: UIViewController) -> MainNavigator {
    return DefaultMainNavigator(from: from)
  }
  
  private func mainInteractor() -> MainInteractor {
    return DefaultMainInteractor()
  }
  
  private func mapContainerView() -> MainView {
    let containerView = MainView()
    let provider = mapKitMapProvider
    containerView.setupProviders(mapProvider: provider,
                                 routeDrawable: routeDrawableProvider(with: provider))
    return containerView
  }
  
  private var mapKitMapProvider: MapProvider {
    return MapKitProvider()
  }
  
  private func routeDrawableProvider(with mapProvider: MapProvider) -> RouteDrawable {
    return MapKitRouteDrawable(mapProvider: mapProvider)
  }
  
//  private func overlayDrawableProvider(with mapProvider: MapProvider) -> OverlayDrawable {
//    return MapKitOverlayDrawable(mapProvider: mapProvider)
//  }
}
