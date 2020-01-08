//
//  HomeViewController.swift
//  MVP
//
//  Created by Nikita Lizogubov on 07.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit

class HomeViewController: HomeNavigationController {

    @IBOutlet private weak var filmCollectionView: UICollectionView! {
        didSet {
            filmCollectionView.dataSource = self
            filmCollectionView.delegate = self
            
            filmCollectionView.register(FilmCollectionViewCell.nib, forCellWithReuseIdentifier: Constants.cellReuseIdentifier)
            filmCollectionView.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.headerViewReuseIdentifier)
        }
    }
    
    public var presenter: HomePresenterProtocol?
    
    private var listOfFilms: Array<Film> = Array() {
        didSet {
            filmCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.fetchFilms()
    }
    
    private func countCellWidth() -> CGFloat {
        let totalSpacing = Constants.numberOfItemsPerRow * Constants.cellInset.left + Constants.numberOfItemsPerRow * Constants.cellInset.right
        let cellWidth = (filmCollectionView.bounds.width - totalSpacing) / Constants.numberOfItemsPerRow
        return cellWidth
    }
    
    private func countCellHeight(withModel model: Film) -> CGFloat {
        guard let cell = FilmCollectionViewCell.loadNib else { return .zero }
        let cellMargins = cell.layoutMargins.left + cell.layoutMargins.right
        cell.configurate(model)
        cell.preferredMaxLayoutWidth = countCellWidth() - cellMargins
        let cellHeight = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return cellHeight
    }

}

extension HomeViewController: HomeViewProtocol {
    func showFilms(_ films: Array<Film>) {
        listOfFilms = films
    }
    
    func showError(_ description: String) {
        print(description)
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfFilms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellReuseIdentifier, for: indexPath) as! FilmCollectionViewCell
        let film = listOfFilms[indexPath.row]
        cell.configurate(film)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.headerViewReuseIdentifier, for: indexPath)
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let headerViewWidth = collectionView.bounds.width
        return CGSize(width: headerViewWidth, height: Constants.headerViewHeight)
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let film = listOfFilms[indexPath.row]
        
        let cellWidth = countCellWidth()
        let cellHeight = countCellHeight(withModel: film)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Constants.cellInset
    }
    
}

private extension HomeViewController {
    
    private struct Constants {
        private init() { }
        static let cellReuseIdentifier = "filmCollectionViewCellReuseIdentifier"
        static let headerViewReuseIdentifier = "filmCollectionViewHeaderViewReuseIdentifier"
        static let numberOfItemsPerRow: CGFloat = 2.0
        static let cellInset = UIEdgeInsets(top: 5.0, left: 5.0, bottom: .zero, right: 5.0)
        static let headerViewHeight: CGFloat = 100.0
    }
    
}
