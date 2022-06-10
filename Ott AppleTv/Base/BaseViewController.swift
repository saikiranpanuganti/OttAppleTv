//
//  BaseViewController.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 29/05/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var menuPressRecognizer:UITapGestureRecognizer?
    private var menuTapTimer:Timer?
    private var numberOfTaps = 0
    
    var overrideMenuTap:Bool = false {
        didSet{
            if overrideMenuTap {
                addMenuPressRecogniser()
            }else{
                guard let menuPressRecognizer = self.menuPressRecognizer else { return }
                self.view.removeGestureRecognizer(menuPressRecognizer)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func addMenuPressRecogniser() {
        if let menuPressRecognizerAvail = self.menuPressRecognizer {
            self.view.removeGestureRecognizer(menuPressRecognizerAvail)
        }
        
        let menuPressRecognizer = UITapGestureRecognizer()
        menuPressRecognizer.addTarget(self, action: #selector(menuTapRecognised(_:)))
        menuPressRecognizer.allowedPressTypes = [NSNumber(value: UIPress.PressType.menu.rawValue)]

        self.view.addGestureRecognizer(menuPressRecognizer)
        self.menuPressRecognizer = menuPressRecognizer
    }
    
    @objc private func menuTapRecognised(_ tapGesture: UITapGestureRecognizer) {
        menuTapped()
    }
    
    @objc func menuTapped(){}
}
