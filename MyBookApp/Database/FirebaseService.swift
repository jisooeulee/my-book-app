//
//  FirebaseService.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/08.
//

import Foundation
import Kingfisher
import Firebase

class FirebaseService {
    
    static let shared = FirebaseService()
    let bookRef = Database.database().reference(withPath: "item")
    
    private init() {}
    
    /// 本の情報をDBに保存する
    func writeReadBookInfo(item: Item) {
        let id = item.id
        let imageLinks = item.volumeInfo.imageLinks?.thumbnail ?? ImageUrl.defaultThumbnail
        let authors = item.volumeInfo.authors ?? [Text.noAuthorInfo]
        let title = item.volumeInfo.title
        let description = item.volumeInfo.description ?? Text.noDescriptionInfo
        
        let boookItemRef = bookRef.child(id)
        let itemValues: [String: Any] = [
            PropertyName.isRead: true,
            PropertyName.id: id,
            PropertyName.imageLinks: [PropertyName.thumbnail: imageLinks],
            PropertyName.title: title,
            PropertyName.authors: authors,
            PropertyName.description: description,
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
    func fetchBookInfo(completion: @escaping (_ result: [Item]?) -> Void) {
        var items: [Item] = []
        
        bookRef.observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: AnyObject] else {
                completion(nil)
                return
            }
            
            for item in value.values {
                let id = item[PropertyName.id] as! String
                
                do {
                    let data = try JSONSerialization.data(withJSONObject: item, options: [])
                    
                    let volumeInfo = try JSONDecoder().decode(VolumeInfo.self, from: data)
                    items.append(Item(id: id, volumeInfo: volumeInfo, saleInfo: nil))
                    
                } catch {
                    print(error)
                }
            }
            completion(items)
        }
    }
    
    /// DBにある本の情報を削除する
    func deleteBookInfo(_ id: String) {
        bookRef.child(id).removeValue()
    }
    
}
