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
    
    
    var viewModel = ArtistDataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainArtistTableView.dataSource = self
        viewModel.delegate = self
        loadData()
    }
    
}

//MARK: Calling FetchData Function
extension MainArtistViewController {
    func loadData() {
        activityIndicator.startAnimating()
        viewModel.fetchData()
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


