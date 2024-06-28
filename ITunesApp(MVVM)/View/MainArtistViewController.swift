//
//  MainArtistViewController.swift
//  iTuneArtist
//
//  Created by Kuldeep Singh on 6/12/24.
//

import UIKit
import MBProgressHUD

//MARK: Main view controller class which shows the artists name in a table view
class MainArtistViewController: UIViewController {
    var hud: MBProgressHUD!

    @IBOutlet weak var mainArtistTableView: UITableView!
//    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var artistSearchBar: UISearchBar!
    
    var viewModel = ArtistDataViewModel(apiClass: ApiClass())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainArtistTableView.dataSource = self
        artistSearchBar.delegate = self
        viewModel.delegate = self
        
    }
    
}

//MARK: Calling FetchData Function
extension MainArtistViewController {
    func loadData(searchTerm: String) {
        hud = MBProgressHUD.showAdded(to: view, animated: true)
        viewModel.fetchData(searchTerm: searchTerm)
//        self.activityIndicator.startAnimating()
    }
}

extension MainArtistViewController: ArtistDataDelegate {
    func didFetchArtistData() {
        DispatchQueue.main.async {
//            self.activityIndicator.stopAnimating()
            self.hud.hide(animated: true, afterDelay: 1)
            self.mainArtistTableView.reloadData()
        }
    }
}

//MARK: TableView Functions
extension MainArtistViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTotalArtists()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = mainArtistTableView.dequeueReusableCell(withIdentifier: Constants.artistCellName.rawValue, for: indexPath) as? ITuneArtistNameCell,
            let artistInfo = viewModel.getArtistInfo(at: indexPath.row) {
                cell.dataRecieved = artistInfo
                return cell
                } else {
                    return UITableViewCell()
                }
    }
}


// MARK: SearchBar Delegate
extension MainArtistViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard var searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        // Replace spaces with "+"
        searchTerm = searchTerm.replacingOccurrences(of: " ", with: "+")
        loadData(searchTerm: searchTerm)
    }
}
