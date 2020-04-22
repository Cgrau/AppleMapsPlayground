import UIKit

class DefaultMainPresenter: MainPresenter {
  
  weak var ui: MainUI?
  private let  interactor: MainInteractor
  private let  navigator: MainNavigator
  
  init(interactor: MainInteractor,
       navigator: MainNavigator) {
    self.interactor = interactor
    self.navigator = navigator
  }
  
  func didLoad() {
    interactor.fetchSomething()
  }
}

extension DefaultMainPresenter: MainInteractorDelegate {
  
  func somethingFetched() {
    ui?.showSomething()
  }
}
