//
//  FirebaseProcessor.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/08.
//

import Foundation
import Kingfisher
import Firebase

class FirebaseProcessor {
    
    static let shared = FirebaseProcessor()
    let bookRef = Database.database().reference(withPath: "item")
    
    private init() {}
    
    /// 本の情報をDBに保存する
    func writeReadBookInfo(id: String, imageUrl: String, title: String, authors: String, description: String) {
        let boookItemRef = bookRef.child(id)
        let itemValues: [String: Any] = [
            PropertyName.isRead: true, PropertyName.id: id, PropertyName.imageUrl: imageUrl, PropertyName.title: title, PropertyName.authors: authors, PropertyName.description: description,
        ]
        
        boookItemRef.setValue(itemValues)
    }
    
    /// 読んだ本かどうかを確認するため、本の情報の有無DBから検索する
    func searchBookInfo(_ id: String, completion: @escaping (_ result: Bool) -> Void) {
        var isRead = false
        bookRef.child(id).observeSingleEvent(of: .value) { (snapshot) in
            if snapshot.hasChild(PropertyName.isRead) {
                isRead = true
                completion(isRead)
            } else {
                isRead = false
                completion(isRead)
            }
        }
    }
    
    /// 読んだ本のリストを取得する
    func fetchBookInfo(completion: @escaping (_ result: [Item]) -> Void) {
        var items: [Item] = []
        
        bookRef.observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: AnyObject] else {
                completion(items)
                return
            }
            
            for volumeInfo in value.values {
                let id = volumeInfo[PropertyName.id] as! String
                let imageUrl = volumeInfo[PropertyName.imageUrl] as! String
                let title = volumeInfo[PropertyName.title] as! String
                let authors = volumeInfo[PropertyName.authors] as! String
                let description = volumeInfo[PropertyName.description] as! String
                
                let volumesInfo = VolumeInfo(title: title, authors: [authors], publishedDate: nil, imageLinks: ImageLinks(smallThumbnail: nil, thumbnail: imageUrl), description: description, googleBooksWebLink: nil, categories: nil, publisher: nil, pageCount: nil)
                
                let item = Item(id: id, volumeInfo: volumesInfo, saleInfo: nil)
                items.append(item)
            }
            completion(items)
        }
    }
    
    /// DBにある本の情報を削除する
    func deleteBookInfo(_ id: String) {
        bookRef.child(id).removeValue()
    }
    
}
