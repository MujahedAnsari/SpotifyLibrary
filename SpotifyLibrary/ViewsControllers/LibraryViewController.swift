//
//  LibraryViewController.swift
//  SpotifyLibrary
//
//  Created by Mujahed Ansari on 07/12/24.
//

import UIKit

class LibraryViewController: BaseViewController {
    private var playlists: [Playlist] = []
    private var isGridView = true

    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 20
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        return tableView
    }()

    private let switchButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "switchImage"), for: .normal)
        return button
    }()
    
    private let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Your Library"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileView")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let PlayListView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let playListLbl: UILabel = {
        let label = UILabel()
        label.text = "Playlists"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 0.5
        label.textAlignment = .center
        label.layer.cornerRadius = 15
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        playlists = PlaylistManager.shared.loadPlaylists()
        setupUI()
        setAutoLayoutConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        playlists = PlaylistManager.shared.loadPlaylists()
        tableView.reloadData()
        collectionView.reloadData()
    }

    private func setupUI() {
        let addButton = UIBarButtonItem(image: UIImage(named: "plus"), style: .plain, target: self, action: #selector(didTapAdd))
        addButton.tintColor = .white
        navigationItem.setRightBarButton(addButton, animated: true)
        
        switchButton.addTarget(self, action: #selector(didToggleView), for: .touchUpInside)
      
        titleView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        titleLabel.frame = CGRect(x: 50, y: 10, width: titleView.frame.width - 70, height: 30)
        profileImageView.frame = CGRect(x: 0, y: 5, width: 40, height: 40)
        titleView.addSubview(profileImageView)
        titleView.addSubview(titleLabel)
        navigationItem.titleView = titleView
        
        PlayListView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 60)
        PlayListView.addSubview(playListLbl)
        self.view.addSubview(PlayListView)
        self.view.addSubview(switchButton)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width / 2 - 16, height: 200)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 8
        
        // Set up the UICollectionView
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PlaylistCell.self, forCellWithReuseIdentifier: "PlaylistCell")
        
        tableView.register(PlaylistTableViewCell.self, forCellReuseIdentifier: "PlaylistTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear

        view.addSubview(collectionView)
        view.addSubview(tableView)
        

        collectionView.frame = CGRect(x: 0, y: 60, width: view.frame.width, height: view.frame.height - 60)
        tableView.frame = CGRect(x: 0, y: 60, width: view.frame.width, height: view.frame.height - 60)
    } //end function body.
    
    private func setAutoLayoutConstraint() {
        
        PlayListView.translatesAutoresizingMaskIntoConstraints = false
        PlayListView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        PlayListView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        PlayListView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        PlayListView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        PlayListView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
        
        playListLbl.translatesAutoresizingMaskIntoConstraints = false
        playListLbl.leadingAnchor.constraint(equalTo: self.PlayListView.leadingAnchor, constant: 10).isActive = true
        playListLbl.centerYAnchor.constraint(equalTo: self.PlayListView.centerYAnchor, constant: 0).isActive = true
        playListLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        playListLbl.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        switchButton.topAnchor.constraint(equalTo: self.PlayListView.bottomAnchor, constant: 0).isActive = true
        switchButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        switchButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        collectionView.topAnchor.constraint(equalTo: switchButton.bottomAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: self.view.frame.height - 90).isActive = true
        collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: switchButton.bottomAnchor, constant: 0).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: self.view.frame.height - 90).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
    }//end function body


    @objc private func didTapAdd() {
        let viewController = AddPlaylistViewController()
        viewController.delegate = self
        self.present(viewController, animated: true)
    }

    @objc private func didToggleView() {
        isGridView.toggle()
        collectionView.isHidden = !isGridView
        tableView.isHidden = isGridView
    }
} //end class body.

extension LibraryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playlists.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaylistCell", for: indexPath) as! PlaylistCell
        let playlist = playlists[indexPath.item]
        cell.configure(with: playlist)
        return cell
    }
}//end extension body.

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlists.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PlaylistTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PlaylistTableViewCell", for: indexPath) as! PlaylistTableViewCell
        let playlist = playlists[indexPath.item]
        cell.configure(with: playlist)
        return cell
    }
}//end extension body

extension LibraryViewController : AddPlaylistDelegate {
    func addPlaylist(_ playlist: Playlist) {
        self.playlists.append(playlist)
        PlaylistManager.shared.savePlaylists(self.playlists)
        self.collectionView.reloadData()
        self.tableView.reloadData()
    } //end function body
}//end extension
