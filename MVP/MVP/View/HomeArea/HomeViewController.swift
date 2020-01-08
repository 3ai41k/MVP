//
//  HomeViewController.swift
//  MVP
//
//  Created by Nikita Lizogubov on 07.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit

class HomeViewController: HomeNavigationController {

    // MARK: - IBOutlets
    @IBOutlet private weak var filmCollectionView: UICollectionView! {
        didSet {
            filmCollectionView.dataSource = self
            filmCollectionView.delegate = self
            
            filmCollectionView.register(FilmCollectionViewCell.nib, forCellWithReuseIdentifier: Constants.cellReuseIdentifier)
            filmCollectionView.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.headerViewReuseIdentifier)
        }
    }
    
    // MARK: - Public properties
    public var presenter: HomePresenterProtocol?
    
    // MARK: - Private properties
    private var listOfFilms: Array<Film> = Array() {
        didSet {
            filmCollectionView.reloadData()
        }
    }
    private var trailerView: TrailerView? {
        didSet {
            guard let trailerView = trailerView else { return }
            
            // setup action
            trailerView.handleTrailerClick = { [weak self] film in
                self?.presenter?.playFilm(film)
                trailerView.playerAction = .pause
            }
            
            // setup constraints
            view.addSubview(trailerView)
            trailerView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                trailerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8.0),
                trailerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8.0),
                trailerView.widthAnchor.constraint(equalToConstant: 100.0),
                trailerView.heightAnchor.constraint(equalToConstant: 75.0)
            ])
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.fetchFilms()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        trailerView?.playerAction = .play
    }
    
    // MARK: - Private methods
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

// MARK: - HomeViewProtocol
extension HomeViewController: HomeViewProtocol {
    func showFilms(_ films: Array<Film>) {
        listOfFilms = films
        trailerView = TrailerView(films: films)
    }
    
    func showError(_ description: String) {
        print(description)
    }
    
}

// MARK: - UICollectionViewDataSource
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

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = listOfFilms[indexPath.row]
        presenter?.playFilm(film)
        trailerView?.playerAction = .pause
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
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

// MARK: - Constants
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
