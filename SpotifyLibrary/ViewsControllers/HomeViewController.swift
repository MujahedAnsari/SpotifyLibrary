//
//  HomeViewController.swift
//  SpotifyLibrary
//
//  Created by Mujahed Ansari on 07/12/24.
//

import UIKit

class HomeViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
      //  view.backgroundColor = .black
       // title = ""

        let gridView = UIStackView()
        gridView.axis = .vertical
        gridView.spacing = 10
        gridView.translatesAutoresizingMaskIntoConstraints = false

        for i in 1...6 {
            let playlistView = UIView()
            playlistView.backgroundColor = .gray
            playlistView.layer.cornerRadius = 10
            playlistView.heightAnchor.constraint(equalToConstant: 100).isActive = true

            let label = UILabel()
            label.text = "Playlist \(i)"
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false

            playlistView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: playlistView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: playlistView.centerYAnchor).isActive = true

            gridView.addArrangedSubview(playlistView)
        }

        view.addSubview(gridView)

        NSLayoutConstraint.activate([
            gridView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            gridView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            gridView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
