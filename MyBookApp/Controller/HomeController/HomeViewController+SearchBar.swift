//
//  HomeViewController+SearchBar.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit
import Alamofire

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let indexPath = IndexPath(row: NSNotFound, section: 0)
        self.tableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
        searchBar.resignFirstResponder()
        
        bookData.removeAllItems()
        
        fetchBookList { [weak self] result in
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
    
    // TODO: Refactoringすること（Network Folderに定義すること）
    func fetchBookList(completionHandler: @escaping (Result<Book, Error>) -> Void) {
        guard let searchText = navigationItem.searchController?.searchBar.text else { return }
        
        // TODO: ハードコーディングをRefactoringすること
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(searchText)"
        guard let encodedURL = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            //Invalid URL
            return
        }
        
        AF.request(encodedURL, method: .get).responseData { response in
            switch response.result {
            case let .success(data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(Book.self, from: data)
                    
                    completionHandler(.success(result))
                } catch {
                    completionHandler(.failure(error))
                }
                
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
    
    private func resetTableView() {
        bookData.removeAllItems()
        tableView.reloadData()
    }
}
