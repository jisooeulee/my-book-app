//
//  HomeViewController+ApiRequestProcessor.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/12.
//

import UIKit

extension HomeViewController: ApiRequestDelegate {
    
    func didFailToRequest() {
        indicator.stopAnimating()
        showNoDataAlert()
    }
    
    func didReceiveResponse(_ result: Book) {
        indicator.stopAnimating()
        bookData.addItems(newItems: result.items)
        tableView.reloadData()
    }
}
