//
//  Models.swift
//  Apple itunes
//
//  Created by Al Wefaq on 9/21/19.
//  Copyright © 2019 Al Wefaq. All rights reserved.
//

import UIKit

// MARK: - Feed
struct Feed: Codable {
    let title: String
    let id: String
    let author: Author
    let links: [Link]
    let copyright, country: String
    let icon: String
    let updated: String
    let results: [Result]
}

// MARK: - Author
struct Author: Codable {
    let name: String
    let uri: String
}

// MARK: - Link
struct Link: Codable {
    let linkSelf: String?
    let alternate: String?
    
    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
        case alternate
    }
}

// MARK: - Result
struct Result: Codable {
    let artistName, id, releaseDate, name: String
    let kind: Kind
    let copyright, artistID: String
    let artistURL: String
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
    let contentAdvisoryRating: String?
    
    enum CodingKeys: String, CodingKey {
        case artistName, id, releaseDate, name, kind, copyright
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url, contentAdvisoryRating
    }
}

// MARK: - Genre
struct Genre: Codable {
    let genreID, name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

enum Kind: String, Codable {
    case album = "album"
}
