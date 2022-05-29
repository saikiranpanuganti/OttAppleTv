//
//  VODCollectionViewCell.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 22/05/22.
//

import UIKit
import SDWebImage

class VODCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var vodImage: UIImageView!
    
    func configureUI(banner: Banner?) {
        vodImage.sd_setImage(with: URL(string: banner?.imagery?.thumbnailV ?? ""))
    }
    
    func configureUI(image: String) {
        vodImage.image = UIImage(named: image)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let cell = context.nextFocusedView as? VODCollectionViewCell {
            cell.transform = CGAffineTransform(scaleX: 1.12, y: 1.12)
            cell.layer.borderColor = UIColor.orange.cgColor
            cell.layer.borderWidth = 3.0
        }
        
        if let cell = context.previouslyFocusedView as? VODCollectionViewCell {
            cell.transform = .identity
            cell.layer.borderColor = UIColor.clear.cgColor
        }
    }
}
