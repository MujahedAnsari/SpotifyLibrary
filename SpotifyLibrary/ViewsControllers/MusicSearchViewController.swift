//
//  MusicSearchViewController.swift
//  SpotifyLibrary
//
//  Created by Mujahed Ansari on 08/12/24.
//

import UIKit

class MusicSearchViewController: BaseViewController {
    private let searchController = UISearchController(searchResultsController: nil)
    private var results: [Track] = []

    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.searchMusic
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Constants.searchArtists
        searchController.searchBar.searchTextField.textColor = .white
        searchController.searchBar.delegate = self
        
        navigationItem.searchController = searchController
        definesPresentationContext = true

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellReusableIdentifiers.cell)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear

        view.addSubview(tableView)
        tableView.frame = view.bounds
    }

    private func fetchMusic(query: String) {
        guard !query.isEmpty else { return }
        let urlString = "\(Constants.apiUrl.iTunesUrl)/search?term=\(query)&entity=song"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self, let data = data, error == nil else { return }
            do {
                let trackResult = try JSONDecoder().decode(TrackResult.self, from: data)
                  self.results = trackResult.results
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
            } catch {
                print("\(Constants.failedToDecodeJSON) \(error)")
            }
        }.resume()
    }
}

extension MusicSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text, !query.isEmpty else { return }
        fetchMusic(query: query)
    }
}

extension MusicSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReusableIdentifiers.cell, for: indexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.text = results[indexPath.row].collectionName
        cell.textLabel?.textColor = .white
        return cell
    }
}

extension MusicSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        results = []
        tableView.reloadData()
        self.tabBarController?.selectedIndex = 2
        
    }
}
