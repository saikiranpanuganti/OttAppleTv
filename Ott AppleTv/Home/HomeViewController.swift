//
//  HomeViewController.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 13/04/22.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func menuTapped()
}

class HomeViewController: UIViewController {
    weak var delegate: HomeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blue
    }
    
    @IBAction func menuTapped() {
        delegate?.menuTapped()
    }
}
