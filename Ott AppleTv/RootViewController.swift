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
    @IBOutlet weak var homeWidth: NSLayoutConstraint!
    
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        return [homeView]
    }
    
    var menuState: MenuState = .collapsed
    
    var homeController: HomeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
    var navController: UINavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.delegate = self
        self.menuViewWidth.constant = SideMenuWidthMin
        homeLeading.constant = 0
        homeWidth.constant = ScreenWidth - SideMenuWidthMin
        addChildVc()
    }
    
    func addChildVc() {
        addHomeController()
    }

    func addHomeController() {
        let homeController: HomeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let child = UINavigationController(rootViewController: homeController)
        child.isNavigationBarHidden = true
        navController = child
        child.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChild(child)
        homeController.delegate = self
        homeController.viewModel.homeModel = AppData.shared.homeData
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
    
    override func shouldUpdateFocus(in context: UIFocusUpdateContext) -> Bool {
        if let _ = context.nextFocusedView as? MenuTableViewCell {
            expandSideMenu()
        }else {
            collapseSideMenu()
        }
        return true
    }
    
    private func updateFocusOfCurrentView() { //These update the focus of the current screen. from here it will go to the preferredFocusEnvironments and try to move focus to the given views
        self.setNeedsFocusUpdate()
        self.updateFocusIfNeeded()
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

extension RootViewController: MenuViewDelegate {
    func hideUnHideMenu(hide: Bool) {
        if hide {
            collapseSideMenu()
        }else {
            expandSideMenu()
        }
        updateFocusOfCurrentView()
    }
}
