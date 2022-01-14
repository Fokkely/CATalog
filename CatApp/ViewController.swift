//
//  ViewController.swift
//  CatApp
//
//  Created by Анита Самчук on 14.01.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    private var models = [Cat]()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    private func configureModels() {
        let breeds = [" American Bobtail", " Abyssian", "Devon Rex"]
        for breed in breeds {
            models.append(Cat(breed: breed, image: nil))
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TableViewCell.identifier,
            for: indexPath
        ) as? TableViewCell else {return UITableViewCell()}
        
        cell.configure(with: TableViewCellViewModel(with: model))
        return cell
    }


}

