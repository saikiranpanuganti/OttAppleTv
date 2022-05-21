//
//  Urlhandler.swift
//  Netflix
//
//  Created by SaiKiran Panuganti on 04/03/22.
//

import Foundation

enum Url {
    case config
    case menu
    case home(String)
    
    func getUrl() -> String {
        switch self {
        case .config:
            return "https://0c9hj070ea.execute-api.us-east-1.amazonaws.com/dev/config"
        case .menu:
            return "https://0c9hj070ea.execute-api.us-east-1.amazonaws.com/dev/menu"
        case .home(let homeId):
            return "https://0c9hj070ea.execute-api.us-east-1.amazonaws.com/dev" + homeId
        }
    }
}
