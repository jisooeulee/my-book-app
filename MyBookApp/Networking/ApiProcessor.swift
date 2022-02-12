//
//  ApiProcessor.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/12.
//

import UIKit

protocol ApiRequestDelegate: AnyObject {
    func didReceiveResponse(_ result: Book)
    func didFailToRequest()
}

class ApiProcessor {
    
    /// Delegate
    weak var apiRequestDelegate: ApiRequestDelegate?
    
    ///サーバーに送るGoogle Api Request情報を生成する
    /// - Parameters:
    ///   - searchText: 検索キーワード
    /// - Returns: Void
    func makeApiRequest(with searchText: String) {
        GoogleBooksApiService.shared.fetchBookList(searchText: searchText) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(result):
                self.apiRequestDelegate?.didReceiveResponse(result)
                
            case .failure(_:):
                self.apiRequestDelegate?.didFailToRequest()
            }
        }
    }
}
