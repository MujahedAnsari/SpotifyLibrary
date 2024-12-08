//
//  AddPlaylistViewController.swift
//  SpotifyLibrary
//
//  Created by Mujahed Ansari on 08/12/24.
//

protocol AddPlaylistDelegate:  AnyObject {
    func addPlaylist(_ playlist: Playlist)
}


import UIKit

class AddPlaylistViewController: UIViewController {

    weak var delegate: AddPlaylistDelegate?
    
    // MARK: - UI Elements
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Name your playlist."
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "My first library"
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.borderStyle = .none
        textField.textAlignment = .center
        textField.backgroundColor = .clear
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.frame.size.height = 50
        button.backgroundColor = UIColor.green
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        return button
    }()
    
    

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = UIColor.black
        view.addSubview(titleLabel)
        view.addSubview(textField)
        view.addSubview(confirmButton)

        // Constraints for titleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // Constraints for textField
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])

        // Constraints for confirmButton
        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalToConstant: 150),
            confirmButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    // MARK: - Button Action
    @objc private func confirmButtonTapped() {
        guard let playlistName = textField.text, !playlistName.isEmpty else {
            showAlert(message: Constants.nameErrorMessage)
            return
        }
        let newPlaylist = Playlist(title: playlistName, songCount: 0, songs: [])
        print("\(Constants.playlistName) \(playlistName)")
        self.delegate?.addPlaylist(newPlaylist)
        self.dismiss(animated: true)
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: Constants.error, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.ok, style: .default))
        present(alert, animated: true)
    }
}
