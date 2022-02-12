//
//  MyBookListViewController+TableView.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/09.
//

import UIKit

extension MyBookListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookData.getNumberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.readBookCellIdentifir, for: indexPath) as? ReadBookCell else {
            fatalError(ErrorMessage.cellIdentifier)
        }
        
        // Image以外の情報をSettingする
        let item = bookData.getItem(from: indexPath)
        cell.item = item
        
        // Image情報をSettingする
        guard let imageUrl = item?.volumeInfo.imageLinks?.thumbnail else {
            cell.bookImageView.setImage(imageUrl: ImageUrl.defaultThumbnail)
            return cell
        }
        
        cell.bookImageView.setImage(imageUrl: imageUrl)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let item = bookData.getItem(from: indexPath) else { return }
        
        FirebaseService.shared.deleteBookInfo(item.id)
        bookData.removeItem(indexPath: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    // MARK: - resetTableView
    
    func resetTableView() {
        bookData.removeAllItems()
        tableView.reloadData()
    }
    
}

