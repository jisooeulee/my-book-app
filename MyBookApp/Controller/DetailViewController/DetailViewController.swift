//
//  DetailViewController.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/07.
//

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
    
    // MARK: - Setup UI
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailView.contentScrollView.contentSize = CGSize(width: view.frame.width, height: 700)
    }
    
    func setup() {
        guard let navigationController = navigationController else { return }
        
        setDetailViewProperty(of: navigationController)
        configureReadCheckButton()
        configureTitleButton()
    }
    
    private func configureReadCheckButton() {
        detailView.readCheckButton.addTarget(self, action: #selector(self.readCheckButtonTapped(_:)), for: .touchUpInside)
    }
    
    private func configureTitleButton() {
        detailView.titleButton.addTarget(self, action: #selector(self.titleButtonTapped(_:)), for: .touchUpInside)
    }
    
    func addViews() {
        view.addSubview(detailView)
    }
    
    func setConstraints() {
        detailViewConstraints()
    }
    
    // MARK: - Set Constraints
    
    private func detailViewConstraints() {
        detailView.translatesAutoresizingMaskIntoConstraints = false
        
        detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        detailView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
