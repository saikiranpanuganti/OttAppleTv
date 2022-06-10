//
//  SplashViewController.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 14/04/22.
//

import UIKit

class SplashViewController: UIViewController {
    var splashView: SplashView!
    var viewModel: SplashViewModel = SplashViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.getMenu()
    }
    
}

extension SplashViewController: SplashViewModelDelegate {
    func goToHome() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let rootController = Controllers.root.getController()
            self.navigationController?.viewControllers = [rootController]
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
