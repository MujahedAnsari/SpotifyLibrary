//
//  PlaylistTableViewCell.swift
//  SpotifyLibrary
//
//  Created by Mujahed Ansari on 08/12/24.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {
    
    let thumbnailImageView = UIImageView()
    let titleLabel = UILabel()
    let artistLabel = UILabel()
    let optionsButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        selectionStyle = .none
        
        // Thumbnail Image
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.clipsToBounds = true
        thumbnailImageView.layer.cornerRadius = 4
        contentView.addSubview(thumbnailImageView)
        
        // Title Label
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .white
        contentView.addSubview(titleLabel)
        
        // Artist Label
        artistLabel.font = UIFont.systemFont(ofSize: 14)
        artistLabel.textColor = .lightGray
        contentView.addSubview(artistLabel)
        
        // Options Button
        optionsButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        optionsButton.tintColor = .white
        contentView.addSubview(optionsButton)
        
        // Layout Constraints
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        optionsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            thumbnailImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 50),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: optionsButton.leadingAnchor, constant: -8),
            
            artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            artistLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            artistLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            optionsButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            optionsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            optionsButton.widthAnchor.constraint(equalToConstant: 24),
            optionsButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with song: Song) {
        thumbnailImageView.image = UIImage(named: song.thumbnailUrl)
        titleLabel.text = song.title
        artistLabel.text = song.artist
    }
    
    func configure(with playlist: Playlist) {
     //   imageView.image = UIImage(named: playlist.imageName)
        titleLabel.text = playlist.title
        artistLabel.text = "\(playlist.songCount) songs • \(playlist.title)"
    }
}
