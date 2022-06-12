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
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: HomeViewModel = HomeViewModel()
    weak var delegate: HomeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(named: "backGroundColor")
        collectionView.backgroundColor = UIColor(named: "backGroundColor")
        collectionView.register(UINib(nibName: "CarousalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarousalCollectionViewCell")
        collectionView.remembersLastFocusedIndexPath = true
        collectionView.allowsFocus = true
        collectionView.dataSource = self
        collectionView.delegate = self
        
        viewModel.delegate = self
        viewModel.getData()
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    func collectionView(_ collectionView: UICollectionView, shouldUpdateFocusIn context: UICollectionViewFocusUpdateContext) -> Bool {
        return true
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.homeModel?.playlists?.count ?? 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarousalCollectionViewCell", for: indexPath) as? CarousalCollectionViewCell {
            if viewModel.homeModel != nil {
                cell.configureUI(playlist: viewModel.homeModel?.playlists?[indexPath.item])
            }
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: VodCollectionViewHeight)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func updateUI() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
    }
}
