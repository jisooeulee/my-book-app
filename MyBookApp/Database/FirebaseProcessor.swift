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
    func writeReadBookInfo(id: String) {
        let boookItemRef = bookRef.child(id)
        let itemValues: [String: Any] = ["isRead": true]
        
        boookItemRef.setValue(itemValues)
    }
    
    /// 読んだ本かどうかを確認するため、本の情報の有無DBから検索する
    func searchBookInfo(keyword: String, completion: @escaping (_ result: Bool) -> Void) {
        var isRead = false
        bookRef.child(keyword).observeSingleEvent(of: .value) { (snapshot) in
            if snapshot.hasChild("isRead") {
                isRead = true
                completion(isRead)
            } else {
                isRead = false
                completion(isRead)
            }
        }
    }
    
    /// DBにある本の情報を削除する
    func deleteBookInfo(keyword: String) {
        bookRef.child(keyword).removeValue(completionBlock: { (ref, error) in
            if error != nil {
                debugPrint("failed to remove reply")
                return
            }
        })
    }
    
}
