//
//  ListViewController.swift
//  teladocApp
//
//  Created by Alex Apostol on 4/4/22.
//  
//

import UIKit

class ListViewController: UIViewController {
    
    let presenter: ListPresenterProtocol
    
    private var content: [DestinationsResult] = [DestinationsResult]() {
        didSet {
            self.reloadTableView()
        }
    }
    
    private var filteredContent: [DestinationsResult] = [DestinationsResult]()
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.register(ListCell.self, forCellReuseIdentifier: String(describing: ListCell.self))
        view.dataSource = self
        view.delegate = self
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    lazy var searchController: UISearchController = {
        let searchView = UISearchController(searchResultsController: nil)
        searchView.hidesNavigationBarDuringPresentation = true
        searchView.obscuresBackgroundDuringPresentation = false
        searchView.searchBar.sizeToFit()
        searchView.searchBar.barStyle = .black
        searchView.searchBar.backgroundColor = .clear
        searchView.searchBar.placeholder = "Filtrar destinos"
        searchView.searchResultsUpdater = self
        return searchView
    }()
        
    init (presenter: ListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "List"
        view.backgroundColor = .white
        setUpTableViewLayout()
        manageSearchBarController()
        presenter.viewDidLoad()
    }
    
    private func setUpTableViewLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    private func manageSearchBarController() {
        let searchBar = searchController.searchBar
        searchController.delegate = self
        tableView.tableHeaderView = searchBar
        tableView.contentOffset = CGPoint(x: 0.0, y: searchBar.frame.size.height)
        
    }
    
    private func filterContentForSearchText(_ searchText: String,
                                            category: DestinationsResult? = nil) {
        filteredContent = content.filter({ destination in
            let destinationName = destination.name ?? ""
            return destinationName.lowercased().contains(searchText.lowercased())
        })
      
        reloadTableView()
    }

    private func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension ListViewController: ListViewProtocol{
    func show(content: [DestinationsResult]) {
        self.content = content
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredContent.count
        } else {
            return  self.content.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: DestinationsResult
        
        if searchController.isActive && searchController.searchBar.text != "" {
            item = filteredContent[indexPath.row]
        } else {
            item = content[indexPath.row]
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListCell.self), for: indexPath) as? ListCell else {return UITableViewCell()}
        cell.configure(address: item.name ?? "", imageUrl: item.cover ?? "")
        return cell
    }
}

extension ListViewController: UISearchControllerDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.isActive = false
        reloadTableView()
    }
}


extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
   
}
