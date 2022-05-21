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
    
    func getController() -> UIViewController {
        switch self {
        case .splash:
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SplashViewController")
        case .root:
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RootViewController")
        }
    }
}
