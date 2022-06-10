//
//  HomeViewModel.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 10/06/22.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func updateUI()
}

class HomeViewModel {
    var menu: Menu?
    var homeModel: Home?
    weak var delegate: HomeViewModelDelegate?
    
    func getData() {
        if let _ = homeModel {
            delegate?.updateUI()
        }else {
            guard let menu = menu else { return }
            getHome(menu: menu)
        }
    }
    
    func getHome(menu: Menu) {
        NetworkAdaptor.requestWithHeaders(urlString: Url.home(menu.url ?? "").getUrl(), method: .get) { [weak self] data, response, error in
            guard let self = self else { return }
            if let data = data {
                do {
                    let home = try JSONDecoder().decode(HomeModel.self, from: data)
                    if menu.subType == .movies {
                        AppData.shared.moviesData = home.body?.data
                    }else if menu.subType == .tvshows {
                        AppData.shared.tvShowsData = home.body?.data
                    }
                    
                    self.homeModel = home.body?.data
                    self.delegate?.updateUI()
                }catch {
                    let jsonError = try? JSONSerialization.jsonObject(with: data)
                    print("HomeModel: ", jsonError as Any)
                }
            }
        }
    }
}
