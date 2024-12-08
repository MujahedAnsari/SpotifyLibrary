//
//  MusicSearchViewController.swift
//  SpotifyLibrary
//
//  Created by Mujahed Ansari on 07/12/24.
//

import UIKit

class MusicSearchViewController: BaseViewController {
    private let searchController = UISearchController(searchResultsController: nil)
    private var results: [String] = []

    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search Music"
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Songs, Artists..."
        searchController.searchBar.searchTextField.textColor = .white
        navigationItem.searchController = searchController
        definesPresentationContext = true

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear

        view.addSubview(tableView)
        tableView.frame = view.bounds
    }

    private func fetchMusic(query: String) {
        guard !query.isEmpty else { return }
        let urlString = "https://itunes.apple.com/search?term=\(query)&entity=song"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self, let data = data, error == nil else { return }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any],
                   let results = json["results"] as? [[String: Any]] {
                    self.results = results.compactMap { $0["trackName"] as? String }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            } catch {
                print("Failed to decode JSON: \(error)")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = results[indexPath.row]
        return cell
    }
}
