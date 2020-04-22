import UIKit

protocol MainPresenter: class {
  var ui: MainUI? { get set }
  
  func didLoad()
}
