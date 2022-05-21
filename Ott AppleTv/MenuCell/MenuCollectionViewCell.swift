//
//  MenuCollectionViewCell.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 21/05/22.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuTitle: UILabel!
    
    func setUpUI() {
        
    }
    
    func configureUI(menu: Menu) {
        menuTitle.text = menu.title
    }
}
