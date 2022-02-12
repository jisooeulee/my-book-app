//
//  HomeViewController+SearchBar.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0,
           bookData.getNumberOfItems() != 0 {
            resetTableView()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        indicator.stopAnimating()
        scrollUp()
        resetTableView()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        configureActivityIndicator()
        indicator.startAnimating()
        scrollUp()
        resetTableView()
        searchBar.resignFirstResponder()
        
        guard let searchText = navigationItem.searchController?.searchBar.text else { return }
        
        api.makeApiRequest(with: searchText)
    }
}
