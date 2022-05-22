//
//  HomeModel.swift
//  Ott AppleTv
//
//  Created by Saikiran Panuganti on 21/05/22.
//

import Foundation

// MARK: - HomeModel
struct HomeModel: Codable {
    let statusCode: Int?
    let body: HomeBody?
}

// MARK: - HomeBody
struct HomeBody: Codable {
    let data: Home?
}

// MARK: - Home
struct Home: Codable {
    let id: Int?
    let title, type: String?
    let banner: [Banner]?
    let playlists: [Playlist]?
}

// MARK: - Banner
struct Banner: Codable {
    let id: Int?
    let originalLanguage: OriginalLanguage?
    let originalTitle: String?
    let contentType: ContentType?
    let imagery: Imagery?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case contentType = "content_type"
        case imagery, name
    }
}

enum ContentType: String, Codable {
    case movie = "movie"
    case series = "series"
}

// MARK: - Imagery
struct Imagery: Codable {
    let banner, thumbnailV, thumbnailS: String?

    enum CodingKeys: String, CodingKey {
        case banner
        case thumbnailV = "thumbnail_v"
        case thumbnailS = "thumbnail_s"
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
}

// MARK: - Playlist
struct Playlist: Codable {
    let id: Int?
    let title: String?
    let content: [Banner]?
}
