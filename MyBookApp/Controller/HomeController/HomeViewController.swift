//
//  HomeViewController.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit

class HomeViewController: UIViewController {
    
    let tableView: UITableView = UITableView()
    var indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var bookData: BookDataProcessor = BookDataProcessor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NavigationController & SearchBar & TableView
        setup()
        addViews()
        setConstraints()
    }
    
    func setup() {
        configureView()
        configureNavigationController()
        configureSearchBar()
        configureTableView()
        configureActivityIndicator()
    }
    
    func addViews() {
        view.addSubview(tableView)
    }
    
    func setConstraints() {
        tableViewConstraints()
    }
    
    private func configureView() {
        view.backgroundColor = ColorTheme.customYellow.color
    }
    
    private func configureNavigationController() {
        navigationItem.title = Text.navigationItemTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureSearchBar() {
        let searchController = UISearchController()
        
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = .systemBackground
        searchController.searchBar.placeholder = Text.searchBarPlaceholder
        
        navigationItem.searchController = searchController
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 150
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
        tableView.register(BookCell.self, forCellReuseIdentifier: Cell.cellIdentifier)
    }
    
    func configureActivityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.style = UIActivityIndicatorView.Style.large
        indicator.color = .systemRed
        indicator.center = self.view.center
        
        view.addSubview(indicator)
    }
    
    private func tableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

