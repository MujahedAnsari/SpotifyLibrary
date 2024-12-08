//
//  Constants.swift
//  SpotifyLibrary
//
//  Created by Mujahed Ansari on 08/12/24.
//

import Foundation

struct Constants {
    static let baseURL = ""
    
    static let imageName = ImageName.self
    static let cellReusableIdentifiers = CellReusableIdentifiers.self
    static let apiUrl = ApiUrls.self
    
    static let  ellipsis  = "ellipsis"
    static let  storageKey =  "playlists"
    static let  nameErrorMessage = "Please enter a name for your playlist."
    static let playlistName = "Playlist Name"
    static let  error = "Error"
    static let ok = "OK"
    static let playlist = "Playlist"
    static let yourLibrary  = "Your Library"
    static let playlists = "Playlists"
    static let search = "Search"
    static let searchResults = "Search Results"
    static let searchPlaceholder = "Search..."
    static let home = "Home"
    static let library = "Library"
    static let searchMusic = "Search Music"
    static let searchArtists = "Search Songs, Artists..."
    static let failedToDecodeJSON = "Failed to decode JSON: "
}

struct ImageName {
    static let switchImage = "switchImage"
    static let profileView = "profileView"
    static let plus = "plus"
    static let housefill = "house.fill"
    static let magnifyingglass = "magnifyingglass"
    static let booksVerticalFill = "books.vertical.fill"
}

struct CellReusableIdentifiers {
    static let playlistCell = "PlaylistCell"
    static let playlistTableViewCell = "PlaylistTableViewCell"
    static let cell = "cell"
    
}

struct ApiUrls {
    static let iTunesUrl = "https://itunes.apple.com"
}
