import UIKit

protocol MainInteractor: class{
  var delegate: MainInteractorDelegate? { get set }
  
  func fetchSomething()
}
