//
//  HomeViewController.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit

class HomeViewController: UIViewController {

    let tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NavigationController & SearchBar & TableView
        setup()
        addViews()
        setConstraints()
    }
    
    func setup() {
        configureNavigationController()
        configureSearchBar()
        configureTableView()
    }
    
    func addViews() {
        view.addSubview(tableView)
    }
    
    func setConstraints() {
        tableViewConstraints()
    }
    
    private func configureNavigationController() {
        navigationItem.title = "📖Find a Book"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
    }
    
    private func configureSearchBar() {
        let searchController = UISearchController()

        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "ex) Rich Dad Poor Dad"
        
        navigationItem.searchController = searchController
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 150
        tableView.separatorStyle = .none
        tableView.register(BookCell.self, forCellReuseIdentifier: "BookCell")
    }
    
    private func tableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

