//
//  GoogleBooksApiService.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/05.
//

import UIKit
import Alamofire

class GoogleBooksApiService {
    
    static let shared = GoogleBooksApiService()
    
    private init() {}
    
    func fetchBookList(searchText: String, completionHandler: @escaping (Result<Book, Error>) -> Void) {
        let urlString = Api.requestUrl + searchText + Api.maxResultParam
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
    
}
