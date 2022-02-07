//
//  DetailViewController.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/07.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    var item: Item!
    let detailView = DetailView()
    
    convenience init(item: Item) {
        self.init()
        self.item = item
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        setConstraints()
        populateUI(item)
    }
    
    func setup() {
        view.backgroundColor = .white
    }
    
    func addViews() {
        view.addSubview(detailView)
    }
    
    func setConstraints() {
        detailViewConstraints()
    }
    
    private func detailViewConstraints() {
        detailView.translatesAutoresizingMaskIntoConstraints = false
        
        detailView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func populateUI(_ item: Item) {
        // Image以外の情報をSettingする
        detailView.item = item
        
        // Image情報をSettingする
        setImage()
    }
    
    
    // MARK: - Setting an image on DetailView
    
    private func setImage() {
        guard let imageUrl = item.volumeInfo.imageLinks?.thumbnail else {
            self.detailView.mainImageView.setImage(imageUrl: ImageUrl.defaultThumbnail)
            return
        }
        self.detailView.mainImageView.setImage(imageUrl: imageUrl)
    }
    
}
