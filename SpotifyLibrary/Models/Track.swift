//
//  Track.swift
//  SpotifyLibrary
//
//  Created by Mujahed Ansari on 08/12/24.
//

import Foundation

struct Track: Codable {
    
    let wrapperType: String
    let kind: String
    let artistId: Int
    let collectionId: Int
    let trackId: Int
    let artistName: String
    let collectionName: String
    let trackName: String
    let collectionCensoredName: String
    let trackCensoredName: String
    let artistViewUrl: String
    let collectionViewUrl: String
    let trackViewUrl: String
    let previewUrl: String
    let artworkUrl30: String
    let artworkUrl60: String
    let artworkUrl100: String
    let collectionPrice: Double
    let trackPrice: Double
    let releaseDate: String
    let collectionExplicitness: String
    let trackExplicitness: String
    let discCount: Int
    let discNumber: Int
    let trackCount: Int
    let trackNumber: Int
    let trackTimeMillis: Int
    let country: String
    let currency: String
    let primaryGenreName: String
    let isStreamable: Bool
}

struct TrackResult : Codable {
    let resultCount : Int
    let results: [Track]
}
