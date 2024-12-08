//
//  Playlist.swift
//  SpotifyLibrary
//
//  Created by Mujahed Ansari on 07/12/24.
//

import Foundation

struct Playlist: Codable {
    let title : String
    let songCount: Int
    var songs: [Song]?
   }

struct Song : Codable {
       let title: String
       let artist: String
       let thumbnailUrl: String
   }


struct Playlist1: Codable {
    let name : String
    let songs: Int
    let owner: String
    let imageName: String
   }
