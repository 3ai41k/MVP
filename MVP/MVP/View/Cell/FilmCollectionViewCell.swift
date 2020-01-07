//
//  FilmCollectionViewCell.swift
//  MVP
//
//  Created by Nikita Lizogubov on 07.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit

class FilmCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
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
        }
    }
    
    public func configurate(_ model: Film) {
        nameLabel.text = model.name
        yearLabel.text = model.year
        descriptionLabel.text = model.description
        ratingLabel.text = String(model.raiting)
    }

}
