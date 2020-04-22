import UIKit

protocol MainInteractorDelegate: class {
  func somethingFetched()
}

class DefaultMainInteractor: MainInteractor{
  
  weak var delegate: MainInteractorDelegate?
  
  func fetchSomething() {
    delegate?.somethingFetched()
  }
}
