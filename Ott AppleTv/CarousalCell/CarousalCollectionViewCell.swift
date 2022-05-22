//
//  CarousalCollectionViewCell.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 22/05/22.
//

import UIKit

class CarousalCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var playlist: Playlist?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUI()
    }
    
    func setUpUI() {
        collectionView.register(UINib(nibName: "VODCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VODCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configureUI(playlist: Playlist?) {
        self.playlist = playlist
        collectionView.reloadData()
    }
}

extension CarousalCollectionViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playlist?.content?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VODCollectionViewCell", for: indexPath) as? VODCollectionViewCell {
            cell.configureUI(banner: playlist?.content?[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}
extension CarousalCollectionViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
extension CarousalCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height*0.65, height: collectionView.frame.height-20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
