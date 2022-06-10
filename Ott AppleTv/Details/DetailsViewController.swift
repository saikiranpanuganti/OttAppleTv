//
//  DetailsViewController.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 29/05/22.
//

import UIKit

class DetailsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.orange
        overrideMenuTap = true
    }

    override func menuTapped() {
        NavigationHandler.popFromRoot(animated: true)
    }
}
