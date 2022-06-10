//
//  MenuModel.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 21/05/22.
//

import Foundation

// MARK: - MenuModel
struct MenuModel: Codable {
    let statusCode: Int?
    let body: MenuBody?
}

// MARK: - MenuBody
struct MenuBody: Codable {
    let total: Int?
    let data: [Menu]?
}

// MARK: - MenuData
struct Menu: Codable {
    let id: Int?
    let title: String?
    let type: MenuType?
    let imagery: String?
    let url: String?
    let active, guestModeActive: Bool?
    var isSelected: Bool? = false
}

enum MenuType: String, Codable {
    case search = "Search"
    case home = "Home"
    case vod = "VOD"
    case epg = "Epg"
    case liveTv = "LiveTv"
    case watchlist = "Watchlist"
    case rewind = "Rewind"
    case discover = "Discover"
    case settings = "Settings"
}
