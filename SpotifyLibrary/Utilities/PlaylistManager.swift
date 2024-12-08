//
//  PlaylistManager.swift
//  SpotifyLibrary
//
//  Created by Mujahed Ansari on 08/12/24.
//

import Foundation

class PlaylistManager {
    static let shared = PlaylistManager()
    private let storageKey = Constants.storageKey
    
    private init() {}

    func savePlaylists(_ playlists: [Playlist]) {
        if let data = try? JSONEncoder().encode(playlists) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }

    func loadPlaylists() -> [Playlist] {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let playlists = try? JSONDecoder().decode([Playlist].self, from: data) else {
            return []
        }
        return playlists
    }
}

