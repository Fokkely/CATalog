//
//  ViewController.swift
//  CatApp
//
//  Created by Анита Самчук on 14.01.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var models = [Cat]()
    let parse = Parser()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parse.getAPI {
            data in
            self.models = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TableViewCell.identifier,
            for: indexPath
        ) as? TableViewCell else {return UITableViewCell()}
        
        cell.configure(with: TableViewCellViewModel(with: models[indexPath.row]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

