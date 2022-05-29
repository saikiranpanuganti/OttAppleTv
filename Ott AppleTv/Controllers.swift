//
//  Controllers.swift
//  Netflix
//
//  Created by SaiKiran Panuganti on 23/02/22.
//

import Foundation
import UIKit

enum Controllers {
    case splash
    case root
    case testHome
    case testing
    
    func getController() -> UIViewController {
        switch self {
        case .splash:
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SplashViewController")
        case .root:
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RootViewController")
        case .testHome:
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TestHomeViewController")
        case .testing:
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TestingViewController")
        }
    }
}
