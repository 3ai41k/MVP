//
//  FilmCollectionViewCell.swift
//  MVP
//
//  Created by Nikita Lizogubov on 07.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit

class FilmCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 5.0
            containerView.layer.shadowColor = UIColor.systemGray.cgColor
            containerView.layer.shadowRadius = 2.0
            containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
            containerView.layer.shadowOpacity = 1.0
        }
    }
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ImageView: UIImageView! {
        didSet {
            ImageView.layer.cornerRadius = 5.0
        }
    }
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    public static var loadNib: FilmCollectionViewCell? {
        let name = String(describing: FilmCollectionViewCell.self)
        let cell = Bundle.main.loadNibNamed(name,
                                            owner: nil,
                                            options: nil)?.first as? FilmCollectionViewCell
        return cell
    }
    
    public var preferredMaxLayoutWidth: CGFloat = .zero {
        didSet {
            descriptionLabel.preferredMaxLayoutWidth = preferredMaxLayoutWidth
            nameLabel.preferredMaxLayoutWidth = preferredMaxLayoutWidth
        }
    }
    
    public func configurate(_ model: Film) {
        nameLabel.text = model.name
        ImageView.image = UIImage(named: model.imageName)
        yearLabel.text = String(model.year)
        descriptionLabel.text = model.description
        ratingLabel.text = String(model.raiting)
    }

}
