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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.cellIdentifier, for: indexPath) as? BookCell else {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedItem = bookData.getItem(from: indexPath) else { return }
        
        let vc = DetailViewController(item: selectedItem)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
