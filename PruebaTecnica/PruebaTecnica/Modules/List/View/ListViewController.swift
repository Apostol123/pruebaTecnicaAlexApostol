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
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
           
        }
    }
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.register(ListCell.self, forCellReuseIdentifier: String(describing: ListCell.self))
        view.dataSource = self
        view.delegate = self
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        return view
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
        presenter.viewDidLoad()
    }
    
    private func setUpTableViewLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
}

extension ListViewController: ListViewProtocol{
    func show(content: [DestinationsResult]) {
        self.content = content
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = content[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListCell.self), for: indexPath) as? ListCell else {return UITableViewCell()}
        cell.configure(address: item.address ?? "", imageUrl: item.cover ?? "")
        return cell
    }
    
    
}
