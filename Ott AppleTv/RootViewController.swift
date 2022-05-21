//
//  RootViewController.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 19/05/22.
//

import UIKit

enum MenuState {
    case collapsed
    case expanded
}

class RootViewController: UIViewController {
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var menuViewWidth: NSLayoutConstraint!
    
    var menuState: MenuState = .collapsed
    
    var homeController: HomeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
//    var menuController: MenuViewController = MenuViewController(nibName: "MenuViewController", bundle: nil)
    var navController: UINavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuViewWidth.constant = 200
        addChildVc()
    }
    
    func addChildVc() {
        addMenuController()
        addHomeController()
    }
    
    func addMenuController() {
        let child = MenuViewController(nibName: "MenuViewController", bundle: nil)
        self.addChild(child)
        child.view.frame = menuView.frame
        menuView.addSubview(child.view)
        
        child.view.topAnchor.constraint(equalTo: menuView.topAnchor).isActive = true
        child.view.bottomAnchor.constraint(equalTo: menuView.bottomAnchor).isActive = true
        child.view.leftAnchor.constraint(equalTo: menuView.leftAnchor).isActive = true
        child.view.rightAnchor.constraint(equalTo: menuView.rightAnchor).isActive = true
        
        child.didMove(toParent: self)
    }

    func addHomeController() {
        let homeController: HomeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let child = UINavigationController(rootViewController: homeController)
        navController = child
        self.addChild(child)
        homeController.delegate = self
        child.view.frame = homeView.frame
        homeView.addSubview(child.view)
        
        child.view.topAnchor.constraint(equalTo: homeView.topAnchor).isActive = true
        child.view.bottomAnchor.constraint(equalTo: homeView.bottomAnchor).isActive = true
        child.view.leftAnchor.constraint(equalTo: homeView.leftAnchor).isActive = true
        child.view.rightAnchor.constraint(equalTo: homeView.rightAnchor).isActive = true
        
        child.didMove(toParent: self)
    }
    
    func expandSideMenu() {
        self.menuViewWidth.constant = 500
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
            self.view.layoutIfNeeded()
        } completion: { expanded in
            self.menuState = .expanded
        }
    }
    
    func collapseSideMenu() {
        self.menuViewWidth.constant = 200
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
            self.view.layoutIfNeeded()
        } completion: { collapsed in
            self.menuState = .collapsed
        }
    }
}

extension RootViewController: HomeViewControllerDelegate {
    func menuTapped() {
        switch menuState {
        case .collapsed:
            expandSideMenu()
        case .expanded:
            collapseSideMenu()
        }
    }
}
