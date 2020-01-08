//
//  SettingsViewController.swift
//  MVP
//
//  Created by Nikita Lizogubov on 07.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit

class SettingsViewController: SettingsNavigationController {

    // MARK: - IBOutlets
    @IBOutlet weak var settingsTableView: UITableView! {
        didSet {
            settingsTableView.dataSource = self
            settingsTableView.delegate = self
            
            settingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellReuseIdentifier)
        }
    }
    
    // MARK: - Private properties
    private enum SettingsArea {
        case userProfile
        case privacy
        case data
        case saved
        case language
        case askAQuestion
        case logout
        
        public var title: String {
            switch self {
            case .userProfile: return "User Profile"
            case .privacy: return "Privacy"
            case .data: return "Data And Storage"
            case .saved: return "Saved"
            case .language: return "Language"
            case .askAQuestion: return "Ask A Question"
            case .logout: return "Logout"
            }
        }
        
        public var image: UIImage? {
            switch self {
            case .userProfile: return UIImage(systemName: "person.crop.circle")
            case .privacy: return UIImage(systemName: "lock.fill")
            case .data: return UIImage(systemName: "tray.2.fill")
            case .saved: return UIImage(systemName: "star.circle.fill")
            case .language: return UIImage(systemName: "globe")
            case .askAQuestion: return UIImage(systemName: "questionmark.circle.fill")
            case .logout: return nil
            }
        }
        
    }
    private let items: Array<Array<SettingsArea>> = [[.userProfile, .privacy], [.data, .saved, .language], [.askAQuestion], [.logout]]
    
    // MARK: - Public properties
    public weak var presenter: SettingsPresenterProtocol?

}

// MARK: - SettingsViewProtocol
extension SettingsViewController: SettingsViewProtocol {
    
}

// MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = item.title
        cell.imageView?.image = item.image
        cell.backgroundColor = .systemGray6
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}

// MARK: - Constants
private extension SettingsViewController {
    private struct Constants {
        private init() { }
        static let cellReuseIdentifier = "cellReuseIdentifier"
    }
    
}
