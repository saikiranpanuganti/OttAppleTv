//
//  MenuTableViewCell.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 22/05/22.
//

import UIKit
import SDWebImage

class MenuTableViewCell: UITableViewCell {
    @IBOutlet weak var menuTitle: UILabel!
    @IBOutlet weak var menuImage: UIImageView!
    
    var menu: Menu?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureUI(menu: Menu?) {
        self.menu = menu
        
        menuImage.tintColor = UIColor.darkGray
        self.menuTitle.textColor = UIColor.darkGray
        
        menuTitle.text = menu?.title
        if let imageUrl = menu?.imagery {
            menuImage.sd_setImage(with: URL(string: imageUrl)) { image, error, cache, url in
                self.menuImage.image = image?.withRenderingMode(.alwaysTemplate)
            }
        }
        
        setTintColor()
    }
    
    func setTintColor() {
        if menu?.isSelected ?? false {
            menuImage.tintColor = UIColor.white
            menuTitle.textColor = UIColor.white
        }else {
            menuImage.tintColor = UIColor.darkGray
            menuTitle.textColor = UIColor.darkGray
        }
    }
    
    func configureFocussedState() {
        backgroundColor = UIColor.orange
        menuImage.tintColor = UIColor.white
        menuTitle.textColor = UIColor.white
    }
    
    func configureUnFocussedState() {
        backgroundColor = UIColor(named: "backGroundColor")
        
        setTintColor()
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let cell = context.nextFocusedView as? MenuTableViewCell {
            cell.configureFocussedState()
        }
        
        if let cell = context.previouslyFocusedView as? MenuTableViewCell {
            cell.configureUnFocussedState()
        }
    }
}
