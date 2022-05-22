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
}
