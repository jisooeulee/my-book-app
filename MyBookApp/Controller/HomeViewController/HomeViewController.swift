//
//  HomeViewController.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit

class HomeViewController: UIViewController {
    
    let searchController = UISearchController()
    let tableView: UITableView = UITableView()
    var indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var bookData: BookDataProcessor = BookDataProcessor()
    
    override func viewDidAppear(_ animated: Bool) {
        setSearchTextFieldProperty(of: searchController)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NavigationController & SearchBar & TableView
        setup()
        addViews()
        setConstraints()
    }
    
    func setup() {
        setHomeViewControllerProperty()
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
    
    private func configureNavigationController() {
        guard let navigationController = navigationController else { return }
        
        setNavigationBarProperty(of: navigationController)
        setNavigationItemProperty()
    }
    
    private func configureSearchBar() {
        searchController.searchBar.delegate = self
        setSearchBarProperty(of: searchController)
        
        navigationItem.searchController = searchController
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        setTableViewProperty(of: tableView)
        
        tableView.register(BookCell.self, forCellReuseIdentifier: Cell.homeCellIdentifier)
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

