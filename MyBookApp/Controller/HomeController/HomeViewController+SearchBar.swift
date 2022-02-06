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
        scrollUp()
        resetTableView()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        scrollUp()
        resetTableView()
        searchBar.resignFirstResponder()
        
        guard let searchText = navigationItem.searchController?.searchBar.text else { return }
        
        GoogleBooksApiService.shared.fetchBookList(searchText: searchText) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(result):
                self.bookData.addItems(newItems: result.items)
                self.tableView.reloadData()
                
            case let .failure(error):
                // TODO: Error Handlingを追加すること
                debugPrint("failure \(error)")
            }
        }
    }
    
    private func resetTableView() {
        bookData.removeAllItems()
        tableView.reloadData()
    }
    
    private func scrollUp() {
        let indexPath = IndexPath(row: NSNotFound, section: 0)
        self.tableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
    }
}
