//
//  SplashViewController.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 14/04/22.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var logoImage: UIImageView!
    
    var dataFetchComplete: Bool = false
    var isAnimationComplete: Bool = false
    var viewModel: SplashViewModel = SplashViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        setUpUI()
        viewModel.getMenu()
    }
    
    func setUpUI() {
        guard let netflixLogoImage = UIImage.gifImageWithName("netflixGif") else { return }
        
        logoImage.animationImages = netflixLogoImage.images
        logoImage.animationDuration = netflixLogoImage.duration
        logoImage.animationRepeatCount = 1
        logoImage.startAnimating()
        
        Timer.scheduledTimer(withTimeInterval: 4.8, repeats: false) { [weak self] timer in
            guard let strongSelf = self else { return }
            timer.invalidate()
            UIView.animate(withDuration: 0.8) {
                strongSelf.logoImage.alpha = 0.2
            } completion: { bool in
                strongSelf.animationComplete()
            }
        }
    }
    
    func animationComplete() {
        if dataFetchComplete {
            navigateToHome()
        }else {
            isAnimationComplete = true
        }
    }
    
    func navigateToHome() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let rootController = Controllers.root.getController()
            self.navigationController?.viewControllers = [rootController]
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}

extension SplashViewController: SplashViewModelDelegate {
    func goToHome() {
        if self.isAnimationComplete {
            navigateToHome()
        }else {
            self.dataFetchComplete = true
        }
    }
}
