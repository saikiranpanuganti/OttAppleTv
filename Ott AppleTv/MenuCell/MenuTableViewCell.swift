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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureUI(menu: Menu?) {
        menuTitle.text = menu?.title
        if let imageUrl = menu?.imagery {
            menuImage.sd_setImage(with: URL(string: imageUrl))
        }
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let cell = context.nextFocusedView as? MenuTableViewCell {
            cell.backgroundColor = UIColor.orange
        }
        
        if let cell = context.previouslyFocusedView as? MenuTableViewCell {
            cell.backgroundColor = UIColor(named: "backGroundColor")
        }
    }
}
