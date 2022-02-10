//
//  BookProcessor.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/05.
//

import Foundation

class BookDataProcessor {
    
    private var items: [Item]
    
    init(items: [Item] = []) {
        self.items = items
    }
    
    func getNumberOfItems() -> Int {
        return items.count
    }
    
    func addItems(newItems: [Item]) {
        items += newItems
    }
    
    func removeItem(indexPath: Int) {
        items.remove(at: indexPath)
    }
    
    func removeAllItems() {
        items.removeAll()
    }
    
    /// Book Item情報のイメージ以外の情報を取得する
    /// - Parameters:
    ///   - index: 情報取得対象になるBookのIndex Path
    /// - Returns: Item
    func getItem(from indexPath: IndexPath) -> Item? {
        guard let item = items[safe: indexPath.row] else { return nil }
        
        return item
    }
    
}

