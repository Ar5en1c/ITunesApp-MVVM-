//
//  MainArtistViewController.swift
//  iTuneArtist
//
//  Created by Kuldeep Singh on 6/12/24.
//

import UIKit

//MARK: Main view controller class which shows the artists name in a table view
class MainArtistViewController: UIViewController {

    @IBOutlet weak var mainArtistTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var artistSearchBar: UISearchBar!
    
    var viewModel = ArtistDataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainArtistTableView.dataSource = self
        artistSearchBar.delegate = self
        viewModel.delegate = self
        loadData(searchTerm: "")
    }
    
}

//MARK: Calling FetchData Function
extension MainArtistViewController {
    func loadData(searchTerm: String) {
        activityIndicator.startAnimating()
        viewModel.fetchData(searchTerm: searchTerm)
    }
}

extension MainArtistViewController: ArtistDataDelegate {
    func didFetchArtistData() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
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
