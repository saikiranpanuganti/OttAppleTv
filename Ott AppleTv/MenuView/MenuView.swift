//
//  MenuView.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 21/05/22.
//

import UIKit

class MenuView: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var selectedIndex: IndexPath = IndexPath(item: 1, section: 0)
    
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        return [tableView]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetUp()
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        xibSetUp()
        setUpUI()
    }
    
    private func xibSetUp() {
        if let view = loadXibFromNib() {
            contentView = view
            contentView.frame = bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            contentView.translatesAutoresizingMaskIntoConstraints = true
            addSubview(view)
        }
    }
    
    private func loadXibFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "MenuView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView
        return view
    }
    
    func setUpUI() {
        contentView.backgroundColor = UIColor(named: "backGroundColor")
        tableView.backgroundColor = UIColor(named: "backGroundColor")
        tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
        tableView.remembersLastFocusedIndexPath = true
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func updateMenuSelection(indexPath: IndexPath, count: Int) {
        for index in 0..<count {
            if index == indexPath.row {
                AppData.shared.menuData?[index].isSelected = true
            }else {
                AppData.shared.menuData?[index].isSelected = false
            }
        }
        tableView.reloadData()
    }
    
    func menuSelected(menu: Menu?) {
        if let menu = menu {
            if menu.type == .home {
                setHomeAsRoot()
            }else if menu.type == .vod {
                navigateToVod(menu: menu)
            }
        }
    }
    
    func setHomeAsRoot() {
        NavigationHandler.setRootHome()
    }
    
    func navigateToVod(menu: Menu) {
        if let controller = Controllers.home.getController() as? HomeViewController {
            controller.viewModel.menu = menu
            if menu.subType == .movies {
                controller.viewModel.homeModel = AppData.shared.moviesData
            }else if menu.subType == .tvshows {
                controller.viewModel.homeModel = AppData.shared.tvShowsData
            }
            NavigationHandler.pushFromSelf(controller: controller)
        }
    }
}

extension MenuView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.shared.menuData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as? MenuTableViewCell {
            cell.configureUI(menu: AppData.shared.menuData?[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension MenuView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndex != indexPath {
            selectedIndex = indexPath
            if let menuCount = AppData.shared.menuData?.count, menuCount > 0 {
                menuSelected(menu: AppData.shared.menuData?[indexPath.row])
                updateMenuSelection(indexPath: indexPath, count: menuCount)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
