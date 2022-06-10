//
//  DiscoverMoreViewController.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 08/06/22.
//

import UIKit

class DiscoverMoreViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        overrideMenuTap = true
    }

    override func menuTapped() {
        NavigationHandler.popFromSelf(animated: true)
    }
}
