//
//  NavigationHandler.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 29/05/22.
//

import Foundation
import UIKit

class NavigationHandler {
    static func getRootNavigation() -> UINavigationController? {
        let appDelegate = UIApplication.shared.delegate
        if let window = appDelegate?.window {
            let rootNavigation = window?.rootViewController
            return rootNavigation as? UINavigationController
        }
        return nil
    }
    
    static func getNavigation() -> UINavigationController? {
        let appDelegate = UIApplication.shared.delegate
        if let window = appDelegate?.window {
            if let rootNavigation = window?.rootViewController as? UINavigationController {
                if rootNavigation.viewControllers.count > 0 {
                    let rootController = rootNavigation.viewControllers[0] as? RootViewController
                    return rootController?.navController
                }
            }
        }
        return nil
    }
    
    static func setRootVc() {
        if let navigation = getRootNavigation() {
            navigation.popToRootViewController(animated: true)
        }
    }
    
    static func setRootHome() {
        if let navigation = getNavigation() {
            navigation.popToRootViewController(animated: false)
        }
    }
    
    static func pushFromRoot(controller: UIViewController?) {
        if let rootNavigation = getRootNavigation(), let controller = controller {
            rootNavigation.pushViewController(controller, animated: true)
        }
    }
    
    static func pushFromSelf(controller: UIViewController?) {
        if let navigation = getNavigation(), let controller = controller {
            navigation.pushViewController(controller, animated: false)
        }
    }
    
    static func popFromRoot(animated: Bool) {
        if let rootNavigation = getRootNavigation() {
            rootNavigation.popViewController(animated: animated)
        }
    }
    
    static func popFromSelf(animated: Bool) {
        if let navigation = getNavigation() {
            navigation.popViewController(animated: animated)
        }
    }
}
