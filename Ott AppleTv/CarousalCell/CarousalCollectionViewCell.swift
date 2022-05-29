//
//  CarousalCollectionViewCell.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 22/05/22.
//

import UIKit

class CarousalCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var carousalTitle: UILabel!
    
    var playlist: Playlist?
    
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        return [collectionView]
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUI()
    }
    
    func setUpUI() {
        self.backgroundColor = UIColor(named: "backGroundColor")
        collectionView.backgroundColor = UIColor(named: "backGroundColor")
        collectionView.register(UINib(nibName: "VODCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VODCollectionViewCell")
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        collectionView.remembersLastFocusedIndexPath = true
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        collectionView.reloadData()
    }
    
    func configureUI(playlist: Playlist?) {
        self.playlist = playlist
        carousalTitle.text = playlist?.title
        collectionView.reloadData()
    }
    
    override var canBecomeFocused: Bool {
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldUpdateFocusIn context: UICollectionViewFocusUpdateContext) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return true
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
        return CGSize(width: VodCellWidth, height: VodCellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
