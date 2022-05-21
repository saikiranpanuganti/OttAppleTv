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
    @IBOutlet weak var menuView: MenuView!
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var menuViewWidth: NSLayoutConstraint!
    @IBOutlet weak var homeLeading: NSLayoutConstraint!
    
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        return [homeView]
    }
    
    var menuState: MenuState = .collapsed
    
    var homeController: HomeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
    var navController: UINavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuViewWidth.constant = SideMenuWidthMin
        homeLeading.constant = 0
        addChildVc()
    }
    
    func addChildVc() {
        addHomeController()
    }

    func addHomeController() {
        let homeController: HomeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let child = UINavigationController(rootViewController: homeController)
        navController = child
        child.view.translatesAutoresizingMaskIntoConstraints = false
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
        self.menuViewWidth.constant = SideMenuWidthMax
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            self.view.layoutIfNeeded()
        } completion: { expanded in
            self.menuState = .expanded
        }
    }
    
    func collapseSideMenu() {
        self.menuViewWidth.constant = SideMenuWidthMin
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
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