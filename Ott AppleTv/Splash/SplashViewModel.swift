//
//  SplashViewModel.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 14/04/22.
//

import Foundation

protocol SplashViewModelDelegate: BaseViewModelDelegate {
    func goToHome()
}

class SplashViewModel {
    weak var delegate: SplashViewModelDelegate?
    
    func getMenu() {
        NetworkAdaptor.requestWithHeaders(urlString: Url.menu.getUrl(), method: .get) { [weak self] data, response, error in
            guard let self = self else { return }
            if let data = data {
                do {
                    let menu = try JSONDecoder().decode(MenuModel.self, from: data)
                    AppData.shared.menuData = menu.body?.data
                    print(AppData.shared.menuData?.count)
                    for menu in AppData.shared.menuData ?? [] {
                        if menu.type == .home {
                            self.getHome(menu: menu)
                            break
                        }
                    }
                }catch {
                    let jsonError = try? JSONSerialization.jsonObject(with: data)
                    print("MenuModel: ", jsonError as Any)
                }
            }
        }
    }
    
    func getHome(menu: Menu) {
        NetworkAdaptor.requestWithHeaders(urlString: Url.home(menu.url ?? "").getUrl(), method: .get) { [weak self] data, response, error in
            guard let self = self else { return }
            if let data = data {
                do {
                    let home = try JSONDecoder().decode(HomeModel.self, from: data)
                    AppData.shared.homeData = home.body?.data
                    print(AppData.shared.homeData?.title)
                    self.delegate?.goToHome()
                }catch {
                    let jsonError = try? JSONSerialization.jsonObject(with: data)
                    print("HomeModel: ", jsonError as Any)
                }
            }
        }
    }
}
