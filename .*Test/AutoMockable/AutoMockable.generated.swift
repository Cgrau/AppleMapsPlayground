// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
import UserNotifications
@testable import Ubeeqo
import Mobility
import MotionUI
import RxSwift
import CoreLocation
import Translations
import Permissions
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














class MainViewControllerViewDelegateMock: NSObject, MainViewControllerViewDelegate {

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

}
