//
//  PlaylistCell.swift
//  SpotifyLibrary
//
//  Created by Mujahed Ansari on 08/12/24.
//

import UIKit

class PlaylistCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let detailLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Image View
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        contentView.addSubview(imageView)
        
        // Name Label
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.textColor = .white
        contentView.addSubview(nameLabel)
        
        // Detail Label
        detailLabel.font = UIFont.systemFont(ofSize: 14)
        detailLabel.textColor = .lightGray
        contentView.addSubview(detailLabel)
        
        // Layout Constraints
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            detailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with playlist: Playlist) {
     //   imageView.image = UIImage(named: playlist.imageName)
        nameLabel.text = playlist.title
        detailLabel.text = "\(playlist.songCount) songs • \(playlist.title)"
    }
}
