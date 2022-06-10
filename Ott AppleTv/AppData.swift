//
//  AppData.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 21/05/22.
//

import Foundation

class AppData {
    static let shared: AppData = AppData()
    
    var menuData: [Menu]?
    var homeData: Home?
    var moviesData: Home?
    var tvShowsData: Home?
}
