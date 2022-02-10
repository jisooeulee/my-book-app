//
//  MyBookListViewController.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/09.
//

import UIKit

class MyBookListViewController: UIViewController {
    
    let tableView: UITableView = UITableView()
    var indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var bookData: BookDataProcessor = BookDataProcessor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        setConstraints()
    }
    
    func setup() {
        configureHomeViewController(view: view)
        configureNavigationController()
        configureTableView()
        configureActivityIndicator()
    }
    
    func addViews() {
        view.addSubview(tableView)
    }
    
    func setConstraints() {
        tableViewConstraints()
    }
    
    private func configureNavigationController() {
        guard let navigationController = navigationController else { return }
        
        configureNavigationBar(of: navigationController)
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 150
        tableView.separatorStyle = .none
        tableView.backgroundColor = ColorTheme.customDarkNavi.color
        
        tableView.register(ReadBookCell.self, forCellReuseIdentifier: Cell.readBookCellIdentifir)
    }
    
    func configureActivityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.style = UIActivityIndicatorView.Style.large
        indicator.color = .systemRed
        indicator.center = self.view.center
        
        view.addSubview(indicator)
    }
    
    // MARK: - Set Constraints
    
    private func tableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}


