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
    
    // MARK: - Setup UI

    func setup() {
        setBackgroundColor(ViewControllerName.myBookListViewController)
        setNavigationProperty(of: nil, ViewControllerName.myBookListViewController)
        
        configureTableView()
        configureActivityIndicator()
    }
    
    func addViews() {
        view.addSubview(tableView)
    }
    
    func setConstraints() {
        tableViewConstraints()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        setTableViewProperty(of: tableView)
        
        tableView.register(ReadBookCell.self, forCellReuseIdentifier: Cell.readBookCellIdentifir)
    }
    
    func configureActivityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        setIndicatorProperty(of: indicator)
        
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


