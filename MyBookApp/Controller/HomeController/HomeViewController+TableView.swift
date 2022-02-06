//
//  HomeViewController+TableView.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookData.getNumberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookCell else {
            fatalError("Could not dequeue cell with identifier: BookCell")
        }
        
        let item = bookData.getItem(from: indexPath)
        cell.item = item
        
        guard let imageUrl = item?.volumeInfo.imageLinks?.thumbnail else {
            cell.bookImageView.setImage(imageUrl: "https://books.google.co.jp/googlebooks/images/no_cover_thumb.gif")
            return cell
        }
        
        cell.bookImageView.setImage(imageUrl: imageUrl)
        
        return cell
    }
    
}
