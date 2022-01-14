//
//  ViewController.swift
//  CatApp
//
//  Created by Анита Самчук on 14.01.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var models = [Cat]()
    
    let parser = Parser()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parser.parse {
            data in
            self.models = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
//        configureModels()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
//    private func configureModels() {
//        let breeds = [" American Bobtail", " Abyssian", " Devon Rex"]
//        for breed in breeds {
//            models.append(Cat(breed: breed, image: nil))
//        }
//    }
//
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


}

