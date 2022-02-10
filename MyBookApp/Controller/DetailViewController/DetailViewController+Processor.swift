//
//  DetailViewController+Processor.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/09.
//

import UIKit
import SafariServices

extension DetailViewController {
    
    func populateUI(_ item: Item) {
        // Image以外の情報をSettingする
        detailView.item = item
        
        // Image情報をSettingする
        setImage()
    }
    
    /// DetailViewにImageをセットする
    func setImage() {
        guard let imageUrl = item.volumeInfo.imageLinks?.thumbnail else {
            self.detailView.mainImageView.setImage(imageUrl: ImageUrl.defaultThumbnail)
            return
        }
        self.detailView.mainImageView.setImage(imageUrl: imageUrl)
    }
    
    /// titleButtonをTapする場合、Google Books Web Pageを表示する
    @objc func titleButtonTapped(_ sender: UITapGestureRecognizer) {
        guard let urlString = item.volumeInfo.googleBooksWebLink else { return }
        guard let url = URL(string: urlString) else { return }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
    
    /// readCheckButtonをTapする場合、iconの切り替え&DB情報を変更
    @objc func readCheckButtonTapped(_ sender: UITapGestureRecognizer) {
        if detailView.readCheckButton.imageView?.image == UIImage(named: Symbols.checked) {
            FirebaseProcessor.shared.deleteBookInfo(keyword: item.id)
            detailView.readCheckButton.setImage(UIImage(named: Symbols.nonChecked), for: .normal)
        } else {
            let imageUrl = item.volumeInfo.imageLinks?.thumbnail ?? ImageUrl.defaultThumbnail
            let authors = item.volumeInfo.authors?.joined(separator: ", ") ?? Text.noInfo
            let title = item.volumeInfo.title ?? Text.noInfo
            let description = item.volumeInfo.description ?? Text.noInfo
            
            FirebaseProcessor.shared.writeReadBookInfo(id: item.id, imageUrl: imageUrl, title: title, authors: authors, description: description)
            detailView.readCheckButton.setImage(UIImage(named: Symbols.checked), for: .normal)
            showDoneAlert()
        }
    }
}
