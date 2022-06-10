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
    case home
    case details
    case discoverMore
    
    func getController() -> UIViewController {
        switch self {
        case .splash:
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SplashViewController")
        case .root:
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RootViewController")
        case .home:
            return HomeViewController(nibName: "HomeViewController", bundle: nil)
        case .details:
            return DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        case .discoverMore:
            return DiscoverMoreViewController(nibName: "DiscoverMoreViewController", bundle: nil)
        }
    }
}
